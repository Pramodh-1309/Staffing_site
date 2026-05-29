<%@ Page Language="C#" AutoEventWireup="true" CodeFile="candidate-dashboard.aspx.cs" Inherits="Pages_candidate_dashboard" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Candidate Dashboard &ndash; Aivirtrix</title>
  <link rel="icon" type="image/png" sizes="32x32" href="<%= ResolveUrl("~/images/favicon.png") %>"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet"/>
  <link rel="stylesheet" href="<%= ResolveUrl("~/css/style.css") %>"/>
  <link rel="stylesheet" href="<%= ResolveUrl("~/css/navbar.css") %>"/>
  <link rel="stylesheet" href="<%= ResolveUrl("~/css/responsive.css") %>"/>
  <link rel="stylesheet" href="<%= ResolveUrl("~/Mobile/mobile-overrides.css") %>"/>
  <script src="<%= ResolveUrl("~/js/vpstore.js") %>"></script>
  <style>
body{padding-top:83px!important;background:#f7f8fb;overflow-x:hidden;-webkit-font-smoothing:antialiased;font-family:'Poppins',sans-serif}
#topbar{z-index:100!important}
.dash-navbar{position:fixed;top:33px;left:0;right:0;z-index:10001;background:#111318;border-bottom:1px solid rgba(255,255,255,.08);height:50px;display:flex;align-items:center;padding:0 1.5rem;gap:0}
.dn-brand{display:flex;align-items:center;gap:.6rem;padding-right:1.5rem;border-right:1px solid rgba(255,255,255,.08);margin-right:1rem;flex-shrink:0}
.dn-brand-icon{width:28px;height:28px;background:#2563eb;border-radius:6px;display:flex;align-items:center;justify-content:center;font-size:.8rem;flex-shrink:0}
.dn-brand-name{font-size:.74rem;font-weight:800;color:#fff;white-space:nowrap}
.dn-brand-sub{font-size:.58rem;color:rgba(255,255,255,.35)}
.dn-nav{display:flex;align-items:center;gap:.15rem;flex:1}
.dn-item{display:flex;align-items:center;gap:.42rem;padding:.42rem .85rem;font-size:.75rem;font-weight:500;color:rgba(255,255,255,.48);cursor:pointer;border-radius:6px;border-bottom:2px solid transparent;transition:all .18s;text-decoration:none;user-select:none;white-space:nowrap}
.dn-item:hover{color:rgba(255,255,255,.9);background:rgba(255,255,255,.05)}
.dn-item.active{color:#fff;background:rgba(37,99,235,.15);border-bottom-color:#2563eb;font-weight:600}
.dn-item svg{width:13px;height:13px;fill:none;stroke:currentColor;stroke-width:2;stroke-linecap:round;stroke-linejoin:round;flex-shrink:0}
.dn-badge{background:#2563eb;color:#fff;font-size:.56rem;font-weight:700;padding:.08rem .38rem;border-radius:50px;min-width:15px;text-align:center;line-height:1.4}
.dn-badge.hidden{display:none}
.dn-sep{width:1px;height:20px;background:rgba(255,255,255,.08);margin:0 .5rem;flex-shrink:0}
.dn-right{display:flex;align-items:center;gap:.7rem;padding-left:1rem;border-left:1px solid rgba(255,255,255,.08);margin-left:auto;flex-shrink:0}
.dn-avatar{width:26px;height:26px;background:#2563eb;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:.58rem;font-weight:800;color:#fff;flex-shrink:0}
.dn-uname{font-size:.72rem;font-weight:700;color:#fff}
.dn-urole{font-size:.58rem;color:rgba(255,255,255,.3)}
.dn-logout{background:none;border:none;color:rgba(255,255,255,.3);cursor:pointer;font-size:.78rem;transition:color .2s;padding:.2rem;display:flex;align-items:center}
.dn-logout:hover{color:#f87171}
.dn-logout svg{width:14px;height:14px;fill:none;stroke:currentColor;stroke-width:2;stroke-linecap:round;stroke-linejoin:round}
.dash-titlebar{background:#fff;border-bottom:1px solid rgba(0,0,0,.07);padding:.75rem 1.8rem;display:flex;align-items:center;justify-content:space-between}
.dt-title{font-size:.93rem;font-weight:800;color:#0a0a0a}
.dt-crumb{font-size:.65rem;color:#9ca3af;margin-top:.05rem}
.dt-right{display:flex;align-items:center;gap:.65rem}
.dt-btn{background:#f3f4f6;border:1px solid #e5e7eb;color:#374151;border-radius:6px;padding:.42rem .9rem;font-family:'Poppins',sans-serif;font-size:.72rem;font-weight:600;cursor:pointer;transition:all .18s;text-decoration:none;display:inline-flex;align-items:center;gap:.35rem}
.dt-btn:hover{border-color:#2563eb;color:#2563eb;background:#eff6ff}
.dt-btn.primary{background:#2563eb;color:#fff;border-color:#2563eb;box-shadow:0 2px 10px rgba(37,99,235,.28)}
.dt-btn.primary:hover{background:#1d4ed8;transform:translateY(-1px)}
.dash-content{padding:1.8rem}
.pg{display:none;animation:pgIn .22s ease}
.pg.active{display:block}
@keyframes pgIn{from{opacity:0;transform:translateY(7px)}to{opacity:1;transform:translateY(0)}}
.pg-head{margin-bottom:1.6rem}
.pg-tag{font-size:.65rem;font-weight:700;letter-spacing:.15em;text-transform:uppercase;color:#2563eb;margin-bottom:.4rem}
.pg-title{font-size:1.3rem;font-weight:800;color:#0a0a0a;margin-bottom:.3rem}
.pg-title em{font-style:italic;color:#2563eb}
.pg-sub{font-size:.78rem;color:#6b7280;line-height:1.6}
.stats-row{display:grid;grid-template-columns:repeat(4,1fr);gap:1rem;margin-bottom:1.6rem}
.stat-card{background:#fff;border:1px solid rgba(0,0,0,.08);border-radius:9px;padding:1.2rem;transition:border-color .2s,box-shadow .2s}
.stat-card:hover{border-color:rgba(37,99,235,.25);box-shadow:0 4px 18px rgba(37,99,235,.08)}
.sc-icon{font-size:1.3rem;margin-bottom:.6rem}
.sc-label{font-size:.62rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#9ca3af;margin-bottom:.35rem}
.sc-val{font-size:1.9rem;font-weight:lighter;color:#0a0a0a;line-height:1;font-family:monospace}
.sc-note{font-size:.67rem;color:#6b7280;margin-top:.3rem}
.panel{background:#fff;border:1px solid rgba(0,0,0,.08);border-radius:9px;overflow:hidden;margin-bottom:1.3rem}
.panel-head{padding:.9rem 1.3rem;border-bottom:1px solid rgba(0,0,0,.06);display:flex;align-items:center;justify-content:space-between}
.panel-title{font-size:.82rem;font-weight:700;color:#0a0a0a}
.panel-link{font-size:.72rem;color:#2563eb;cursor:pointer;background:none;border:none;font-family:inherit;padding:0;transition:color .2s;text-decoration:none}
.panel-link:hover{color:#1d4ed8}
.form-card{background:#fff;border:1px solid rgba(0,0,0,.08);border-radius:9px;padding:1.5rem;margin-bottom:1.2rem}
.form-card-title{font-size:.82rem;font-weight:700;color:#0a0a0a;margin-bottom:1rem;padding-bottom:.7rem;border-bottom:1px solid rgba(0,0,0,.06);display:flex;align-items:center;gap:.5rem}
.form-section-label{font-size:.65rem;font-weight:700;letter-spacing:.12em;text-transform:uppercase;color:#9ca3af;margin:1.4rem 0 .9rem;display:flex;align-items:center;gap:.6rem}
.form-section-label::after{content:'';flex:1;height:1px;background:#e5e7eb}
.fg{margin-bottom:1rem}
.fg-label{display:block;font-size:.63rem;font-weight:700;letter-spacing:.09em;text-transform:uppercase;color:#374151;margin-bottom:.38rem}
.fg-label span{color:#dc2626;margin-left:.2rem}
.fg-input,.fg-select,.fg-textarea{width:100%;border:1.5px solid #e5e7eb;border-radius:7px;padding:.7rem .95rem;font-family:'Poppins',sans-serif;font-size:.82rem;color:#0a0a0a;outline:none;transition:border-color .2s,box-shadow .2s;box-sizing:border-box;background:#fff}
.fg-input::placeholder,.fg-textarea::placeholder{color:#9ca3af}
.fg-input:focus,.fg-select:focus,.fg-textarea:focus{border-color:#2563eb;box-shadow:0 0 0 3px rgba(37,99,235,.1)}
.fg-textarea{resize:vertical;min-height:90px;line-height:1.6}
.fg-grid-2{display:grid;grid-template-columns:1fr 1fr;gap:1rem}
.fg-grid-3{display:grid;grid-template-columns:1fr 1fr 1fr;gap:1rem}
.fg-hint{font-size:.67rem;color:#9ca3af;margin-top:.3rem}
/* profile progress */
.profile-progress{background:#fff;border:1px solid rgba(0,0,0,.08);border-radius:9px;padding:1.2rem 1.5rem;margin-bottom:1.3rem;display:flex;align-items:center;gap:1.5rem}
.pp-circle{width:56px;height:56px;border-radius:50%;background:conic-gradient(#2563eb calc(var(--pct)*3.6deg),#e5e7eb 0deg);display:flex;align-items:center;justify-content:center;flex-shrink:0;position:relative}
.pp-circle::before{content:'';position:absolute;inset:6px;background:#fff;border-radius:50%}
.pp-pct{font-size:.75rem;font-weight:800;color:#0a0a0a;position:relative;z-index:1}
.pp-text strong{font-size:.88rem;font-weight:700;color:#0a0a0a;display:block;margin-bottom:.2rem}
.pp-text span{font-size:.76rem;color:#6b7280}
.pp-action{margin-left:auto}
/* resume upload */
.resume-zone{border:2px dashed #e5e7eb;border-radius:8px;padding:2rem;text-align:center;cursor:pointer;transition:all .2s;background:#f9fafb}
.resume-zone:hover,.resume-zone.drag{border-color:#2563eb;background:#eff6ff}
.resume-zone p{font-size:.8rem;color:#9ca3af;margin-top:.5rem}
.resume-zone strong{color:#2563eb}
.resume-uploaded{background:#f0fdf4;border:1.5px solid #bbf7d0;border-radius:8px;padding:.9rem 1.2rem;display:flex;align-items:center;gap:.8rem}
.ru-icon{font-size:1.4rem}
.ru-name{font-size:.82rem;font-weight:600;color:#0a0a0a}
.ru-meta{font-size:.68rem;color:#9ca3af}
/* edu/exp entries */
.entry-card{background:#f9fafb;border:1px solid #e5e7eb;border-radius:8px;padding:1rem 1.2rem;margin-bottom:.8rem;position:relative}
.entry-card-title{font-size:.85rem;font-weight:700;color:#0a0a0a}
.entry-card-sub{font-size:.75rem;color:#6b7280;margin-top:.2rem}
.entry-card-del{position:absolute;top:.7rem;right:.8rem;background:none;border:none;color:#d1d5db;cursor:pointer;font-size:.9rem;transition:color .2s}
.entry-card-del:hover{color:#dc2626}
/* jobs */
.job-card{background:#fff;border:1px solid rgba(0,0,0,.08);border-radius:9px;padding:1.3rem;margin-bottom:1rem;transition:border-color .2s,box-shadow .2s}
.job-card:hover{border-color:rgba(37,99,235,.25);box-shadow:0 4px 18px rgba(37,99,235,.08)}
.jc-title{font-size:.92rem;font-weight:700;color:#0a0a0a;margin-bottom:.3rem}
.jc-meta{font-size:.72rem;color:#9ca3af;display:flex;flex-wrap:wrap;gap:.4rem;margin-bottom:.7rem}
.jc-desc{font-size:.78rem;color:#6b7280;line-height:1.65;margin-bottom:.8rem;display:-webkit-box;-webkit-line-clamp:3;-webkit-box-orient:vertical;overflow:hidden}
.jc-footer{display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:.5rem;padding-top:.8rem;border-top:1px solid rgba(0,0,0,.06)}
/* pills */
.pill{display:inline-flex;align-items:center;gap:.25rem;font-size:.63rem;font-weight:700;padding:.2rem .6rem;border-radius:50px;white-space:nowrap}
.pill-green{background:#f0fdf4;color:#16a34a;border:1px solid #bbf7d0}
.pill-blue{background:#eff6ff;color:#2563eb;border:1px solid #bfdbfe}
.pill-amber{background:#fffbeb;color:#d97706;border:1px solid #fde68a}
.pill-red{background:#fef2f2;color:#dc2626;border:1px solid #fecaca}
.pill-gray{background:#f3f4f6;color:#6b7280;border:1px solid #e5e7eb}
/* buttons */
.btn{display:inline-flex;align-items:center;gap:.35rem;font-family:'Poppins',sans-serif;font-weight:600;border:1.5px solid transparent;border-radius:6px;cursor:pointer;transition:all .17s;white-space:nowrap;font-size:.72rem;padding:.4rem .9rem}
.btn-primary{background:#2563eb;color:#fff;border-color:#2563eb;box-shadow:0 2px 8px rgba(37,99,235,.25)}
.btn-primary:hover{background:#1d4ed8;transform:translateY(-1px)}
.btn-primary:disabled{background:#d1d5db;border-color:#d1d5db;box-shadow:none;cursor:not-allowed;transform:none}
.btn-success{background:#f0fdf4;color:#16a34a;border-color:#bbf7d0}
.btn-success:hover{background:#dcfce7}
.btn-danger{background:#fef2f2;color:#dc2626;border-color:#fecaca}
.btn-danger:hover{background:#fee2e2}
.btn-ghost{background:#fff;color:#374151;border-color:#e5e7eb}
.btn-ghost:hover{border-color:#2563eb;color:#2563eb}
.btn-sm{padding:.28rem .7rem;font-size:.65rem}
.btn-lg{padding:.7rem 1.6rem;font-size:.82rem;border-radius:7px}
/* app rows */
.app-row{display:flex;align-items:center;gap:.9rem;padding:.9rem 1.2rem;border-bottom:1px solid rgba(0,0,0,.05);transition:background .15s}
.app-row:last-child{border-bottom:none}
.app-row:hover{background:#f9fafb}
/* filter/search */
.filter-select{border:1.5px solid #e5e7eb;border-radius:6px;padding:.38rem .75rem;font-family:'Poppins',sans-serif;font-size:.72rem;color:#374151;background:#fff;cursor:pointer;outline:none}
.search-input{border:1.5px solid #e5e7eb;border-radius:6px;padding:.38rem .85rem;font-family:'Poppins',sans-serif;font-size:.73rem;color:#0a0a0a;outline:none;transition:border-color .2s}
.search-input:focus{border-color:#2563eb}
/* limit bar */
.limit-bar{display:flex;align-items:center;gap:.5rem;background:rgba(37,99,235,.08);border:1px solid rgba(37,99,235,.2);border-radius:6px;padding:.38rem .85rem;font-size:.7rem;font-weight:600;color:#2563eb}
.limit-bar.warn{background:rgba(245,158,11,.08);border-color:rgba(245,158,11,.25);color:#d97706}
.limit-bar.full{background:rgba(220,38,38,.08);border-color:rgba(220,38,38,.2);color:#dc2626}
/* skills tags */
.skill-tag{display:inline-flex;align-items:center;gap:.3rem;background:#eff6ff;color:#2563eb;border:1px solid #bfdbfe;border-radius:50px;padding:.2rem .7rem;font-size:.7rem;font-weight:600;margin:.2rem}
.skill-tag button{background:none;border:none;cursor:pointer;color:#2563eb;font-size:.75rem;line-height:1;padding:0;transition:color .18s}
.skill-tag button:hover{color:#dc2626}
/* empty */
.empty-state{text-align:center;padding:3rem 2rem;color:#9ca3af}
.ei{font-size:2.2rem;margin-bottom:.6rem;opacity:.45;display:block}
.empty-state p{font-size:.8rem;line-height:1.7}
/* toast */
.toast{position:fixed;bottom:1.5rem;right:1.5rem;z-index:600;background:#fff;border:1px solid rgba(0,0,0,.1);border-left:3px solid #2563eb;border-radius:9px;padding:.85rem 1.2rem;display:flex;align-items:center;gap:.65rem;font-size:.78rem;color:#0a0a0a;transform:translateY(20px);opacity:0;transition:all .25s;pointer-events:none;box-shadow:0 8px 28px rgba(0,0,0,.1);min-width:240px}
.toast.show{transform:translateY(0);opacity:1}
.toast.success{border-left-color:#16a34a}
.toast.error{border-left-color:#dc2626}
.overlay{position:fixed;inset:0;background:rgba(0,0,0,.5);z-index:300;display:flex;align-items:center;justify-content:center;opacity:0;pointer-events:none;transition:opacity .22s}
.overlay.open{opacity:1;pointer-events:all}
.modal{background:#fff;border-radius:10px;padding:1.6rem;width:100%;max-width:520px;transform:translateY(16px);transition:transform .22s;max-height:90vh;overflow-y:auto;box-shadow:0 20px 60px rgba(0,0,0,.15)}
.overlay.open .modal{transform:translateY(0)}
.modal-title{font-size:.95rem;font-weight:800;color:#0a0a0a;margin-bottom:1.2rem;display:flex;align-items:center;justify-content:space-between}
.modal-close{background:none;border:none;color:#9ca3af;cursor:pointer;font-size:1.1rem;transition:color .2s}
.modal-close:hover{color:#dc2626}
.modal-footer{display:flex;gap:.7rem;justify-content:flex-end;margin-top:1.2rem;padding-top:1rem;border-top:1px solid #e5e7eb}
::-webkit-scrollbar{width:5px}
::-webkit-scrollbar-track{background:transparent}
::-webkit-scrollbar-thumb{background:#d1d5db;border-radius:50px}
@media(max-width:768px){
  body{padding-top:75px!important}
  .dash-navbar{height:42px;padding:0 1rem}
  .dn-brand{display:none}
  .dn-item span{display:none}
  .dn-item{padding:.4rem .55rem}
  .stats-row{grid-template-columns:1fr 1fr}
  .fg-grid-2,.fg-grid-3{grid-template-columns:1fr}
}

  

.legal-modal-backdrop.open{display:flex!important;}
.legal-section{margin-bottom:1.2rem;}
.legal-section-title{font-weight:700;font-size:.9rem;color:#0a0a0a;margin-bottom:.4rem;}
.legal-section-body p{font-size:.83rem;color:#4b5563;line-height:1.75;}
  </style>
</head>
<body>
<!-- TOP BAR -->
<div id="topbar">
  <div class="topbar-left">
    <a class="topbar-item" href="mailto:info@aivirtrix.com">&#x2709; info@aivirtrix.com</a>
    <div class="topbar-divider"></div>
    <a class="topbar-item" href="tel:+18000000000">&#128222; +1-800-000-0000</a>
    <div class="topbar-divider"></div>
    <span class="topbar-item">&#128205; Delaware, USA</span>
  </div>
  <div class="topbar-right">
    <div class="topbar-social"><a href="#" title="LinkedIn">LinkedIn</a></div>
  </div>
</div>
<div id="topbar">
  <div class="topbar-left">
    <a class="topbar-item" href="mailto:info@aivirtrix.com">&#x2709; info@aivirtrix.com</a>
    <div class="topbar-divider"></div>
    <a class="topbar-item" href="tel:+18000000000">&#128222; +1-XXX-XXXXXXXX</a>
    <div class="topbar-divider"></div>
    <span class="topbar-item">&#128205; Delaware, USA</span>
  </div>
  <div class="topbar-right">
    <div class="topbar-social"><a href="#" title="LinkedIn">LinkedIn</a></div>
  </div>
</div>
<nav class="dash-navbar">
    <div class="dn-brand">
      <div class="dn-brand-icon">👤</div>
      <div>
        <div class="dn-brand-name" id="sb-username">Candidate</div>
        <div class="dn-brand-sub">Candidate Portal</div>
      </div>
    </div>
    <div class="dn-nav">
      <div class="dn-item active" data-page="dashboard" onclick="nav('dashboard',this)">
        <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
        <span>My Dashboard</span>
      </div>
      <div class="dn-item" data-page="jobs" onclick="nav('jobs',this)">
        <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
        <span>Job Openings</span>
        <span class="dn-badge hidden" id="badge-jobs">0</span>
      </div>
      <div class="dn-item" data-page="tracker" onclick="nav('tracker',this)">
        <svg viewBox="0 0 24 24"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
        <span>My Applications</span>
        <span class="dn-badge hidden" id="badge-apps">0</span>
      </div>
      <div class="dn-item" data-page="profile" onclick="nav('profile',this)">
        <svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
        <span>My Profile</span>
        <span class="dn-badge hidden" id="badge-profile">!</span>
      </div>
      <div class="dn-sep"></div>
      <a class="dn-item" href="<%= ResolveUrl("~/Default.aspx") %>">
        <svg viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
        <span>← Site</span>
      </a>
      <a class="dn-item" href="<%= ResolveUrl("~/pages/careers.aspx") %>">
        <svg viewBox="0 0 24 24"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/></svg>
        <span>Careers</span>
      </a>
    </div>
    <div class="dn-right">
      <div class="limit-bar" id="limit-bar">
        <span id="limit-dots"></span>
        <span id="limit-txt">0/4</span>
      </div>
      <button class="dt-btn primary" onclick="navTo('jobs')">Browse Jobs</button>
      <div class="dn-sep"></div>
      <div class="dn-avatar" id="dn-avatar">?</div>
      <div>
        <div class="dn-uname" id="dn-uname">Candidate</div>
        <div class="dn-urole">Candidate Account</div>
      </div>
      <button class="dn-logout" onclick="doLogout()" title="Logout">
        <svg viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
      </button>
    </div>
  </nav>

  <div class="dash-titlebar">
    <div>
      <div class="dt-title" id="dt-title">My Dashboard</div>
      <div class="dt-crumb" id="dt-crumb">Aivirtrix · Candidate Portal</div>
    </div>
  </div>

  <div class="dash-content">

    <!-- ══ DASHBOARD ══ -->
    <div class="pg active" id="pg-dashboard">
      <div class="pg-head">
        <div class="pg-tag">My Portal</div>
        <div class="pg-title">Welcome, <em id="pg-welcome">Candidate</em></div>
        <div class="pg-sub">Your application summary and open opportunities.</div>
      </div>
      <div class="stats-row">
        <div class="stat-card"><div class="sc-icon">📋</div><div class="sc-label">My Applications</div><div class="sc-val" id="s-myapps">0</div><div class="sc-note">Active</div></div>
        <div class="stat-card"><div class="sc-icon">✅</div><div class="sc-label">Shortlisted</div><div class="sc-val" id="s-short">0</div><div class="sc-note">Good news!</div></div>
        <div class="stat-card"><div class="sc-icon">⏳</div><div class="sc-label">Pending</div><div class="sc-val" id="s-pend">0</div><div class="sc-note">Under review</div></div>
        <div class="stat-card"><div class="sc-icon">🌐</div><div class="sc-label">Open Jobs</div><div class="sc-val" id="s-open">0</div><div class="sc-note">Available now</div></div>
      </div>
      <div class="panel">
        <div class="panel-head">
          <div class="panel-title">My Recent Applications</div>
          <button class="btn btn-ghost btn-sm" onclick="navTo('tracker')">View All →</button>
        </div>
        <div id="dash-apps"></div>
      </div>
      <div class="panel">
        <div class="panel-head">
          <div class="panel-title">Latest Open Positions</div>
          <button class="btn btn-ghost btn-sm" onclick="navTo('jobs')">Browse All →</button>
        </div>
        <div id="dash-jobs-snippet"></div>
      </div>
    </div>

    <!-- ══ BROWSE JOBS ══ -->
    <div class="pg" id="pg-jobs">
      <div class="pg-head">
        <div class="pg-tag">Opportunities</div>
        <div class="pg-title">Browse <em>Open Jobs</em></div>
        <div class="pg-sub">Apply to up to 4 positions at a time. Complete your profile to strengthen applications.</div>
      </div>
      <div style="display:flex;gap:.7rem;margin-bottom:1.2rem;flex-wrap:wrap;align-items:center">
        <select class="filter-select" id="filter-dept" onchange="renderJobs()"><option value="">All Departments</option></select>
        <select class="filter-select" id="filter-type" onchange="renderJobs()">
          <option value="">All Types</option>
          <option>Full-time</option><option>Part-time</option><option>Contract</option><option>Internship</option>
        </select>
        <input class="search-input" id="search-job" placeholder="🔍 Search jobs..." oninput="renderJobs()" style="width:200px"/>
        <span style="font-size:.75rem;color:#9ca3af;margin-left:auto">Slots used: <strong id="slots-used">0</strong>/4</span>
      </div>
      <div id="jobs-grid"><div class="empty-state"><span class="ei">📭</span><p>No open positions right now.<br>Check back soon.</p></div></div>
    </div>

    <!-- ══ MY APPLICATIONS ══ -->
    <div class="pg" id="pg-tracker">
      <div class="pg-head">
        <div class="pg-tag">My Activity</div>
        <div class="pg-title">My <em>Applications</em></div>
        <div class="pg-sub">Track and manage all your job applications.</div>
      </div>
      <div class="panel">
        <div class="panel-head">
          <div class="panel-title">Application Tracker</div>
          <select class="filter-select" id="filter-app-status" onchange="renderTracker()">
            <option value="">All Status</option>
            <option value="pending">Pending</option>
            <option value="shortlisted">Shortlisted</option>
            <option value="rejected">Rejected</option>
            <option value="withdrawn">Withdrawn</option>
            <option value="job_deleted">Job Removed</option>
          </select>
        </div>
        <div id="tracker-list"><div class="empty-state"><span class="ei">📋</span><p>No applications yet.<br>Browse jobs and apply to get started.</p></div></div>
      </div>
    </div>

    <!-- ══ MY PROFILE ══ -->
    <div class="pg" id="pg-profile">
      <div class="pg-head">
        <div class="pg-tag">My Profile</div>
        <div class="pg-title">Candidate <em>Profile</em></div>
        <div class="pg-sub">Complete your profile to help employers know you better. A complete profile increases your chances.</div>
      </div>

      <!-- Completion bar -->
      <div class="profile-progress" id="profile-progress-card">
        <div class="pp-circle" id="pp-circle" style="--pct:0">
          <span class="pp-pct" id="pp-pct">0%</span>
        </div>
        <div class="pp-text">
          <strong>Profile Completeness</strong>
          <span id="pp-msg">Fill in your details to strengthen your applications.</span>
        </div>
        <div class="pp-action">
          <button class="btn btn-primary btn-sm" onclick="saveProfile()">💾 Save Profile</button>
        </div>
      </div>

      <!-- Personal Information -->
      <div class="form-card">
        <div class="form-card-title">👤 Personal Information</div>
        <div class="fg-grid-3">
          <div class="fg">
            <label class="fg-label">First Name <span>*</span></label>
            <input class="fg-input" id="pf-firstName" placeholder="e.g. Ravi"/>
          </div>
          <div class="fg">
            <label class="fg-label">Last Name <span>*</span></label>
            <input class="fg-input" id="pf-lastName" placeholder="e.g. Kumar"/>
          </div>
          <div class="fg">
            <label class="fg-label">Phone Number <span>*</span></label>
            <input class="fg-input" id="pf-phone" type="tel" placeholder="+91 XXXXX XXXXX"/>
          </div>
        </div>
        <div class="fg-grid-2">
          <div class="fg">
            <label class="fg-label">Email Address</label>
            <input class="fg-input" id="pf-email" type="email" readonly style="background:#f9fafb;cursor:default"/>
            <div class="fg-hint">Linked to your account (cannot change)</div>
          </div>
          <div class="fg">
            <label class="fg-label">Date of Birth</label>
            <input class="fg-input" id="pf-dob" type="date"/>
          </div>
        </div>
        <div class="fg-grid-2">
          <div class="fg">
            <label class="fg-label">Gender</label>
            <select class="fg-select" id="pf-gender">
              <option value="">Select gender</option>
              <option>Male</option><option>Female</option><option>Non-binary</option><option>Prefer not to say</option>
            </select>
          </div>
          <div class="fg">
            <label class="fg-label">Nationality</label>
            <input class="fg-input" id="pf-nationality" placeholder="e.g. Indian"/>
          </div>
        </div>
        <div class="fg">
          <label class="fg-label">Professional Summary</label>
          <textarea class="fg-textarea" id="pf-summary" rows="3" placeholder="Brief introduction about yourself, your background and what you're looking for..."></textarea>
        </div>
      </div>

      <!-- Location -->
      <div class="form-card">
        <div class="form-card-title">📍 Location Details</div>
        <div class="fg-grid-2">
          <div class="fg">
            <label class="fg-label">Present Location <span>*</span></label>
            <input class="fg-input" id="pf-presentLocation" placeholder="e.g. Hyderabad, Telangana"/>
          </div>
          <div class="fg">
            <label class="fg-label">Permanent Location</label>
            <input class="fg-input" id="pf-permanentLocation" placeholder="e.g. Vijayawada, Andhra Pradesh"/>
          </div>
        </div>
        <div class="fg-grid-2">
          <div class="fg">
            <label class="fg-label">Willing to Relocate?</label>
            <select class="fg-select" id="pf-relocate">
              <option value="">Select</option>
              <option value="yes">Yes, open to relocation</option>
              <option value="no">No, prefer current location</option>
              <option value="maybe">Open to discussion</option>
            </select>
          </div>
          <div class="fg">
            <label class="fg-label">Preferred Work Mode</label>
            <select class="fg-select" id="pf-workMode">
              <option value="">Select</option>
              <option>On-site</option><option>Remote</option><option>Hybrid</option><option>Any</option>
            </select>
          </div>
        </div>
      </div>

      <!-- Education -->
      <div class="form-card">
        <div class="form-card-title">🎓 Education <span style="font-size:.7rem;font-weight:400;color:#9ca3af;margin-left:.5rem">Add your educational qualifications</span></div>
        <div id="edu-list"></div>
        <div style="background:#f9fafb;border:1px solid #e5e7eb;border-radius:8px;padding:1.2rem;margin-top:.5rem" id="edu-add-form">
          <div style="font-size:.75rem;font-weight:700;color:#374151;margin-bottom:.8rem">Add Education</div>
          <div class="fg-grid-2">
            <div class="fg">
              <label class="fg-label">Degree / Qualification <span>*</span></label>
              <input class="fg-input" id="edu-degree" placeholder="e.g. B.Tech, MBA, 12th Grade"/>
            </div>
            <div class="fg">
              <label class="fg-label">Field of Study <span>*</span></label>
              <input class="fg-input" id="edu-field" placeholder="e.g. Computer Science, Business Administration"/>
            </div>
          </div>
          <div class="fg-grid-2">
            <div class="fg">
              <label class="fg-label">Institution <span>*</span></label>
              <input class="fg-input" id="edu-institution" placeholder="e.g. Osmania University, IIT Hyderabad"/>
            </div>
            <div class="fg">
              <label class="fg-label">Board / University</label>
              <input class="fg-input" id="edu-board" placeholder="e.g. CBSE, Osmania University"/>
            </div>
          </div>
          <div class="fg-grid-3">
            <div class="fg">
              <label class="fg-label">Start Year</label>
              <input class="fg-input" id="edu-start" type="number" min="1990" max="2030" placeholder="2018"/>
            </div>
            <div class="fg">
              <label class="fg-label">End Year (or Expected)</label>
              <input class="fg-input" id="edu-end" type="number" min="1990" max="2030" placeholder="2022"/>
            </div>
            <div class="fg">
              <label class="fg-label">Grade / Percentage / CGPA</label>
              <input class="fg-input" id="edu-grade" placeholder="e.g. 8.5 CGPA, 82%"/>
            </div>
          </div>
          <button class="btn btn-primary btn-sm" onclick="addEducation()">+ Add Education</button>
        </div>
      </div>

      <!-- Experience -->
      <div class="form-card">
        <div class="form-card-title">💼 Work Experience <span style="font-size:.7rem;font-weight:400;color:#9ca3af;margin-left:.5rem">Include internships, part-time, full-time</span></div>
        <div class="fg-grid-2" style="margin-bottom:1rem">
          <div class="fg">
            <label class="fg-label">Total Experience <span>*</span></label>
            <select class="fg-select" id="pf-totalExp">
              <option value="">Select experience level</option>
              <option>Fresher (0 years)</option>
              <option>Less than 1 year</option>
              <option>1–2 years</option>
              <option>2–3 years</option>
              <option>3–5 years</option>
              <option>5–8 years</option>
              <option>8–10 years</option>
              <option>10+ years</option>
            </select>
          </div>
          <div class="fg">
            <label class="fg-label">Current / Last Job Title</label>
            <input class="fg-input" id="pf-currentRole" placeholder="e.g. Quality Analyst, Sales Executive"/>
          </div>
        </div>
        <div class="fg">
          <label class="fg-label">Current / Last CTC (Annual)</label>
          <input class="fg-input" id="pf-currentCTC" placeholder="e.g. ₹3.5 LPA, Fresher, Not Applicable"/>
          <div class="fg-hint">Leave blank if not applicable or uncomfortable sharing</div>
        </div>
        <div class="fg">
          <label class="fg-label">Expected CTC</label>
          <input class="fg-input" id="pf-expectedCTC" placeholder="e.g. ₹5–7 LPA, Negotiable"/>
        </div>
        <div class="fg">
          <label class="fg-label">Notice Period</label>
          <select class="fg-select" id="pf-notice">
            <option value="">Select notice period</option>
            <option>Immediate Joiner</option>
            <option>15 days</option>
            <option>1 month</option>
            <option>2 months</option>
            <option>3 months</option>
            <option>Negotiable</option>
          </select>
        </div>
        <div id="exp-list"></div>
        <div style="background:#f9fafb;border:1px solid #e5e7eb;border-radius:8px;padding:1.2rem;margin-top:.5rem" id="exp-add-form">
          <div style="font-size:.75rem;font-weight:700;color:#374151;margin-bottom:.8rem">Add Work Experience</div>
          <div class="fg-grid-2">
            <div class="fg">
              <label class="fg-label">Job Title <span>*</span></label>
              <input class="fg-input" id="exp-title" placeholder="e.g. Quality Control Officer"/>
            </div>
            <div class="fg">
              <label class="fg-label">Company Name <span>*</span></label>
              <input class="fg-input" id="exp-company" placeholder="e.g. ABC Industries Pvt Ltd"/>
            </div>
          </div>
          <div class="fg-grid-2">
            <div class="fg">
              <label class="fg-label">Employment Type</label>
              <select class="fg-select" id="exp-type">
                <option>Full-time</option><option>Part-time</option><option>Internship</option><option>Contract</option><option>Freelance</option>
              </select>
            </div>
            <div class="fg">
              <label class="fg-label">Location</label>
              <input class="fg-input" id="exp-location" placeholder="e.g. Hyderabad, Telangana"/>
            </div>
          </div>
          <div class="fg-grid-2">
            <div class="fg">
              <label class="fg-label">Start Date</label>
              <input class="fg-input" id="exp-start" type="month"/>
            </div>
            <div class="fg">
              <label class="fg-label">End Date</label>
              <input class="fg-input" id="exp-end" type="month"/>
              <div class="fg-hint">Leave blank if currently working here</div>
            </div>
          </div>
          <div class="fg">
            <label class="fg-label">Key Responsibilities & Achievements</label>
            <textarea class="fg-textarea" id="exp-desc" rows="3" placeholder="Describe your role, key achievements, projects handled..."></textarea>
          </div>
          <button class="btn btn-primary btn-sm" onclick="addExperience()">+ Add Experience</button>
        </div>
      </div>

      <!-- Skills -->
      <div class="form-card">
        <div class="form-card-title">🛠️ Skills & Expertise</div>
        <div class="fg">
          <label class="fg-label">Key Skills <span>*</span></label>
          <div style="display:flex;gap:.5rem;margin-bottom:.6rem">
            <input class="fg-input" id="skill-input" placeholder="Type a skill and press Enter or Add" onkeydown="if(event.key==='Enter'){event.preventDefault();addSkill()}"/>
            <button class="btn btn-ghost btn-sm" onclick="addSkill()">Add</button>
          </div>
          <div id="skills-tags"></div>
          <div class="fg-hint">e.g. Rice Processing, Quality Control, Export Documentation, MS Excel, Tally</div>
        </div>
        <div class="fg-grid-2" style="margin-top:.5rem">
          <div class="fg">
            <label class="fg-label">Languages Known</label>
            <input class="fg-input" id="pf-languages" placeholder="e.g. Telugu, Hindi, English"/>
          </div>
          <div class="fg">
            <label class="fg-label">Certifications</label>
            <input class="fg-input" id="pf-certs" placeholder="e.g. FSSAI Certified, ISO Auditor, Tally ERP"/>
          </div>
        </div>
      </div>

      <!-- Links & Social -->
      <div class="form-card">
        <div class="form-card-title">🔗 Online Presence & Links</div>
        <div class="fg-grid-2">
          <div class="fg">
            <label class="fg-label">LinkedIn Profile</label>
            <input class="fg-input" id="pf-linkedin" type="url" placeholder="https://linkedin.com/in/yourname"/>
          </div>
          <div class="fg">
            <label class="fg-label">GitHub Profile</label>
            <input class="fg-input" id="pf-github" type="url" placeholder="https://github.com/yourname"/>
          </div>
        </div>
        <div class="fg-grid-2">
          <div class="fg">
            <label class="fg-label">Portfolio / Personal Website</label>
            <input class="fg-input" id="pf-portfolio" type="url" placeholder="https://yourportfolio.com"/>
          </div>
          <div class="fg">
            <label class="fg-label">Other Profile / Link</label>
            <input class="fg-input" id="pf-otherLink" placeholder="Behance, Dribbble, Kaggle, etc."/>
          </div>
        </div>
      </div>

      <!-- Resume -->
      <div class="form-card">
        <div class="form-card-title">📄 Resume / CV</div>
        <div id="resume-area"></div>
        <input type="file" id="resume-file" accept=".pdf,.doc,.docx" style="display:none" onchange="handleResumeUpload(event)"/>
        <div class="fg-hint" style="margin-top:.8rem">Accepted formats: PDF, DOC, DOCX · Max 5MB · Employers will see this when reviewing your application</div>
      </div>

      <!-- Additional Info -->
      <div class="form-card">
        <div class="form-card-title">ℹ️ Additional Information</div>
        <div class="fg-grid-2">
          <div class="fg">
            <label class="fg-label">Availability to Start</label>
            <select class="fg-select" id="pf-availability">
              <option value="">Select</option>
              <option>Immediately</option>
              <option>Within 2 weeks</option>
              <option>Within 1 month</option>
              <option>Within 3 months</option>
            </select>
          </div>
          <div class="fg">
            <label class="fg-label">Employment Status</label>
            <select class="fg-select" id="pf-empStatus">
              <option value="">Select</option>
              <option>Fresher / Student</option>
              <option>Currently Employed</option>
              <option>Currently Unemployed</option>
              <option>Serving Notice Period</option>
            </select>
          </div>
        </div>
        <div class="fg">
          <label class="fg-label">Achievements & Awards</label>
          <textarea class="fg-textarea" id="pf-achievements" rows="2" placeholder="Any notable achievements, awards, recognitions, competitions..."></textarea>
        </div>
        <div class="fg">
          <label class="fg-label">About Me / Cover Note</label>
          <textarea class="fg-textarea" id="pf-coverNote" rows="3" placeholder="A short note to employers about why you'd be a great fit for Aivirtrix..."></textarea>
        </div>
      </div>

      <div style="display:flex;gap:.7rem;align-items:center;padding:.5rem 0">
        <button class="btn btn-primary btn-lg" onclick="saveProfile()">💾 Save Complete Profile</button>
        <button class="btn btn-ghost btn-lg" onclick="loadProfile()">↺ Reset Changes</button>
      </div>
    </div>

  </div><!-- /dash-content -->

  <!-- ============================================================
     Aivirtrix — SITE FOOTER
     To update a link: change the href="#" to the actual page path
     Pages still under development are marked with: href="#" (TODO)
     ============================================================ -->
<script>
function sfSubscribe(e){e.preventDefault();var btn=e.target.querySelector('.sf-newsletter-btn');btn.textContent='Subscribed!';btn.style.background='#16a34a';e.target.querySelector('.sf-newsletter-input').value='';setTimeout(function(){btn.textContent='Subscribe';btn.style.background='';},3000);}
var LEGAL_CONTENT={
  privacy:{icon:'&#128274;',title:'Privacy Policy',sections:[
    {title:'Data Collection & Use',body:'We respect your privacy. Data collected is used solely for recruitment and communication purposes.'},
    {title:'Data Sharing',body:'We do not share your information without consent, except when required for job placement.'},
    {title:'Your Rights',body:'You may request access, correction, or deletion of your data. Contact info@aivirtrix.com.'}
  ]},
  terms:{icon:'&#128203;',title:'Terms & Conditions',sections:[
    {title:'Acceptance',body:'By using our website, you agree to these terms and conditions.'},
    {title:'No Guarantee',body:'We do not guarantee job placement. Aivirtrix acts as an intermediary between employers and candidates.'},
    {title:'User Responsibilities',body:'Users are responsible for the accuracy of information they provide.'}
  ]}
};
function openLegalModal(type){
  var c=LEGAL_CONTENT[type];if(!c)return;
  document.getElementById('legal-modal-icon').innerHTML=c.icon;
  document.getElementById('legal-modal-title-text').textContent=c.title;
  document.getElementById('legal-modal-body').innerHTML=c.sections.map(function(s){
    return'<div class="legal-section"><div class="legal-section-title">'+s.title+'</div><div class="legal-section-body"><p>'+s.body+'</p></div></div>';
  }).join('');
  document.getElementById('legal-modal-backdrop').classList.add('open');
  document.body.style.overflow='hidden';
}
function closeLegalModal(e){
  if(e&&e.target!==document.getElementById('legal-modal-backdrop'))return;
  document.getElementById('legal-modal-backdrop').classList.remove('open');
  document.body.style.overflow='';
}
document.addEventListener('keydown',function(e){if(e.key==='Escape')closeLegalModal();});
(function(){
  var btn=document.getElementById('backToTop');
  if(btn){
    window.addEventListener('scroll',function(){btn.style.opacity=window.scrollY>400?'1':'0';btn.style.pointerEvents=window.scrollY>400?'auto':'none';},{passive:true});
    btn.addEventListener('click',function(){window.scrollTo({top:0,behavior:'smooth'});});
  }
})();
</script>
<div class="legal-modal-backdrop" id="legal-modal-backdrop" onclick="closeLegalModal(event)" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,.5);z-index:99999;align-items:center;justify-content:center;">
  <div class="legal-modal" id="legal-modal" style="background:#fff;border-radius:12px;max-width:560px;width:90%;max-height:80vh;overflow:hidden;display:flex;flex-direction:column;">
    <div class="legal-modal-head" style="display:flex;justify-content:space-between;align-items:center;padding:1.2rem 1.5rem;border-bottom:1px solid #e5e7eb;">
      <div class="legal-modal-title" style="display:flex;align-items:center;gap:.7rem;font-weight:700;font-size:1rem;color:#0a0a0a;">
        <div class="legal-modal-title-icon" id="legal-modal-icon" style="font-size:1.3rem;"></div>
        <span id="legal-modal-title-text"></span>
      </div>
      <button class="legal-modal-close" onclick="closeLegalModal()" style="background:none;border:none;cursor:pointer;font-size:1.2rem;color:#9ca3af;">&#10005;</button>
    </div>
    <div class="legal-modal-body" id="legal-modal-body" style="overflow-y:auto;padding:1.5rem;flex:1;"></div>
    <div class="legal-modal-foot" style="display:flex;justify-content:space-between;align-items:center;padding:1rem 1.5rem;border-top:1px solid #e5e7eb;background:#f9fafb;">
      <span style="font-size:.75rem;color:#9ca3af;">Last updated: January 2026 &middot; Aivirtrix</span>
      <button onclick="closeLegalModal()" style="background:#2563eb;color:#fff;border:none;padding:.5rem 1.2rem;border-radius:6px;cursor:pointer;font-size:.8rem;font-weight:600;">Got it</button>
    </div>
  </div>
</div>
<style>
.legal-modal-backdrop.open{display:flex!important;}
.legal-section{margin-bottom:1.2rem;}
.legal-section-title{font-weight:700;font-size:.9rem;color:#0a0a0a;margin-bottom:.4rem;}
.legal-section-body p{font-size:.83rem;color:#4b5563;line-height:1.75;}
</style>
</body>


  
<!-- SITE FOOTER -->
</body>


</html>