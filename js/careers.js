/**
 * careers.js — Aivirtrix Careers Page
 * Handles: job listing, search/filter, application form, vpstore integration
 */

// ── STATE ──
let allJobs       = [];
let filteredJobs  = [];
let activeJobId   = null;   // currently open application panel
let expandedJobs  = {};     // { jobId: true/false }
let skillTags     = [];     // tags in skill input
let uploadedFile  = null;   // resume File object
let toastTimer    = null;
const GUEST_PREFIX = 'guest_';

// ── INIT ──
document.addEventListener('DOMContentLoaded', function () {
  VPStore.Jobs.archiveExpired();
  loadJobs();
  buildFilterOptions();
  bindSearch();
  bindFilterToggle();
  updateJobCount();
  updateHeroStats();

  // Auto-refresh every 30s so new employer posts appear without reload
  setInterval(function () {
    VPStore.Jobs.archiveExpired();
    loadJobs();
    if (activeJobId) {
      const stillExists = allJobs.find(j => j.id === activeJobId);
      if (!stillExists) closePanel();
    }
  }, 30000);

  // Re-render on tab focus (employer may have posted a job)
  document.addEventListener('visibilitychange', function () {
    if (document.visibilityState === 'visible') {
      VPStore.Jobs.archiveExpired();
      loadJobs();
    }
  });
});

// ── LOAD & RENDER JOBS ──
function loadJobs() {
  allJobs = VPStore.Jobs.getActive();
  applyFilters();
}

function applyFilters() {
  const keyword  = (document.getElementById('cr-kw')?.value   || '').toLowerCase().trim();
  const titleF   = (document.getElementById('cr-title')?.value || '').toLowerCase().trim();
  const skillsF  = (document.getElementById('cr-skills')?.value|| '').toLowerCase().trim();
  const deptF    = document.getElementById('cr-dept')?.value   || '';
  const expF     = document.getElementById('cr-exp')?.value    || '';
  const typeF    = document.getElementById('cr-type')?.value   || '';
  const modeF    = document.getElementById('cr-mode')?.value   || '';

  filteredJobs = allJobs.filter(j => {
    const haystack = [j.title, j.desc, j.dept, j.skillReq, j.requirements, j.location].join(' ').toLowerCase();
    if (keyword  && !haystack.includes(keyword))            return false;
    if (titleF   && !j.title.toLowerCase().includes(titleF)) return false;
    if (skillsF  && !(j.skillReq||'').toLowerCase().includes(skillsF)) return false;
    if (deptF    && j.dept !== deptF)                        return false;
    if (typeF    && j.type !== typeF)                        return false;
    if (modeF    && j.mode !== modeF)                        return false;
    if (expF) {
      // match experience filter — job requirements field contains level keywords
      const req = (j.requirements||'').toLowerCase();
      if (expF === '0-1'   && !/0[\s\-]?1|fresher|entry|junior/.test(req)) return false;
      if (expF === '1-3'   && !/1[\s\-]?3|junior|mid/.test(req))           return false;
      if (expF === '3-5'   && !/3[\s\-]?5|mid|senior/.test(req))           return false;
      if (expF === '5+'    && !/5\+|senior|lead|head/.test(req))            return false;
    }
    return true;
  });

  renderJobs();
  updateJobCount();
  renderFilterChips();
}

function renderJobs() {
  const el = document.getElementById('cr-jobs-list');
  if (!el) return;

  if (!filteredJobs.length) {
    el.innerHTML = '<div class="cr-empty">' +
      '<div class="cr-empty-icon">🔍</div>' +
      '<div class="cr-empty-title">' + (allJobs.length ? 'No jobs match your search' : 'No active jobs right now') + '</div>' +
      '<div class="cr-empty-sub">' + (allJobs.length ? 'Try adjusting your filters or clear the search.' : 'New positions are added regularly. Check back soon or subscribe to our newsletter.') + '</div>' +
      '</div>';
    return;
  }

  el.innerHTML = filteredJobs.map(job => renderJobCard(job)).join('');
}

