
// ── AUTH GUARD ──
if (sessionStorage.getItem('vp_employer_auth') !== 'true') {
  window.location.replace('employer-login.html');
  throw new Error('Not authenticated – redirecting to login.');
}

// Archive expired jobs on load
VPStore.Jobs.archiveExpired();

// ── MESSAGES STORE ──
// Employer writes to 'vp_employer_messages'
// Candidate dashboard reads from same key to show employer messages in tracker
const MSG_KEY = 'vp_employer_messages';
function loadMessages()  { try { return JSON.parse(localStorage.getItem(MSG_KEY)) || {}; } catch { return {}; } }
function saveMessages(m) { localStorage.setItem(MSG_KEY, JSON.stringify(m)); }

let messages     = loadMessages();
let activeChatId = null;

// ── PAGE TITLES ──
const pgTitles = {
  'dashboard':     ['Dashboard',              'Overview of hiring activity'],
  'post-job':      ['Post & Manage Jobs',     'Create and manage job listings'],
  'candidates':    ['Candidate Database',     'Review and process applications'],
  'communication': ['Communication',          'Message candidates'],
  'shortlist':     ['Shortlisted Candidates', 'Full profiles of shortlisted applicants'],
  'prev-jobs':     ['Previous Jobs',          'Archive of expired & deleted postings'],
};

// ── NAVIGATION ──
function navTo(page) {
  const el = document.querySelector('.dn-item[data-page="' + page + '"]');
  nav(page, el);
}

function nav(page, el) {
  document.querySelectorAll('.dn-item').forEach(i => i.classList.remove('active'));
  if (el) el.classList.add('active');
  document.querySelectorAll('.pg').forEach(p => p.classList.remove('active'));
  const pgEl = document.getElementById('pg-' + page);
  if (pgEl) pgEl.classList.add('active');
  const t = pgTitles[page] || [page, ''];
  document.getElementById('dt-title').textContent = t[0];
  document.getElementById('dt-crumb').textContent = 'Aivirtrix · ' + t[1];
  renderPage(page);
}

function renderPage(p) {
  if (p === 'dashboard')     renderDashboard();
  if (p === 'post-job')      renderPostedJobs();
  if (p === 'candidates')    renderCandidates();
  if (p === 'communication') renderComm();
  if (p === 'shortlist')     renderShortlist();
  if (p === 'prev-jobs')     renderHistory();
  updateBadges();
}

// ── BADGES ──
function updateBadges() {
  messages = loadMessages();
  const jobs  = VPStore.Jobs.getActive();
  const cands = VPStore.Applications.getAll().filter(a => !['withdrawn','job_deleted'].includes(a.status));
  const hist  = VPStore.Jobs.getHistory();
  const slCount = cands.filter(a => a.status === 'shortlisted').length;
  const convs   = VPStore.Applications.getAll().filter(a =>
    a.status === 'shortlisted' || a.status === 'rejected' || messages[a.id]
  ).length;
  setBadge('badge-jobs',      jobs.length);
  setBadge('badge-cands',     cands.length);
  setBadge('badge-msgs',      convs);
  setBadge('badge-hist',      hist.length);
  setBadge('badge-shortlist', slCount);
}
function setBadge(id, n) {
  const el = document.getElementById(id);
  if (!el) return;
  el.textContent = n;
  el.classList.toggle('hidden', n === 0);
}

// ── DASHBOARD ──
function renderDashboard() {
  const now  = new Date();
  const jobs = VPStore.Jobs.getAll();
  const apps = VPStore.Applications.getAll().filter(a => !['withdrawn','job_deleted'].includes(a.status));
  document.getElementById('s-active').textContent = jobs.filter(j => j.status === 'active' && new Date(j.deadline) >= now).length;
  document.getElementById('s-apps').textContent   = apps.length;
  document.getElementById('s-short').textContent  = apps.filter(a => a.status === 'shortlisted').length;
  document.getElementById('s-hist').textContent   = VPStore.Jobs.getHistory().length;

  // Active jobs table
  const active = VPStore.Jobs.getActive();
  const tbl = document.getElementById('dash-jobs-table');
  if (!active.length) {
    tbl.innerHTML = '<div class="empty-state"><div class="ei">📭</div><p>No active jobs.<br>Click <strong>Post a Job</strong> to start.</p></div>';
  } else {
    let html = '<table><thead><tr><th>Job Title</th><th>Dept</th><th>Type</th><th>Posted</th><th>Deadline</th><th>Applicants</th><th>Status</th><th>Actions</th></tr></thead><tbody>';
    active.forEach(j => {
      const dLeft  = Math.ceil((new Date(j.deadline) - now) / 86400000);
      const pClass = dLeft <= 7 ? 'pill-amber' : 'pill-green';
      const pText  = dLeft <= 7 ? dLeft + 'd left' : 'Active';
      html += `<tr>
        <td><strong>${j.title}</strong></td>
        <td>${j.dept||'—'}</td><td>${j.type||'—'}</td>
        <td style="font-family:monospace;font-size:.72rem">${j.postedDate}</td>
        <td style="font-family:monospace;font-size:.72rem">${j.deadline}</td>
        <td><strong>${j.applicants||0}</strong></td>
        <td><span class="pill ${pClass}">${pText}</span></td>
        <td><div style="display:flex;gap:.4rem">
          <button class="btn btn-ghost btn-sm" onclick="nav('candidates',document.querySelector('[data-page=candidates]'));setTimeout(()=>{document.getElementById('filter-job').value='${j.id}';renderCandidates();},80)">View Applicants</button>
          <button class="btn btn-danger btn-sm" onclick="doDeleteJob('${j.id}')">Delete</button>
        </div></td>
      </tr>`;
    });
    html += '</tbody></table>';
    tbl.innerHTML = html;
  }

  // Recent applications
  const recent = [...apps].reverse().slice(0, 6);
  const ra = document.getElementById('dash-recent-apps');
  if (!recent.length) {
    ra.innerHTML = '<div class="empty-state"><div class="ei">🗂️</div><p>No applications yet.</p></div>';
  } else {
    const smap = {pending:'pill-gray',shortlisted:'pill-green',rejected:'pill-red'};
    ra.innerHTML = recent.map(app => {
      const cand = VPStore.Candidates.getById(app.candidateId) || {};
      const prof = VPStore.Profiles.get(app.candidateId) || {};
      const name = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand.username || 'Unknown';
      return `<div class="cand-row">
        <div class="cand-av" style="background:${cand.color||'#2563eb'}">${cand.avatar||'??'}</div>
        <div style="flex:1;min-width:0">
          <div class="cand-name">${name}</div>
          <div class="cand-job">Applied for: <strong>${app.jobTitle}</strong> · ${app.appliedDate}${app.source==='careers'?'<span style="background:#f0fdf4;color:#16a34a;border:1px solid #bbf7d0;border-radius:50px;font-size:.6rem;font-weight:700;padding:.1rem .45rem;margin-left:.4rem">Via Careers</span>':''}${app.isGuest?'<span style="background:#fffbeb;color:#d97706;border:1px solid #fde68a;border-radius:50px;font-size:.6rem;font-weight:700;padding:.1rem .45rem;margin-left:.3rem">Guest</span>':''}</div>
        </div>
        <span class="pill ${smap[app.status]||'pill-gray'}">${app.status.charAt(0).toUpperCase()+app.status.slice(1)}</span>
        <button class="btn btn-ghost btn-sm" onclick="openDetail('${app.id}')">👤 View</button>
      </div>`;
    }).join('');
  }
}

