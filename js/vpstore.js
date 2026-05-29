/**
 * vpstore.js — Aivirtrix shared data layer (localStorage)
 * Keys: vp_jobs, vp_candidates, vp_applications, vp_job_history
 */
const VPStore = (() => {
  function load(k)    { try { return JSON.parse(localStorage.getItem(k)) || []; } catch { return []; } }
  function save(k, d) { localStorage.setItem(k, JSON.stringify(d)); }
  function uid()      { return Date.now().toString(36) + Math.random().toString(36).slice(2,7); }

  const COLORS = ['#1d4ed8','#7c3aed','#059669','#b45309','#dc2626','#0891b2','#be185d','#15803d'];
  function avatarColor(n) { let h=0; for(const c of n) h=(h*31+c.charCodeAt(0))&0xffff; return COLORS[h%COLORS.length]; }
  function initials(n)    { return n.trim().split(/\s+/).map(w=>w[0].toUpperCase()).slice(0,2).join(''); }

  const Jobs = {
    getAll()    { return load('vp_jobs'); },
    getById(id) { return this.getAll().find(j=>j.id===id)||null; },
    getActive() {
      const now = new Date();
      return this.getAll().filter(j=>j.status==='active' && new Date(j.deadline)>=now);
    },
    add(data) {
      const jobs = this.getAll();
      const job = {
        id: 'j_'+uid(), title:data.title||'', dept:data.dept||'', type:data.type||'',
        location:data.location||'', mode:data.mode||'', desc:data.desc||'',
        requirements:data.requirements||'', benefits:data.benefits||'', skillReq:data.skillReq||'', team:data.team||'', goal:data.goal||'',
        salary:data.salary||'', deadline:data.deadline||'',
        postedDate:new Date().toISOString().split('T')[0],
        status:'active', applicants:0,
      };
      jobs.push(job); save('vp_jobs',jobs); return job;
    },
    // Fix: both delete() and remove() work, archive to history first
    delete(id) {
      const jobs = this.getAll();
      const job  = jobs.find(j=>j.id===id);
      if (job) {
        job.deletedAt = new Date().toISOString();
        job.deleteReason = 'deleted';
        const history = load('vp_job_history');
        history.push(job);
        save('vp_job_history', history);
      }
      save('vp_jobs', jobs.filter(j=>j.id!==id));
      // Mark related applications as job-deleted so candidates see it
      const apps = load('vp_applications');
      apps.forEach(a => { if(a.jobId===id && a.status==='pending') a.status='job_deleted'; });
      save('vp_applications', apps);
    },
    remove(id) { return this.delete(id); }, // alias fix
    archiveExpired() {
      const now  = new Date();
      const jobs = this.getAll();
      const history = load('vp_job_history');
      const active = [], toArchive = [];
      jobs.forEach(j => {
        if (j.status==='active' && new Date(j.deadline) < now) {
          j.status='expired'; j.expiredAt=new Date().toISOString();
          toArchive.push(j);
        } else { active.push(j); }
      });
      if (toArchive.length) {
        history.push(...toArchive);
        save('vp_job_history', history);
        save('vp_jobs', active);
      }
    },
    getHistory() { return load('vp_job_history'); },
    incrementApplicants(jobId) {
      const jobs=this.getAll(), j=jobs.find(j=>j.id===jobId);
      if(j){j.applicants=(j.applicants||0)+1; save('vp_jobs',jobs);}
    },
    decrementApplicants(jobId) {
      const jobs=this.getAll(), j=jobs.find(j=>j.id===jobId);
      if(j){j.applicants=Math.max(0,(j.applicants||1)-1); save('vp_jobs',jobs);}
    },
  };

  const Candidates = {
    getAll()          { return load('vp_candidates'); },
    getById(id)       { return this.getAll().find(c=>c.id===id)||null; },
    getByUsername(un) { return this.getAll().find(c=>c.username.toLowerCase()===un.toLowerCase())||null; },
    exists(un)        { return !!this.getByUsername(un); },
    register(data) {
      if(this.exists(data.username)) return {ok:false,error:'Username already taken.'};
      if(this.getAll().find(c=>c.email.toLowerCase()===data.email.toLowerCase()))
        return {ok:false,error:'Email already registered.'};
      const cands=this.getAll();
      const cand={id:'c_'+uid(),username:data.username.trim(),password:data.password,
        email:data.email.trim().toLowerCase(),avatar:initials(data.username),
        color:avatarColor(data.username),createdAt:new Date().toISOString()};
      cands.push(cand); save('vp_candidates',cands); return {ok:true,candidate:cand};
    },
    login(username,password) {
      const c=this.getByUsername(username);
      if(!c)             return {ok:false,error:'Username not found.'};
      if(c.password!==password) return {ok:false,error:'Incorrect password.'};
      return {ok:true,candidate:c};
    },
  };

  const Applications = {
    getAll()            { return load('vp_applications'); },
    getById(id)         { return this.getAll().find(a=>a.id===id)||null; },
    getByCandidate(cid) { return this.getAll().filter(a=>a.candidateId===cid); },
    getByJob(jobId)     { return this.getAll().filter(a=>a.jobId===jobId&&a.status!=='withdrawn'); },
    activeCount(cid)    { return this.getByCandidate(cid).filter(a=>!['withdrawn','job_deleted'].includes(a.status)).length; },
    alreadyApplied(cid,jobId) {
      return this.getAll().some(a=>a.candidateId===cid&&a.jobId===jobId&&!['withdrawn','job_deleted'].includes(a.status));
    },
    apply(candidateId,jobId,extra) {
      const job=Jobs.getById(jobId), cand=Candidates.getById(candidateId);
      if(!job)  return {ok:false,error:'Job not found.'};
      if(!cand) return {ok:false,error:'Candidate not found.'};
      if(this.alreadyApplied(candidateId,jobId)) return {ok:false,error:'You already applied for this job.'};
      if(!cand.isGuest && this.activeCount(candidateId)>=4) return {ok:false,error:'You have reached the 4-application limit. Please withdraw one to apply here.'};
      const apps=this.getAll();
      const app={id:'a_'+uid(),candidateId,jobId,jobTitle:job.title,jobDept:job.dept,
        appliedDate:new Date().toISOString().split('T')[0],
        status:'pending',statusNote:'',statusUpdatedAt:null,
        source:(extra&&extra.source)||'portal',
        isGuest:cand.isGuest||false};
      apps.push(app); save('vp_applications',apps);
      Jobs.incrementApplicants(jobId);
      return {ok:true,application:app};
    },
    withdraw(appId,candidateId) {
      const apps=this.getAll(), app=apps.find(a=>a.id===appId&&a.candidateId===candidateId);
      if(!app) return {ok:false,error:'Application not found.'};
      if(app.status==='withdrawn') return {ok:false,error:'Already withdrawn.'};
      app.status='withdrawn'; app.statusUpdatedAt=new Date().toISOString();
      save('vp_applications',apps); Jobs.decrementApplicants(app.jobId);
      return {ok:true};
    },
    updateStatus(appId,status,note='') {
      const apps=this.getAll(), app=apps.find(a=>a.id===appId);
      if(!app) return false;
      app.status=status; app.statusNote=note; app.statusUpdatedAt=new Date().toISOString();
      save('vp_applications',apps); return true;
    },
  };


  // ── CANDIDATE PROFILES (extended data) ──
  const Profiles = {
    key(cid) { return 'vp_profile_' + cid; },
    get(cid) {
      try { return JSON.parse(localStorage.getItem(this.key(cid))) || {}; } catch { return {}; }
    },
    save(cid, data) { localStorage.setItem(this.key(cid), JSON.stringify(data)); },
    update(cid, fields) {
      const cur = this.get(cid);
      this.save(cid, { ...cur, ...fields });
    },
    completeness(cid) {
      const p = this.get(cid);
      const checks = {
        firstName:        () => !!(p.firstName && p.firstName.trim()),
        lastName:         () => !!(p.lastName && p.lastName.trim()),
        phone:            () => !!(p.phone && p.phone.trim()),
        presentLocation:  () => !!(p.presentLocation && p.presentLocation.trim()),
        education:        () => Array.isArray(p.education) && p.education.length > 0,
        skills:           () => Array.isArray(p.skills) && p.skills.length > 0,
        resume:           () => !!(p.resumeName && p.resumeName.trim()),
        totalExp:         () => !!(p.totalExp && p.totalExp.trim()),
        linkedin:         () => !!(p.linkedin && p.linkedin.trim()),
        summary:          () => !!(p.summary && p.summary.trim()),
      };
      const total = Object.keys(checks).length;
      const filled = Object.values(checks).filter(fn => fn()).length;
      return Math.round((filled / total) * 100);
    }
  };

  return {Jobs,Candidates,Applications,Profiles,avatarColor,initials};
})();