function renderJobCard(j) {
  const now      = new Date();
  const dLeft    = Math.ceil((new Date(j.deadline) - now) / 86400000);
  const urgentCls = dLeft <= 7 ? ' urgent' : '';
  const deadlineTxt = dLeft <= 7 ? '⚠ ' + dLeft + ' days left' : 'Closes ' + j.deadline;
  const isExpanded = expandedJobs[j.id];
  const isActive   = activeJobId === j.id;

  const icons = { 'Operations':'⚙️','Quality Control':'🔬','Sales & Export':'📦','Manufacturing':'🏭','Logistics':'🚚','HR':'👥','Finance':'💰','IT':'💻','General':'🏢' };
  const icon = icons[j.dept] || '💼';

  const skillList = (j.skillReq || '').split(',').map(s => s.trim()).filter(Boolean).slice(0, 5);

  return '<div class="cr-job-card' + (isActive ? ' active-card' : '') + '" id="card-' + j.id + '">' +
    '<div class="cr-job-main">' +
      '<div class="cr-job-icon">' + icon + '</div>' +
      '<div class="cr-job-body">' +
        '<div class="cr-job-title">' + escHtml(j.title) + '</div>' +
        '<div class="cr-job-meta">' +
          (j.dept     ? '<span class="cr-job-meta-item"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/></svg>' + escHtml(j.dept) + '</span>' : '') +
          (j.location ? '<span class="cr-job-meta-item"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>' + escHtml(j.location) + '</span>' : '') +
          (j.salary   ? '<span class="cr-job-meta-item"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>' + escHtml(j.salary) + '</span>' : '') +
        '</div>' +
        '<div class="cr-job-pills">' +
          (j.type ? '<span class="cr-pill cr-pill-blue">' + escHtml(j.type) + '</span>' : '') +
          (j.mode ? '<span class="cr-pill cr-pill-purple">' + escHtml(j.mode) + '</span>' : '') +
          '<span class="cr-pill cr-pill-green">Active</span>' +
          (j.applicants ? '<span class="cr-pill cr-pill-gray">' + j.applicants + ' applicant' + (j.applicants === 1 ? '' : 's') + '</span>' : '') +
        '</div>' +
      '</div>' +
      '<div class="cr-job-actions">' +
        '<div style="display:flex;gap:.4rem;align-items:center">' +
          '<button class="cr-btn-expand' + (isExpanded ? ' expanded' : '') + '" onclick="toggleExpand(\'' + j.id + '\')" title="' + (isExpanded ? 'Hide' : 'Show') + ' details">' +
            (isExpanded ? '−' : '+') +
          '</button>' +
        '</div>' +
        '<button class="cr-btn cr-btn-primary" onclick="openApply(\'' + j.id + '\')">Apply Now</button>' +
        '<div class="cr-job-deadline' + urgentCls + '">' + deadlineTxt + '</div>' +
      '</div>' +
    '</div>' +
    '<div class="cr-job-details' + (isExpanded ? ' open' : '') + '" id="details-' + j.id + '">' +
      '<div class="cr-details-grid">' +
        (j.desc ? '<div><div class="cr-detail-section-title">Job Description</div><div class="cr-detail-text">' + escHtml(j.desc) + '</div></div>' : '') +
        (j.requirements ? '<div><div class="cr-detail-section-title">Requirements</div><div class="cr-detail-text">' + escHtml(j.requirements) + '</div></div>' : '') +
        (j.benefits ? '<div><div class="cr-detail-section-title">Benefits & Perks</div><div class="cr-detail-text">' + escHtml(j.benefits) + '</div></div>' : '') +
        (j.team ? '<div><div class="cr-detail-section-title">Our Team</div><div class="cr-detail-text">' + escHtml(j.team) + '</div></div>' : '') +
        (j.goal ? '<div><div class="cr-detail-section-title">Role Goals</div><div class="cr-detail-text">' + escHtml(j.goal) + '</div></div>' : '') +
      '</div>' +
      (skillList.length ? '<div class="cr-detail-section-title" style="margin-top:.5rem">Required Skills</div><div class="cr-skill-chips">' +
        skillList.map(s => '<span class="cr-pill cr-pill-blue">' + escHtml(s) + '</span>').join('') +
      '</div>' : '') +
      '<div style="margin-top:1rem;display:flex;gap:.6rem;flex-wrap:wrap">' +
        '<button class="cr-btn cr-btn-primary" onclick="openApply(\'' + j.id + '\')">Apply for this role →</button>' +
        '<a href="candidate-login.html" class="cr-btn cr-btn-ghost">Sign In & Apply</a>' +
      '</div>' +
    '</div>' +
  '</div>';
}