// ── POST JOB ──
function postJob() {
  const title    = document.getElementById('jf-title').value.trim();
  const desc     = document.getElementById('jf-desc').value.trim();
  const deadline = document.getElementById('jf-deadline').value;
  if (!title)    { toast('Please enter a job title.', 'error'); return; }
  if (!desc)     { toast('Please enter a job description.', 'error'); return; }
  if (!deadline) { toast('Please set a last date to apply.', 'error'); return; }
  if (new Date(deadline) < new Date()) { toast('Deadline must be a future date.', 'error'); return; }
  VPStore.Jobs.add({
    title, desc, deadline,
    dept:         document.getElementById('jf-dept').value,
    type:         document.getElementById('jf-type').value,
    location:     document.getElementById('jf-location').value,
    mode:         document.getElementById('jf-mode').value,
    requirements: document.getElementById('jf-req').value,
    skillReq:     document.getElementById('jf-skills').value,
    benefits:     document.getElementById('jf-benefits').value,
    team:         document.getElementById('jf-team').value,
    goal:         document.getElementById('jf-goal').value,
    salary:       document.getElementById('jf-salary').value,
  });
  toast('"' + title + '" posted successfully! Candidates can now apply.', 'success');
  clearForm();
  renderPostedJobs();
  updateBadges();
  document.getElementById('posted-jobs-section').style.display = 'block';
  setTimeout(() => document.getElementById('posted-jobs-section').scrollIntoView({behavior:'smooth',block:'start'}), 100);
}

function clearForm() {
  ['jf-title','jf-dept','jf-type','jf-location','jf-mode','jf-desc','jf-req','jf-skills','jf-benefits','jf-team','jf-goal','jf-salary','jf-deadline']
    .forEach(id => { const el = document.getElementById(id); if (el) el.value = ''; });
}

function renderPostedJobs() {
  const jobs = VPStore.Jobs.getAll();
  const sec  = document.getElementById('posted-jobs-section');
  const list = document.getElementById('posted-jobs-list');
  const cnt  = document.getElementById('pj-count');
  if (!jobs.length) { sec.style.display = 'none'; return; }
  sec.style.display = 'block';
  if (cnt) cnt.textContent = jobs.length + ' job' + (jobs.length !== 1 ? 's' : '');
  const now = new Date();
  list.innerHTML = jobs.map(j => {
    const dLeft = Math.ceil((new Date(j.deadline) - now) / 86400000);
    const exp   = dLeft < 0;
    const sc    = exp ? 'pill-red' : dLeft <= 7 ? 'pill-amber' : 'pill-green';
    const st    = exp ? 'Expired' : dLeft <= 7 ? dLeft + 'd left' : 'Active';
    return `<div class="cand-row">
      <div style="font-size:1.2rem">📋</div>
      <div style="flex:1;min-width:0">
        <div style="font-weight:700;font-size:.85rem;color:#0a0a0a">${j.title}</div>
        <div style="font-size:.7rem;color:#9ca3af">${[j.dept,j.type,j.location].filter(Boolean).join(' · ')}</div>
      </div>
      <div style="font-size:.7rem;color:#9ca3af;font-family:monospace">Posted: ${j.postedDate}</div>
      <div style="font-size:.7rem;color:#9ca3af;font-family:monospace;margin-left:.6rem">Deadline: ${j.deadline}</div>
      <div style="font-weight:700;font-size:.82rem;color:#0a0a0a;margin:0 .7rem;font-family:monospace">${j.applicants||0} applied</div>
      <span class="pill ${sc}">${st}</span>
      <div style="display:flex;gap:.4rem;margin-left:.5rem">
        <button class="btn btn-ghost btn-sm" onclick="nav('candidates',document.querySelector('[data-page=candidates]'));setTimeout(()=>{document.getElementById('filter-job').value='${j.id}';renderCandidates();},80)">View</button>
        <button class="btn btn-danger btn-sm" onclick="doDeleteJob('${j.id}')">Delete</button>
      </div>
    </div>`;
  }).join('');
}

