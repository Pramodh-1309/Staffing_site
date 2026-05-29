<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="candidate-login.aspx.cs" Inherits="Pages_candidate_login" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Candidate Portal &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Candidate login — Aivirtrix</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server">

  <style>
.page-hero{min-height:36vh;display:flex;align-items:flex-end;padding:9rem 3% 3.5rem;background:#111318;border-bottom:3px solid #2563eb;position:relative;overflow:hidden}
    .page-hero::before{content:'';position:absolute;inset:0;background-image:repeating-linear-gradient(0deg,transparent,transparent 79px,rgba(37,99,235,.05) 80px),repeating-linear-gradient(90deg,transparent,transparent 79px,rgba(37,99,235,.05) 80px);pointer-events:none}
    .page-hero::after{content:'';position:absolute;top:0;right:0;width:45%;height:100%;background:linear-gradient(135deg,transparent,rgba(37,99,235,.08));pointer-events:none}
    .page-hero-content{position:relative;z-index:2;width:100%}
    .breadcrumb{display:flex;align-items:center;gap:.5rem;font-size:.77rem;color:rgba(255,255,255,.38);margin-bottom:1rem}
    .breadcrumb a{color:#3b82f6;text-decoration:none}
    .page-hero-title{font-family:'Poppins',sans-serif;font-size:clamp(2rem,4vw,3.2rem);font-weight:800;line-height:1.1;color:#fff}
    .page-hero-title em{font-style:italic;color:#3b82f6}
    .login-section{background:#f8f9fb;padding:5rem 3%}
    .login-layout{display:grid;grid-template-columns:1fr 1fr;gap:5rem;align-items:start;max-width:1100px;margin:0 auto}
    .login-info-title{font-family:'Poppins',sans-serif;font-size:1.6rem;font-weight:800;color:#0a0a0a;margin-bottom:1rem;line-height:1.2}
    .login-info-title em{font-style:italic;color:#2563eb}
    .login-info-body{font-size:.88rem;color:#4b5563;line-height:1.85;margin-bottom:1.8rem}
    .feat-list{display:flex;flex-direction:column;gap:.85rem}
    .feat-item{display:flex;align-items:flex-start;gap:.85rem}
    .feat-dot{width:8px;height:8px;background:#2563eb;border-radius:50%;flex-shrink:0;margin-top:.38rem}
    .feat-text{font-size:.84rem;color:#374151;line-height:1.65}
    .feat-text strong{color:#0a0a0a;font-weight:600}
    .cta-switch{margin-top:2.2rem;padding:1.3rem 1.5rem;background:#fff;border:1px solid rgba(37,99,235,.18);border-radius:8px;text-align:center}
    .cta-switch p{font-size:.82rem;color:#6b7280;margin-bottom:.7rem}
    .cta-switch a{display:inline-block;padding:.55rem 1.4rem;background:#0a0a0a;color:#fff;text-decoration:none;border-radius:4px;font-size:.78rem;font-weight:700;letter-spacing:.06em;text-transform:uppercase;transition:background .2s}
    .cta-switch a:hover{background:#2563eb}
    .login-card{background:#fff;border:1px solid rgba(0,0,0,.08);border-radius:10px;padding:2.5rem;box-shadow:0 4px 24px rgba(0,0,0,.06)}
    .login-card-title{font-size:1.15rem;font-weight:800;color:#0a0a0a;margin-bottom:.3rem}
    .login-card-sub{font-size:.8rem;color:#6b7280;margin-bottom:1.5rem;line-height:1.6}
    .f-group{margin-bottom:1.1rem}
    .f-label{display:block;font-size:.65rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#374151;margin-bottom:.42rem}
    .f-input{width:100%;border:1.5px solid #e5e7eb;border-radius:7px;padding:.75rem 1rem;font-family:'Poppins',sans-serif;font-size:.84rem;color:#0a0a0a;outline:none;transition:border-color .2s,box-shadow .2s;box-sizing:border-box;background:#fff}
    .f-input::placeholder{color:#9ca3af}
    .f-input:focus{border-color:#2563eb;box-shadow:0 0 0 3px rgba(37,99,235,.1)}
    .f-input.ok{border-color:#16a34a}
    .f-input[readonly]{background:#f9fafb;cursor:default}
    .f-row{display:flex;justify-content:space-between;align-items:center;margin-bottom:1.3rem}
    .f-remember{display:flex;align-items:center;gap:.4rem;font-size:.75rem;color:#6b7280;cursor:pointer}
    .f-remember input{width:13px;height:13px;accent-color:#2563eb}
    .f-link{font-size:.75rem;color:#2563eb;background:none;border:none;cursor:pointer;font-family:inherit;padding:0;transition:color .2s}
    .f-link:hover{color:#1d4ed8}
    .btn-primary{width:100%;background:#2563eb;color:#fff;border:none;border-radius:7px;padding:.85rem;font-family:'Poppins',sans-serif;font-size:.8rem;font-weight:700;letter-spacing:.08em;text-transform:uppercase;cursor:pointer;transition:all .2s;box-shadow:0 4px 16px rgba(37,99,235,.28)}
    .btn-primary:hover{background:#1d4ed8;transform:translateY(-1px)}
    .btn-secondary{width:100%;background:#f3f4f6;color:#374151;border:1.5px solid #e5e7eb;border-radius:7px;padding:.82rem;font-family:'Poppins',sans-serif;font-size:.8rem;font-weight:600;cursor:pointer;transition:all .2s;margin-top:.6rem}
    .btn-secondary:hover{border-color:#2563eb;color:#2563eb}
    .err-box{background:#fef2f2;border:1px solid rgba(220,38,38,.25);color:#dc2626;font-size:.76rem;padding:.65rem .95rem;border-radius:6px;margin-bottom:.9rem;display:none;line-height:1.5}
    .un-status{font-size:.73rem;margin-top:.38rem;padding:.32rem .7rem;border-radius:5px;display:none;font-weight:500}
    .un-status.found{background:#f0fdf4;color:#16a34a;border:1px solid rgba(22,163,74,.2);display:block}
    .un-status.new-user{background:#eff6ff;color:#1d4ed8;border:1px solid rgba(37,99,235,.2);display:block}
    .check-row{display:flex;gap:.5rem}
    .check-row .f-input{flex:1}
    .check-btn{padding:.75rem 1rem;background:#0a0a0a;color:#fff;border:none;border-radius:7px;font-family:'Poppins',sans-serif;font-size:.75rem;font-weight:700;cursor:pointer;white-space:nowrap;flex-shrink:0;transition:background .2s}
    .check-btn:hover{background:#2563eb}
    .check-btn:disabled{background:#d1d5db;cursor:not-allowed}
    .step{display:none}
    .step.visible{display:block;animation:stepIn .2s ease}
    @keyframes stepIn{from{opacity:0;transform:translateY(6px)}to{opacity:1;transform:translateY(0)}}
    .strength-bar{display:flex;gap:3px;margin-top:.38rem;height:4px}
    .strength-seg{flex:1;border-radius:2px;background:#e5e7eb;transition:background .25s}
    .strength-seg.weak{background:#dc2626}
    .strength-seg.fair{background:#d97706}
    .strength-seg.good{background:#16a34a}
    .section-lbl{font-size:.63rem;font-weight:700;letter-spacing:.12em;text-transform:uppercase;color:#9ca3af;margin:1rem 0 .8rem;display:flex;align-items:center;gap:.6rem}
    .section-lbl::after{content:'';flex:1;height:1px;background:#e5e7eb}
    .login-note{text-align:center;font-size:.75rem;color:#9ca3af;margin-top:1rem}
    .login-note a{color:#2563eb;text-decoration:none}
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<div class="page-hero">
    <div class="page-hero-content">
      <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>›</span><span>Portal</span><span>›</span><span>Candidate Login</span></div>
      <span class="section-tag">Candidate Portal</span>
      <h1 class="page-hero-title">Candidate <em>Sign In</em></h1>
    </div>
  </div>

  <section class="login-section">
    <div class="login-layout">
      <!-- LEFT: Info -->
      <div class="reveal">
        <span class="section-tag">Candidate Portal</span>
        <h2 class="login-info-title">Find Your <em>Next Opportunity</em></h2>
        <div class="divider"></div>
        <p class="login-info-body">Browse open positions at Aivirtrix, apply with one click, and track every stage of your application in real time.</p>
        <div class="feat-list">
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>Browse Open Jobs</strong> — See all active listings with full details and requirements</div></div>
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>One-Click Apply</strong> — Apply to up to 4 positions simultaneously</div></div>
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>Track Status</strong> — See whether you've been shortlisted, pending or rejected</div></div>
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>Withdraw & Reapply</strong> — Manage your applications at any time</div></div>
        </div>
        <div class="cta-switch">
          <p>Are you an employer hiring?</p>
          <a href="<%= ResolveUrl("~/pages/employer-login.aspx") %>">Go to Employer Portal →</a>
        </div>
      </div>

      <!-- RIGHT: Form -->
      <div class="login-card reveal" style="transition-delay:.1s">
        <div class="login-card-title" id="card-title">Sign In or Register</div>
        <div class="login-card-sub" id="card-sub">Enter your username to get started.</div>

        <!-- STEP 1: Username Check -->
        <div class="step visible" id="step-un">
          <div class="err-box" id="err-un"></div>
          <div class="f-group">
            <label class="f-label">Username</label>
            <div class="check-row">
              <input class="f-input" type="text" id="cand-un" placeholder="Enter a username" oninput="resetUN()"/>
              <button class="check-btn" id="check-btn" onclick="checkUN()">Check</button>
            </div>
            <div class="un-status" id="un-status"></div>
          </div>
          <button class="btn-primary" id="btn-proceed" style="display:none" onclick="proceed()">Continue →</button>
        </div>

        <!-- STEP 2a: Login -->
        <div class="step" id="step-login">
          <div class="err-box" id="err-login"></div>
          <div class="f-group">
            <label class="f-label">Username</label>
            <input class="f-input ok" type="text" id="login-un" readonly/>
          </div>
          <div class="f-group">
            <label class="f-label">Password</label>
            <input class="f-input" type="password" id="login-pass" placeholder="Your password" autocomplete="current-password"/>
          </div>
          <div class="f-row">
            <label class="f-remember"><input type="checkbox"/> Remember me</label>
            <button class="f-link" onclick="back()">← Change username</button>
          </div>
          <button class="btn-primary" onclick="doLogin()">Sign In</button>
        </div>

        <!-- STEP 2b: Register -->
        <div class="step" id="step-reg">
          <div class="err-box" id="err-reg"></div>
          <div class="f-group">
            <label class="f-label">Username</label>
            <input class="f-input ok" type="text" id="reg-un" readonly/>
          </div>
          <div class="section-lbl">Set Password</div>
          <div class="f-group">
            <label class="f-label">Password *</label>
            <input class="f-input" type="password" id="reg-pass" placeholder="Create a strong password" oninput="strengthCheck()" autocomplete="new-password"/>
            <div class="strength-bar"><div class="strength-seg" id="s1"></div><div class="strength-seg" id="s2"></div><div class="strength-seg" id="s3"></div><div class="strength-seg" id="s4"></div></div>
          </div>
          <div class="f-group">
            <label class="f-label">Confirm Password *</label>
            <input class="f-input" type="password" id="reg-pass2" placeholder="Re-enter password" autocomplete="new-password"/>
          </div>
          <div class="section-lbl">Email Address</div>
          <div class="f-group">
            <label class="f-label">Email *</label>
            <input class="f-input" type="email" id="reg-email" placeholder="you@example.com" autocomplete="email"/>
          </div>
          <div class="f-group">
            <label class="f-label">Confirm Email *</label>
            <input class="f-input" type="email" id="reg-email2" placeholder="Re-enter your email"/>
          </div>
          <button class="btn-primary" onclick="doRegister()">Create Account & Sign In</button>
          <div class="login-note"><button class="f-link" onclick="back()">← Use a different username</button></div>
        </div>
      </div>
    </div>
  </section>

  <!-- ============================================================
     Aivirtrix — SITE FOOTER
     To update a link: change the href="#" to the actual page path
     Pages still under development are marked with: href="#" (TODO)
     ============================================================ -->
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent"   runat="server">
<button id="backToTop" style="position:fixed;bottom:2rem;right:2rem;background:#2563eb;color:#fff;border:none;width:44px;height:44px;border-radius:50%;font-size:1.2rem;cursor:pointer;opacity:0;transition:opacity .3s;z-index:999;box-shadow:0 4px 16px rgba(37,99,235,.4)">&#8679;</button>
<script src="<%= ResolveUrl("~/js/main.js"></script>
<script src="<%= ResolveUrl("~/js/vpstore.js"></script>
<script src="<%= ResolveUrl("~/js/portal-widget.js"></script>
</asp:Content>