function toggleExpand(jobId) {
  expandedJobs[jobId] = !expandedJobs[jobId];
  const card    = document.getElementById('card-' + jobId);
  const details = document.getElementById('details-' + jobId);
  const btn     = card?.querySelector('.cr-btn-expand');
  if (!details) return;
  if (expandedJobs[jobId]) {
    details.classList.add('open');
    if (btn) { btn.classList.add('expanded'); btn.textContent = '−'; }
  } else {
    details.classList.remove('open');
    if (btn) { btn.classList.remove('expanded'); btn.textContent = '+'; }
  }
}

// ── APPLY PANEL ──
function openApply(jobId) {
  const job = VPStore.Jobs.getById(jobId);
  if (!job) return;
  activeJobId = jobId;

  // Highlight card
  document.querySelectorAll('.cr-job-card').forEach(c => c.classList.remove('active-card'));
  const card = document.getElementById('card-' + jobId);
  if (card) { card.classList.add('active-card'); card.scrollIntoView({ behavior: 'smooth', block: 'nearest' }); }

  // Set panel content
  document.getElementById('cr-panel-job-name').textContent = job.title;
  document.getElementById('cr-panel-dept').textContent     = [job.dept, job.type, job.mode].filter(Boolean).join(' · ');

  // Reset form
  resetForm();
  document.getElementById('cr-form-content').style.display = 'block';
  document.getElementById('cr-success-state').classList.remove('visible');

  // Set job id on form
  document.getElementById('cr-apply-form').dataset.jobId = jobId;

  // Check if logged in candidate — pre-fill
  const cid  = sessionStorage.getItem('vp_candidate_id');
  const cand = cid ? VPStore.Candidates.getById(cid) : null;
  if (cand) {
    const prof = VPStore.Profiles.get(cid) || {};
    document.getElementById('cr-f-name').value   = [prof.firstName, prof.lastName].filter(Boolean).join(' ') || cand.username;
    document.getElementById('cr-f-email').value  = cand.email || '';
    document.getElementById('cr-f-phone').value  = prof.phone || '';
    // Pre-fill skills
    if (prof.skills && prof.skills.length) {
      skillTags = [...prof.skills];
      renderSkillTags();
    }
    // Show already-applied notice
    if (VPStore.Applications.alreadyApplied(cid, jobId)) {
      showAlreadyApplied();
      return;
    }
  }

  // Open panel & layout
  const panel = document.getElementById('cr-apply-panel');
  panel.classList.add('open');
  const main = document.getElementById('cr-main-layout');
  if (main) main.classList.add('panel-open');
}

function showAlreadyApplied() {
  document.getElementById('cr-form-content').style.display = 'none';
  const ss = document.getElementById('cr-success-state');
  ss.classList.add('visible');
  ss.querySelector('.cr-success-title').textContent = 'Already Applied!';
  ss.querySelector('.cr-success-text').textContent  = 'You have already submitted an application for this role. Check your dashboard for status updates.';
}

function closePanel() {
  const panel = document.getElementById('cr-apply-panel');
  panel.classList.remove('open');
  const main = document.getElementById('cr-main-layout');
  if (main) main.classList.remove('panel-open');
  document.querySelectorAll('.cr-job-card').forEach(c => c.classList.remove('active-card'));
  activeJobId = null;
  resetForm();
}

function resetForm() {
  const form = document.getElementById('cr-apply-form');
  if (form) form.reset();
  skillTags    = [];
  uploadedFile = null;
  renderSkillTags();
  const preview = document.getElementById('cr-upload-preview');
  if (preview) preview.classList.remove('visible');
  // Clear error states
  document.querySelectorAll('.cr-field.error').forEach(el => el.classList.remove('error'));
}