function doDeleteJob(id) {
  const job = VPStore.Jobs.getById(id);
  if (!confirm('Delete "' + (job ? job.title : 'this job') + '"? It will be moved to Previous Jobs.')) return;
  VPStore.Jobs.delete(id);
  toast('Job moved to Previous Jobs.', 'info');
  renderPostedJobs(); renderDashboard(); renderCandidates(); renderHistory(); updateBadges();
}

// ── CANDIDATES ──
function renderCandidates() {
  const filterEl = document.getElementById('filter-job');
  if (filterEl) {
    const cur = filterEl.value;
    filterEl.innerHTML = '<option value="">All Jobs</option>' +
      VPStore.Jobs.getAll().map(j => `<option value="${j.id}"${cur===j.id?' selected':''}>${j.title}</option>`).join('');
  }
  const jobF    = document.getElementById('filter-job')?.value || '';
  const statusF = document.getElementById('filter-status')?.value || '';
  const search  = (document.getElementById('search-cand')?.value || '').toLowerCase();

  let apps = VPStore.Applications.getAll().filter(a => !['withdrawn','job_deleted'].includes(a.status));
  if (jobF)    apps = apps.filter(a => a.jobId === jobF);
  if (statusF) apps = apps.filter(a => a.status === statusF);
  if (search) {
    apps = apps.filter(a => {
      const cand = VPStore.Candidates.getById(a.candidateId) || {};
      const prof = VPStore.Profiles.get(a.candidateId) || {};
      const fn   = ((prof.firstName||'') + ' ' + (prof.lastName||'')).toLowerCase();
      return (cand.username||'').toLowerCase().includes(search) ||
             (cand.email||'').toLowerCase().includes(search) || fn.includes(search);
    });
  }

  const el = document.getElementById('candidates-list');
  if (!apps.length) {
    el.innerHTML = `<div class="empty-state"><div class="ei">🗂️</div><p>${VPStore.Applications.getAll().length ? 'No candidates match your filters.' : 'No candidates yet. Post a job to receive applications.'}</p></div>`;
    return;
  }
  const smap = {pending:'pill-gray',shortlisted:'pill-green',rejected:'pill-red'};
  el.innerHTML = apps.map(app => {
    const cand  = VPStore.Candidates.getById(app.candidateId) || {};
    const prof  = VPStore.Profiles.get(app.candidateId) || {};
    const name  = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand.username || '—';
    const hasR  = !!prof.resumeName;
    return `<div class="cand-row">
      <div class="cand-av" style="background:${cand.color||'#2563eb'}">${cand.avatar||'??'}</div>
      <div style="flex:1;min-width:0">
        <div class="cand-name">${name}</div>
        <div class="cand-meta">${cand.email||''}${prof.phone?' · '+prof.phone:''}</div>
        <div class="cand-job">Applied for: <strong>${app.jobTitle}</strong> · ${app.appliedDate}${hasR?' · <span style="color:#16a34a;font-weight:600">&#128196; Resume</span>':''}${app.source==='careers'?'<span style="background:#f0fdf4;color:#16a34a;border:1px solid #bbf7d0;border-radius:50px;font-size:.6rem;font-weight:700;padding:.1rem .45rem;margin-left:.4rem">Via Careers</span>':''}${app.isGuest?'<span style="background:#fffbeb;color:#d97706;border:1px solid #fde68a;border-radius:50px;font-size:.6rem;font-weight:700;padding:.1rem .45rem;margin-left:.3rem">Guest</span>':''}</div>
      </div>
      <div style="display:flex;align-items:center;gap:.45rem;flex-shrink:0;flex-wrap:wrap">
        <span class="pill ${smap[app.status]||'pill-gray'}">${app.status.charAt(0).toUpperCase()+app.status.slice(1)}</span>
        <button class="btn btn-ghost btn-sm" onclick="openDetail('${app.id}')">👤 Profile</button>
        ${hasR ? `<button class="resume-view-btn" style="padding:.25rem .65rem;font-size:.64rem" onclick="viewResume('${app.candidateId}')">📄 Resume</button>` : ''}
        ${app.status === 'pending'
          ? `<button class="btn btn-success btn-sm" onclick="setStatus('${app.id}','shortlisted')">✓ Shortlist</button>
             <button class="btn btn-danger btn-sm" onclick="setStatus('${app.id}','rejected')">✗ Reject</button>`
          : app.status === 'shortlisted'
          ? `<button class="btn btn-danger btn-sm" onclick="setStatus('${app.id}','rejected')">✗ Reject</button>
             <button class="btn btn-ghost btn-sm" onclick="nav('communication',document.querySelector('[data-page=communication]'));setTimeout(()=>openChat('${app.id}'),80)">💬 Msg</button>`
          : `<button class="btn btn-success btn-sm" onclick="setStatus('${app.id}','shortlisted')">↩ Shortlist</button>
             <button class="btn btn-ghost btn-sm" onclick="nav('communication',document.querySelector('[data-page=communication]'));setTimeout(()=>openChat('${app.id}'),80)">💬 Msg</button>`}
      </div>
    </div>`;
  }).join('');
}

// ── STATUS UPDATE ──
function setStatus(appId, status) {
  const app  = VPStore.Applications.getById(appId);
  const cand = app ? VPStore.Candidates.getById(app.candidateId) : null;
  if (!app) return;
  const prof = VPStore.Profiles.get(app.candidateId) || {};
  const name = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand?.username || 'Candidate';

  const note = status === 'shortlisted'
    ? `Congratulations ${name}! You have been shortlisted for the ${app.jobTitle} position at Aivirtrix. We will be in touch with next steps shortly.`
    : `Thank you for applying for the ${app.jobTitle} role. After careful consideration, we will not be moving forward with your application at this time. We wish you the best.`;

  VPStore.Applications.updateStatus(appId, status, note);

  // Auto-message so candidate sees it in their tracker
  messages = loadMessages();
  if (!messages[appId]) messages[appId] = [];
  const now = new Date();
  const msgText = status === 'shortlisted'
    ? `Dear ${name}, congratulations! You have been <strong>shortlisted</strong> for the <em>${app.jobTitle}</em> position at Aivirtrix. We will reach out with further process details shortly.`
    : `Dear ${name}, thank you for applying for the <em>${app.jobTitle}</em> role. After careful consideration, we will not be moving forward with your application at this time. We wish you the very best in your search.`;

  messages[appId].push({
    from: 'employer', text: msgText,
    time: now.toLocaleTimeString([], {hour:'2-digit',minute:'2-digit'}),
    dateStr: now.toLocaleDateString()
  });
  saveMessages(messages);

  toast(name + ' has been ' + status + '.', status === 'shortlisted' ? 'success' : 'error');
  renderCandidates(); renderComm(); renderShortlist(); updateBadges();
  if (status === 'shortlisted') setTimeout(() => nav('shortlist', document.querySelector('[data-page=shortlist]')), 300);
}

// ── DETAIL PANEL ──
function openDetail(appId) {
  const app  = VPStore.Applications.getById(appId);
  const cand = app ? VPStore.Candidates.getById(app.candidateId) : null;
  if (!app || !cand) return;
  const job  = VPStore.Jobs.getById(app.jobId);
  const prof = VPStore.Profiles.get(app.candidateId) || {};
  const name = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand.username;
  const skills = prof.skills || [], edu = prof.education || [], exp = prof.experience || [];
  const hasR = !!prof.resumeName;
  const smap = {pending:'pill-gray',shortlisted:'pill-green',rejected:'pill-red'};

  document.getElementById('dp-body').innerHTML = `
    <div style="display:flex;align-items:center;gap:1rem;margin-bottom:1.4rem;padding-bottom:1rem;border-bottom:1px solid #f3f4f6">
      <div class="cand-av" style="width:50px;height:50px;font-size:.9rem;background:${cand.color||'#2563eb'}">${cand.avatar||'??'}</div>
      <div style="flex:1">
        <div style="font-size:1rem;font-weight:800;color:#0a0a0a">${name}</div>
        <div style="font-size:.72rem;color:#9ca3af">${prof.currentRole||''}${prof.totalExp?' · '+prof.totalExp:''}</div>
        <div style="display:flex;gap:.35rem;margin-top:.3rem;flex-wrap:wrap">
          <span class="pill ${smap[app.status]||'pill-gray'}">${app.status.charAt(0).toUpperCase()+app.status.slice(1)}</span>
          ${hasR ? '<span class="pill pill-blue">📄 Resume</span>' : ''}
        </div>
      </div>
      ${hasR ? `<button class="resume-view-btn" onclick="viewResume('${app.candidateId}')">📄 Resume</button>` : ''}
    </div>
    <div class="dp-section">
      <div class="dp-section-title">Application</div>
      <div class="dp-field"><div class="dp-field-label">Applied For</div><div class="dp-field-val"><strong>${app.jobTitle}</strong></div></div>
      <div class="dp-field"><div class="dp-field-label">Department</div><div class="dp-field-val">${job?.dept||'—'}</div></div>
      <div class="dp-field"><div class="dp-field-label">Applied On</div><div class="dp-field-val">${app.appliedDate}</div></div>
    </div>
    <div class="dp-section">
      <div class="dp-section-title">Contact Details</div>
      <div class="dp-field"><div class="dp-field-label">Full Name</div><div class="dp-field-val">${name}</div></div>
      <div class="dp-field"><div class="dp-field-label">Email</div><div class="dp-field-val"><a href="mailto:${cand.email}" style="color:#2563eb">${cand.email}</a></div></div>
      <div class="dp-field"><div class="dp-field-label">Phone</div><div class="dp-field-val">${prof.phone||'—'}</div></div>
      <div class="dp-field"><div class="dp-field-label">Location</div><div class="dp-field-val">${prof.presentLocation||'—'}</div></div>
      ${prof.linkedin?`<div class="dp-field"><div class="dp-field-label">LinkedIn</div><div class="dp-field-val"><a href="${prof.linkedin}" target="_blank" style="color:#2563eb">View Profile</a></div></div>`:''}
      ${prof.github?`<div class="dp-field"><div class="dp-field-label">GitHub</div><div class="dp-field-val"><a href="${prof.github}" target="_blank" style="color:#2563eb">View</a></div></div>`:''}
    </div>
    <div class="dp-section">
      <div class="dp-section-title">Professional</div>
      <div class="dp-field"><div class="dp-field-label">Experience</div><div class="dp-field-val">${prof.totalExp||'—'}</div></div>
      <div class="dp-field"><div class="dp-field-label">Current Role</div><div class="dp-field-val">${prof.currentRole||'—'}</div></div>
      <div class="dp-field"><div class="dp-field-label">Notice Period</div><div class="dp-field-val">${prof.notice||'—'}</div></div>
      <div class="dp-field"><div class="dp-field-label">Expected CTC</div><div class="dp-field-val">${prof.expectedCTC||'—'}</div></div>
    </div>
    ${skills.length ? `<div class="dp-section"><div class="dp-section-title">Skills</div><div style="display:flex;flex-wrap:wrap;gap:.3rem">${skills.map(s=>`<span class="pill pill-blue" style="font-size:.62rem">${s}</span>`).join('')}</div></div>` : ''}
    ${edu.length ? `<div class="dp-section"><div class="dp-section-title">Education</div>${edu.map(e=>`<div style="margin-bottom:.5rem"><div style="font-size:.8rem;font-weight:700;color:#0a0a0a">${e.degree}${e.field?' in '+e.field:''}</div><div style="font-size:.71rem;color:#6b7280">${e.institution}${e.start?' · '+e.start+(e.end?' – '+e.end:''):''} ${e.grade?'· '+e.grade:''}</div></div>`).join('')}</div>` : ''}
    ${exp.length ? `<div class="dp-section"><div class="dp-section-title">Experience</div>${exp.map(e=>`<div style="margin-bottom:.5rem"><div style="font-size:.8rem;font-weight:700;color:#0a0a0a">${e.title} at ${e.company}</div><div style="font-size:.71rem;color:#6b7280">${e.type||''} ${e.start?'· '+e.start:''} ${e.end?'– '+e.end:'– Present'}</div>${e.desc?`<div style="font-size:.72rem;color:#374151;margin-top:.2rem;line-height:1.6">${e.desc}</div>`:''}</div>`).join('')}</div>` : ''}
    ${prof.summary ? `<div class="dp-section"><div class="dp-section-title">Summary</div><div style="font-size:.78rem;color:#374151;line-height:1.7">${prof.summary}</div></div>` : ''}
    ${prof.coverNote ? `<div class="dp-section"><div class="dp-section-title">Cover Note</div><div style="font-size:.78rem;color:#374151;line-height:1.7;font-style:italic">${prof.coverNote}</div></div>` : ''}`;

  document.getElementById('dp-footer').innerHTML = app.status === 'pending'
    ? `<button class="btn btn-success btn-lg" style="flex:1" onclick="setStatus('${appId}','shortlisted');closeDetail()">✓ Shortlist</button>
       <button class="btn btn-danger btn-lg" style="flex:1" onclick="setStatus('${appId}','rejected');closeDetail()">✗ Reject</button>`
    : app.status === 'shortlisted'
    ? `<button class="btn btn-ghost btn-lg" style="flex:1" onclick="nav('communication',document.querySelector('[data-page=communication]'));openChat('${appId}');closeDetail()">💬 Message</button>
       <button class="btn btn-danger btn-lg" onclick="setStatus('${appId}','rejected');closeDetail()">✗ Reject</button>`
    : `<button class="btn btn-success btn-lg" style="flex:1" onclick="setStatus('${appId}','shortlisted');closeDetail()">↩ Re-Shortlist</button>
       <button class="btn btn-ghost btn-lg" onclick="nav('communication',document.querySelector('[data-page=communication]'));openChat('${appId}');closeDetail()">💬 Msg</button>`;

  document.getElementById('detail-panel').classList.add('open');
}
function closeDetail() { document.getElementById('detail-panel').classList.remove('open'); }
document.addEventListener('click', e => {
  const dp = document.getElementById('detail-panel');
  if (dp.classList.contains('open') && !dp.contains(e.target) && !e.target.closest('[onclick*="openDetail"]')) closeDetail();
});