// ── SKILL TAG INPUT ──
function skillKeydown(e) {
  if (e.key === 'Enter' || e.key === ',') {
    e.preventDefault();
    addSkillTag(e.target.value.trim());
    e.target.value = '';
  }
  if (e.key === 'Backspace' && e.target.value === '' && skillTags.length) {
    skillTags.pop();
    renderSkillTags();
  }
}
function addSkillTag(val) {
  if (!val || skillTags.includes(val)) return;
  skillTags.push(val);
  renderSkillTags();
}
function removeSkillTag(idx) {
  skillTags.splice(idx, 1);
  renderSkillTags();
}
function renderSkillTags() {
  const wrap = document.getElementById('cr-skill-wrap');
  const inp  = document.getElementById('cr-skill-raw');
  if (!wrap || !inp) return;
  // Remove old tags
  wrap.querySelectorAll('.cr-skill-tag').forEach(el => el.remove());
  skillTags.forEach((tag, i) => {
    const el = document.createElement('span');
    el.className = 'cr-skill-tag';
    el.innerHTML = escHtml(tag) + '<button type="button" onclick="removeSkillTag(' + i + ')">×</button>';
    wrap.insertBefore(el, inp);
  });
}

// ── FILE UPLOAD ──
function handleFileChange(input) {
  const file = input.files[0];
  if (!file) return;
  const allowed = ['application/pdf','application/msword','application/vnd.openxmlformats-officedocument.wordprocessingml.document'];
  if (!allowed.includes(file.type) && !file.name.match(/\.(pdf|doc|docx)$/i)) {
    showToast('Please upload a PDF or Word document.', 'error');
    return;
  }
  if (file.size > 5 * 1024 * 1024) {
    showToast('File too large. Maximum size is 5MB.', 'error');
    return;
  }
  uploadedFile = file;
  const preview = document.getElementById('cr-upload-preview');
  if (preview) {
    preview.querySelector('.cr-upload-preview-name').textContent = file.name;
    preview.classList.add('visible');
  }
}
function removeUpload() {
  uploadedFile = null;
  document.getElementById('cr-resume-input').value = '';
  const preview = document.getElementById('cr-upload-preview');
  if (preview) preview.classList.remove('visible');
}
function setupDragDrop() {
  const zone = document.getElementById('cr-upload-zone');
  if (!zone) return;
  zone.addEventListener('dragover', e => { e.preventDefault(); zone.classList.add('drag-over'); });
  zone.addEventListener('dragleave', () => zone.classList.remove('drag-over'));
  zone.addEventListener('drop', e => {
    e.preventDefault();
    zone.classList.remove('drag-over');
    const file = e.dataTransfer.files[0];
    if (file) {
      const inp = document.getElementById('cr-resume-input');
      // Create a DataTransfer to set files on input
      try {
        const dt = new DataTransfer();
        dt.items.add(file);
        inp.files = dt.files;
      } catch(err) {}
      handleFileChange({ files: [file] });
    }
  });
}
document.addEventListener('DOMContentLoaded', setupDragDrop);