// ── COMMUNICATION ──
function renderComm() {
  messages = loadMessages();
  const pool = VPStore.Applications.getAll().filter(a =>
    a.status === 'shortlisted' || a.status === 'rejected' || messages[a.id]
  );
  const countEl = document.getElementById('comm-count');
  if (countEl) countEl.textContent = pool.length;

  if (!pool.length) {
    document.getElementById('comm-entries').innerHTML = '<div class="empty-state" style="padding:2rem 1rem"><div class="ei">💬</div><p style="font-size:.72rem">No conversations yet.<br>Shortlist a candidate to start.</p></div>';
    return;
  }
  document.getElementById('comm-entries').innerHTML = pool.map(app => {
    const cand  = VPStore.Candidates.getById(app.candidateId) || {};
    const prof  = VPStore.Profiles.get(app.candidateId) || {};
    const name  = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand.username || 'Unknown';
    const msgs  = messages[app.id] || [];
    const last  = msgs[msgs.length-1];
    const isAct = activeChatId === app.id;
    return `<div class="comm-entry${isAct?' active':''}" onclick="openChat('${app.id}')">
      <div class="ce-av" style="background:${cand.color||'#2563eb'}">${cand.avatar||'??'}</div>
      <div style="flex:1;min-width:0">
        <div class="ce-name">${name}</div>
        <div class="ce-job">${app.jobTitle}</div>
        <div class="ce-preview">${last ? last.text.replace(/<[^>]*>/g,'').substring(0,42)+'…' : 'No messages yet'}</div>
      </div>
      <div style="display:flex;flex-direction:column;align-items:flex-end;gap:.2rem;flex-shrink:0">
        <div class="ce-time">${last ? last.time : ''}</div>
        <span class="pill ${app.status==='shortlisted'?'pill-green':'pill-red'}" style="font-size:.54rem;padding:.07rem .38rem">${app.status}</span>
      </div>
    </div>`;
  }).join('');
}

function openChat(appId) {
  activeChatId = appId;
  const app  = VPStore.Applications.getById(appId);
  const cand = app ? VPStore.Candidates.getById(app.candidateId) : null;
  if (!app || !cand) return;
  const prof = VPStore.Profiles.get(app.candidateId) || {};
  const name = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand.username;

  // Navigate to communication page if not already there
  if (!document.getElementById('pg-communication').classList.contains('active')) {
    nav('communication', document.querySelector('[data-page=communication]'));
    setTimeout(() => openChat(appId), 150);
    return;
  }

  renderComm(); // refresh sidebar highlight

  document.getElementById('chat-head').style.display      = 'flex';
  document.getElementById('chat-input-area').style.display = 'flex';

  const av = document.getElementById('chat-av');
  av.textContent = cand.avatar || '??';
  av.style.background = cand.color || '#2563eb';
  document.getElementById('chat-name').textContent = name;
  document.getElementById('chat-role').textContent = app.jobTitle + ' · ' + app.status.charAt(0).toUpperCase() + app.status.slice(1);

  document.getElementById('chat-quick').innerHTML =
    `<button class="btn btn-ghost btn-sm" onclick="openDetail('${appId}')">👤 Profile</button>` +
    (app.status === 'shortlisted'
      ? `<button class="btn btn-danger btn-sm" onclick="setStatus('${appId}','rejected');renderComm()">✗ Reject</button>`
      : `<button class="btn btn-success btn-sm" onclick="setStatus('${appId}','shortlisted');renderComm()">✓ Shortlist</button>`);

  messages = loadMessages();
  const msgs = messages[appId] || [];
  const el   = document.getElementById('chat-msgs');

  if (!msgs.length) {
    el.innerHTML = '<div class="chat-empty"><div class="chat-empty-icon">💬</div><div class="chat-empty-text">No messages yet. Start the conversation!</div></div>';
    return;
  }

  let lastDate = '', html = '';
  msgs.forEach(m => {
    const dStr = m.dateStr || '';
    if (dStr && dStr !== lastDate) {
      html += `<div class="msg-date-sep"><span>${dStr}</span></div>`;
      lastDate = dStr;
    }
    const sent = m.from === 'employer';
    html += `<div class="msg-wrap ${sent?'sent':'recv'}">
      ${!sent ? `<div class="msg-label">${name}</div>` : ''}
      <div class="msg-bubble ${sent?'msg-sent':'msg-recv'}">${m.text}</div>
      <div class="msg-time">${m.time}</div>
    </div>`;
  });
  el.innerHTML = html;
  el.scrollTop = el.scrollHeight;
}

function sendMsg() {
  if (!activeChatId) { toast('Please select a conversation first.', 'error'); return; }
  const inp  = document.getElementById('chat-input');
  const text = inp.value.trim();
  if (!text) return;
  messages = loadMessages();
  if (!messages[activeChatId]) messages[activeChatId] = [];
  const now = new Date();
  messages[activeChatId].push({
    from: 'employer', text,
    time: now.toLocaleTimeString([], {hour:'2-digit',minute:'2-digit'}),
    dateStr: now.toLocaleDateString()
  });
  saveMessages(messages);
  inp.value = '';
  openChat(activeChatId);
  updateBadges();
}
function chatKey(e) { if (e.key === 'Enter' && !e.shiftKey) { e.preventDefault(); sendMsg(); } }
function useTemplate(text) {
  const inp = document.getElementById('chat-input');
  if (inp) { inp.value = text; inp.focus(); }
}