// ── FORM SUBMISSION ──
function submitApplication(e) {
  if (e) e.preventDefault();

  const jobId = document.getElementById('cr-apply-form').dataset.jobId;
  const job   = VPStore.Jobs.getById(jobId);
  if (!job) { showToast('Job not found.', 'error'); return; }

  // Gather values
  const name    = document.getElementById('cr-f-name').value.trim();
  const email   = document.getElementById('cr-f-email').value.trim();
  const phone   = document.getElementById('cr-f-phone').value.trim();
  const expVal  = document.getElementById('cr-f-exp').value.trim();
  const eduVal  = document.getElementById('cr-f-edu').value.trim();
  const coverV  = document.getElementById('cr-f-cover').value.trim();

  // Validate
  let valid = true;
  const req = { 'cr-f-name': name, 'cr-f-email': email };
  Object.entries(req).forEach(([id, val]) => {
    const el = document.getElementById(id);
    if (!val) { el.classList.add('error'); valid = false; }
    else el.classList.remove('error');
  });
  if (!valid) { showToast('Please fill in all required fields.', 'error'); return; }
  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    document.getElementById('cr-f-email').classList.add('error');
    showToast('Please enter a valid email address.', 'error');
    return;
  }

  const btn = document.getElementById('cr-submit-btn');
  btn.disabled = true;
  btn.innerHTML = '<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" style="animation:spin 1s linear infinite"><path d="M12 2v4M12 18v4M4.93 4.93l2.83 2.83M16.24 16.24l2.83 2.83M2 12h4M18 12h4M4.93 19.07l2.83-2.83M16.24 7.76l2.83-2.83"/></svg> Submitting...';

  // Read resume as base64 if provided
  const finalize = function(resumeData, resumeName) {
    const cid = sessionStorage.getItem('vp_candidate_id');
    let appResult;

    if (cid && VPStore.Candidates.getById(cid)) {
      // LOGGED IN: use VPStore.Applications.apply
      appResult = VPStore.Applications.apply(cid, jobId);
      if (!appResult.ok) {
        showToast(appResult.error, 'error');
        btn.disabled = false;
        btn.innerHTML = 'Submit Application';
        return;
      }
      // Save extra details to profile
      VPStore.Profiles.update(cid, {
        phone: phone || undefined,
        totalExp: expVal || undefined,
        coverNote: coverV || undefined,
        skills: skillTags.length ? skillTags : undefined,
        resumeName: resumeName || undefined,
        resumeData: resumeData || undefined,
      });
      // Save education if provided
      if (eduVal) {
        const prof = VPStore.Profiles.get(cid);
        const existingEdu = prof.education || [];
        if (!existingEdu.find(e => e.degree === eduVal)) {
          existingEdu.unshift({ degree: eduVal, institution: '', start: '', end: '', grade: '' });
          VPStore.Profiles.update(cid, { education: existingEdu });
        }
      }
    } else {
      // GUEST: store application with guest data in localStorage
      appResult = guestApply(jobId, job, { name, email, phone, skills: skillTags, exp: expVal, edu: eduVal, cover: coverV, resumeName, resumeData });
    }

    // Success UI
    btn.disabled = false;
    document.getElementById('cr-form-content').style.display = 'none';
    const ss = document.getElementById('cr-success-state');
    ss.classList.add('visible');
    showToast('Application submitted successfully!', 'success');

    // Refresh job cards to show updated applicant count
    setTimeout(function () { loadJobs(); }, 500);
  };

  if (uploadedFile) {
    const reader = new FileReader();
    reader.onload = function (ev) { finalize(ev.target.result, uploadedFile.name); };
    reader.readAsDataURL(uploadedFile);
  } else {
    finalize(null, null);
  }
}

// ── GUEST APPLY (no login) ──
function guestApply(jobId, job, data) {
  // Create a temporary candidate record for guest
  const uid = GUEST_PREFIX + Date.now().toString(36);
  const guestCand = {
    id: uid,
    username: data.name,
    email: data.email,
    avatar: data.name.trim().split(/\s+/).map(w => w[0].toUpperCase()).slice(0,2).join(''),
    color: '#2563eb',
    isGuest: true,
    createdAt: new Date().toISOString()
  };

  // Save guest candidate
  const cands = VPStore.Candidates.getAll();
  cands.push(guestCand);
  try { localStorage.setItem('vp_candidates', JSON.stringify(cands)); } catch(e) {}

  // Create application
  const apps = VPStore.Applications.getAll();
  const appId = 'a_' + Date.now().toString(36);
  const app = {
    id: appId,
    candidateId: uid,
    jobId, jobTitle: job.title, jobDept: job.dept,
    appliedDate: new Date().toISOString().split('T')[0],
    status: 'pending', statusNote: '', statusUpdatedAt: null,
    isGuest: true,
  };
  apps.push(app);
  try { localStorage.setItem('vp_applications', JSON.stringify(apps)); } catch(e) {}
  VPStore.Jobs.incrementApplicants(jobId);

  // Save profile data
  VPStore.Profiles.save(uid, {
    firstName: data.name.split(' ')[0] || '',
    lastName:  data.name.split(' ').slice(1).join(' ') || '',
    phone:     data.phone || '',
    totalExp:  data.exp   || '',
    coverNote: data.cover || '',
    skills:    data.skills || [],
    resumeName: data.resumeName || '',
    resumeData: data.resumeData || '',
    education: data.edu ? [{ degree: data.edu, institution: '', start: '', end: '' }] : [],
  });

  return { ok: true, application: app };
}