// ── SHORTLIST ──
function renderShortlist() {
  const sfj = document.getElementById('sl-filter-job');
  const curJ = sfj?.value || '';
  if (sfj) {
    sfj.innerHTML = '<option value="">All Jobs</option>' +
      VPStore.Jobs.getAll().map(j => `<option value="${j.id}"${curJ===j.id?' selected':''}>${j.title}</option>`).join('');
  }
  const jobF   = sfj?.value || '';
  const search = (document.getElementById('sl-search')?.value || '').toLowerCase();
  let apps = VPStore.Applications.getAll().filter(a => a.status === 'shortlisted');
  if (jobF)   apps = apps.filter(a => a.jobId === jobF);
  if (search) apps = apps.filter(a => {
    const c = VPStore.Candidates.getById(a.candidateId) || {};
    const p = VPStore.Profiles.get(a.candidateId) || {};
    const fn = ((p.firstName||'')+' '+(p.lastName||'')).toLowerCase();
    return (c.username||'').toLowerCase().includes(search) || fn.includes(search);
  });

  const countEl = document.getElementById('sl-count');
  if (countEl) countEl.textContent = apps.length + ' shortlisted';

  const el = document.getElementById('shortlist-grid');
  if (!apps.length) {
    el.innerHTML = '<div class="empty-state"><span style="font-size:2.2rem;opacity:.45;display:block;margin-bottom:.6rem">✅</span><p>No shortlisted candidates' + (jobF||search?' match your filters.':' yet.') + '</p></div>';
    return;
  }

  el.innerHTML = apps.map(app => {
    const cand  = VPStore.Candidates.getById(app.candidateId) || {};
    const prof  = VPStore.Profiles.get(app.candidateId) || {};
    const name  = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand.username || 'Unknown';
    const edu   = prof.education || [], exp = prof.experience || [], skills = prof.skills || [];
    const hasR  = !!prof.resumeName;
    messages = loadMessages();
    const lastMsg = (messages[app.id] || []).slice(-1)[0];

    return `<div class="sl-card">
      <div class="sl-card-head">
        <div class="sl-avatar" style="background:${cand.color||'#2563eb'}">${cand.avatar||'??'}</div>
        <div style="flex:1;min-width:0">
          <div class="sl-name">${name}</div>
          <div class="sl-meta">${prof.currentRole||''}${prof.totalExp?' · '+prof.totalExp:''}${prof.presentLocation?' · 📍 '+prof.presentLocation:''}</div>
          <div style="margin-top:.3rem;display:flex;gap:.4rem;flex-wrap:wrap">
            <span class="pill pill-green">Shortlisted</span>
            ${app.jobTitle ? `<span class="pill pill-blue">${app.jobTitle}</span>` : ''}
            ${hasR ? '<span class="pill pill-gray">📄 Resume</span>' : ''}
          </div>
        </div>
        <div class="sl-actions">
          ${hasR ? `<button class="resume-view-btn" onclick="viewResume('${app.candidateId}')">📄 Resume</button>` : '<span style="font-size:.7rem;color:#9ca3af">No resume</span>'}
          <button class="btn btn-purple btn-sm" onclick="nav('communication',document.querySelector('[data-page=communication]'));setTimeout(()=>openChat('${app.id}'),80)">💬 Message</button>
          <button class="btn btn-danger btn-sm" onclick="setStatus('${app.id}','rejected');renderShortlist();updateBadges()">✗ Reject</button>
        </div>
      </div>
      <div class="sl-body">
        <div class="sl-grid-2">
          <div>
            <div class="sl-section">
              <div class="sl-section-title">Contact Details</div>
              <div class="sl-field"><span class="sl-field-label">Email</span><span class="sl-field-val"><a href="mailto:${cand.email||''}" style="color:#2563eb">${cand.email||'—'}</a></span></div>
              <div class="sl-field"><span class="sl-field-label">Phone</span><span class="sl-field-val">${prof.phone||'—'}</span></div>
              <div class="sl-field"><span class="sl-field-label">Location</span><span class="sl-field-val">${prof.presentLocation||'—'}</span></div>
              ${prof.linkedin?`<div class="sl-field"><span class="sl-field-label">LinkedIn</span><span class="sl-field-val"><a href="${prof.linkedin}" target="_blank" style="color:#2563eb">View Profile</a></span></div>`:''}
              ${prof.github?`<div class="sl-field"><span class="sl-field-label">GitHub</span><span class="sl-field-val"><a href="${prof.github}" target="_blank" style="color:#2563eb">View</a></span></div>`:''}
              ${prof.portfolio?`<div class="sl-field"><span class="sl-field-label">Portfolio</span><span class="sl-field-val"><a href="${prof.portfolio}" target="_blank" style="color:#2563eb">View</a></span></div>`:''}
            </div>
            <div class="sl-section">
              <div class="sl-section-title">Experience &amp; Skills</div>
              <div class="sl-field"><span class="sl-field-label">Total Exp</span><span class="sl-field-val">${prof.totalExp||'—'}</span></div>
              <div class="sl-field"><span class="sl-field-label">Current Role</span><span class="sl-field-val">${prof.currentRole||'—'}</span></div>
              <div class="sl-field"><span class="sl-field-label">Notice Period</span><span class="sl-field-val">${prof.notice||'—'}</span></div>
              <div class="sl-field"><span class="sl-field-label">Expected CTC</span><span class="sl-field-val">${prof.expectedCTC||'—'}</span></div>
              ${skills.length ? `<div style="margin-top:.5rem;display:flex;flex-wrap:wrap;gap:.25rem">${skills.map(s=>`<span class="pill pill-blue" style="font-size:.6rem">${s}</span>`).join('')}</div>` : ''}
            </div>
            <!-- Process Update → goes to Communication & candidate can read -->
            <div class="process-update-box">
              <h4>📤 Send Process Update</h4>
              <textarea class="pu-input" id="pu-${app.id}" rows="2" placeholder="e.g. Your interview is scheduled for Monday at 10 AM. Please confirm your availability."></textarea>
              <div style="display:flex;gap:.4rem;flex-wrap:wrap;align-items:center">
                <button class="btn btn-success btn-sm" onclick="sendProcessUpdate('${app.id}','${name.replace(/'/g,"\\'")}')">Send Update</button>
                <button class="btn btn-ghost btn-sm" onclick="nav('communication',document.querySelector('[data-page=communication]'));setTimeout(()=>openChat('${app.id}'),80)">Open Full Chat →</button>
              </div>
              ${lastMsg ? `<div style="margin-top:.55rem;font-size:.67rem;color:#9ca3af;border-top:1px solid #d1fae5;padding-top:.4rem">Last: "${lastMsg.text.replace(/<[^>]*>/g,'').substring(0,55)}…" · ${lastMsg.time}</div>` : ''}
            </div>
          </div>
          <div>
            ${edu.length ? `<div class="sl-section"><div class="sl-section-title">Education</div>${edu.map(e=>`<div style="margin-bottom:.6rem"><div style="font-size:.8rem;font-weight:700;color:#0a0a0a">${e.degree}${e.field?' in '+e.field:''}</div><div style="font-size:.72rem;color:#6b7280">${e.institution}${e.start?' · '+e.start+(e.end?' – '+e.end:''):''} ${e.grade?'· '+e.grade:''}</div></div>`).join('')}</div>` : ''}
            ${exp.length ? `<div class="sl-section"><div class="sl-section-title">Work Experience</div>${exp.map(e=>`<div style="margin-bottom:.6rem"><div style="font-size:.8rem;font-weight:700;color:#0a0a0a">${e.title} at ${e.company}</div><div style="font-size:.72rem;color:#6b7280">${e.type||''} ${e.location?'· '+e.location:''} ${e.start?'· '+e.start+(e.end?' – '+e.end:' – Present'):''}</div>${e.desc?`<div style="font-size:.73rem;color:#374151;margin-top:.25rem;line-height:1.6">${e.desc}</div>`:''}</div>`).join('')}</div>` : ''}
            ${prof.summary ? `<div class="sl-section"><div class="sl-section-title">Summary</div><div style="font-size:.78rem;color:#374151;line-height:1.7">${prof.summary}</div></div>` : ''}
            ${prof.coverNote ? `<div class="sl-section"><div class="sl-section-title">Cover Note</div><div style="font-size:.78rem;color:#374151;line-height:1.7;font-style:italic">${prof.coverNote}</div></div>` : ''}
          </div>
        </div>
      </div>
    </div>`;
  }).join('');
}