// ── SEARCH / FILTER ──
function bindSearch() {
  ['cr-kw','cr-title','cr-skills'].forEach(id => {
    const el = document.getElementById(id);
    if (el) el.addEventListener('input', debounce(applyFilters, 250));
  });
  ['cr-dept','cr-exp','cr-type','cr-mode'].forEach(id => {
    const el = document.getElementById(id);
    if (el) el.addEventListener('change', applyFilters);
  });
}

function bindFilterToggle() {
  const btn = document.getElementById('cr-filter-toggle');
  const row = document.getElementById('cr-filter-row');
  if (!btn || !row) return;
  btn.addEventListener('click', function () {
    const open = row.classList.toggle('open');
    btn.classList.toggle('active', open);
    btn.querySelector('.cr-ft-label').textContent = open ? 'Hide Filters' : 'Advanced Filters';
  });
}

function clearSearch() {
  ['cr-kw','cr-title','cr-skills'].forEach(id => {
    const el = document.getElementById(id);
    if (el) el.value = '';
  });
  ['cr-dept','cr-exp','cr-type','cr-mode'].forEach(id => {
    const el = document.getElementById(id);
    if (el) el.value = '';
  });
  applyFilters();
}

function buildFilterOptions() {
  // Build dept options dynamically from posted jobs
  const depts = [...new Set(VPStore.Jobs.getActive().map(j => j.dept).filter(Boolean))];
  const deptSel = document.getElementById('cr-dept');
  if (deptSel) {
    deptSel.innerHTML = '<option value="">All Departments</option>' +
      ['Operations','Quality Control','Sales & Export','Manufacturing','Logistics','HR','Finance','IT','General']
        .map(d => '<option value="' + d + '">' + d + '</option>').join('');
  }
}

function renderFilterChips() {
  const chips = document.getElementById('cr-active-filters');
  if (!chips) return;
  const active = [];
  const labels = {
    'cr-kw':    v => 'Keyword: ' + v,
    'cr-title': v => 'Title: ' + v,
    'cr-skills':v => 'Skills: ' + v,
    'cr-dept':  v => 'Dept: ' + v,
    'cr-exp':   v => 'Exp: ' + v,
    'cr-type':  v => 'Type: ' + v,
    'cr-mode':  v => 'Mode: ' + v,
  };
  Object.entries(labels).forEach(([id, fn]) => {
    const el = document.getElementById(id);
    if (el && el.value) active.push({ id, label: fn(el.value) });
  });
  chips.innerHTML = active.map(a =>
    '<span class="cr-filter-chip" onclick="clearFilter(\'' + a.id + '\')">' + a.label + ' ×</span>'
  ).join('');
}

function clearFilter(id) {
  const el = document.getElementById(id);
  if (el) el.value = '';
  applyFilters();
}

function updateJobCount() {
  const el = document.getElementById('cr-job-count');
  if (el) el.textContent = filteredJobs.length + ' job' + (filteredJobs.length !== 1 ? 's' : '');
}

function updateHeroStats() {
  const jobs = VPStore.Jobs.getActive();
  const el = document.getElementById('cr-stat-jobs');
  if (el) el.textContent = jobs.length;
}

// ── SORT ──
function sortJobs(val) {
  if (val === 'newest')  filteredJobs.sort((a,b) => new Date(b.postedDate) - new Date(a.postedDate));
  if (val === 'oldest')  filteredJobs.sort((a,b) => new Date(a.postedDate) - new Date(b.postedDate));
  if (val === 'deadline')filteredJobs.sort((a,b) => new Date(a.deadline)   - new Date(b.deadline));
  renderJobs();
}

// ── TOAST ──
function showToast(msg, type) {
  if (type === undefined) type = 'info';
  const el = document.getElementById('cr-toast');
  if (!el) return;
  const icons = { success: '✅', error: '❌', info: 'ℹ️' };
  el.querySelector('.cr-toast-icon').textContent = icons[type] || 'ℹ️';
  el.querySelector('.cr-toast-msg').textContent  = msg;
  el.className = 'cr-toast ' + type + ' show';
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => el.classList.remove('show'), 3500);
}

// ── HELPERS ──
function escHtml(str) {
  return String(str).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
}
function debounce(fn, delay) {
  let t;
  return function () {
    clearTimeout(t);
    t = setTimeout(() => fn.apply(this, arguments), delay);
  };
}