// Send process update from Shortlist → syncs to Communication
function sendProcessUpdate(appId, candidateName) {
  const inp = document.getElementById('pu-' + appId);
  if (!inp) return;
  const text = inp.value.trim();
  if (!text) { toast('Please type a message first.', 'error'); return; }
  messages = loadMessages();
  if (!messages[appId]) messages[appId] = [];
  const now = new Date();
  messages[appId].push({
    from: 'employer', text,
    time: now.toLocaleTimeString([], {hour:'2-digit',minute:'2-digit'}),
    dateStr: now.toLocaleDateString()
  });
  saveMessages(messages);
  inp.value = '';
  toast('Update sent to ' + candidateName + '. Visible in Communication & candidate portal.', 'success');
  renderShortlist();
  updateBadges();
}

// ── PREVIOUS JOBS ──
function renderHistory() {
  const hist = VPStore.Jobs.getHistory();
  const el   = document.getElementById('history-list');
  if (!hist.length) {
    el.innerHTML = '<div class="empty-state"><div class="ei">🕐</div><p>No previous jobs yet.<br>Expired and deleted jobs appear here automatically.</p></div>';
    return;
  }
  el.innerHTML = [...hist].reverse().map(j => {
    const reason = j.deleteReason === 'deleted' ? 'Deleted' : 'Expired';
    const cls    = j.deleteReason === 'deleted' ? 'pill-red' : 'pill-amber';
    const when   = j.deletedAt || j.expiredAt || '';
    const allApps = VPStore.Applications.getAll().filter(a => a.jobId === j.id);
    const slCount = allApps.filter(a => a.status === 'shortlisted').length;
    return `<div class="history-item">
      <div style="display:flex;align-items:flex-start;justify-content:space-between;gap:1rem;flex-wrap:wrap">
        <div>
          <div class="hi-title">${j.title}</div>
          <div class="hi-meta">
            <span>${j.dept||'—'}</span><span>·</span><span>${j.type||'—'}</span><span>·</span>
            <span>Posted: ${j.postedDate}</span><span>·</span>
            <span>Deadline: ${j.deadline}</span><span>·</span>
            <span>${j.applicants||0} applicants</span>
            ${slCount ? `<span>·</span><span style="color:#16a34a;font-weight:600">✅ ${slCount} shortlisted</span>` : ''}
          </div>
          ${j.salary ? `<div style="font-size:.7rem;color:#6b7280;margin-top:.2rem">💰 ${j.salary}</div>` : ''}
        </div>
        <div style="display:flex;align-items:center;gap:.6rem;flex-shrink:0">
          <span class="pill ${cls}">${reason}</span>
          ${when ? `<span style="font-size:.65rem;color:#9ca3af;font-family:monospace">${new Date(when).toLocaleDateString()}</span>` : ''}
        </div>
      </div>
      ${j.desc ? `<div style="font-size:.76rem;color:#6b7280;margin-top:.6rem;line-height:1.6">${j.desc.substring(0,200)}${j.desc.length>200?'…':''}</div>` : ''}
    </div>`;
  }).join('');
}

function clearHistory() {
  if (!confirm('Clear all previous job records? This cannot be undone.')) return;
  localStorage.removeItem('vp_job_history');
  renderHistory(); updateBadges();
  toast('Job history cleared.', 'info');
}

// ── RESUME VIEWER ──
function viewResume(candidateId) {
  const prof = VPStore.Profiles.get(candidateId);
  if (!prof || !prof.resumeData) { toast('No resume available for this candidate.', 'error'); return; }
  // Validate it's a proper data URI before using it
  if (typeof prof.resumeData !== 'string' || !prof.resumeData.startsWith('data:')) {
    toast('Resume data is invalid or corrupted.', 'error'); return;
  }
  if (prof.resumeName && prof.resumeName.toLowerCase().endsWith('.pdf')) {
    const win = window.open('', '_blank');
    if (win) {
      win.document.write(`<html><body style="margin:0;padding:0"><embed src="${prof.resumeData}" width="100%" height="100%" type="application/pdf"/></body></html>`);
      win.document.close();
    } else {
      toast('Pop-up blocked. Please allow pop-ups to view the resume.', 'error');
    }
  } else {
    const a = document.createElement('a'); a.href = prof.resumeData; a.download = prof.resumeName || 'resume'; a.click();
    toast('Resume downloaded.', 'info');
  }
}

// ── TOAST ──
let toastTimer;
function toast(msg, type = 'info') {
  const el  = document.getElementById('toast');
  const ico = {success:'✅', error:'❌', info:'ℹ️'};
  document.getElementById('toast-icon').textContent = ico[type] || 'ℹ️';
  document.getElementById('toast-msg').textContent  = msg;
  el.className = `toast ${type} show`;
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => el.classList.remove('show'), 3500);
}

// ── LOGOUT ──
function doLogout() {
  if (confirm('Log out of Employer Portal?')) {
    sessionStorage.removeItem('vp_employer_auth');
    location.href = 'employer-login.html';
  }
}

// ── INIT ──
const jfDeadline = document.getElementById('jf-deadline');
if (jfDeadline) jfDeadline.min = new Date().toISOString().split('T')[0];

// Auto-refresh when tab re-focused (picks up new candidate applications instantly)
document.addEventListener('visibilitychange', () => {
  if (document.visibilityState === 'visible') {
    VPStore.Jobs.archiveExpired();
    messages = loadMessages();
    const active = document.querySelector('.pg.active');
    if (active) renderPage(active.id.replace('pg-', ''));
    updateBadges();
  }
});

renderDashboard();
updateBadges();
