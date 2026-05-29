<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="employer-login.aspx.cs" Inherits="Pages_employer_login" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Employer Portal &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Employer login — Aivirtrix</asp:Content>
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
    .login-card-sub{font-size:.8rem;color:#6b7280;margin-bottom:1.8rem;line-height:1.6}
    .f-group{margin-bottom:1.1rem}
    .f-label{display:block;font-size:.65rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:#374151;margin-bottom:.42rem}
    .f-input{width:100%;border:1.5px solid #e5e7eb;border-radius:7px;padding:.75rem 1rem;font-family:'Poppins',sans-serif;font-size:.84rem;color:#0a0a0a;outline:none;transition:border-color .2s,box-shadow .2s;box-sizing:border-box;background:#fff}
    .f-input::placeholder{color:#9ca3af}
    .f-input:focus{border-color:#2563eb;box-shadow:0 0 0 3px rgba(37,99,235,.1)}
    .f-row{display:flex;justify-content:space-between;align-items:center;margin-bottom:1.3rem}
    .f-remember{display:flex;align-items:center;gap:.4rem;font-size:.75rem;color:#6b7280;cursor:pointer}
    .f-remember input{width:13px;height:13px;accent-color:#2563eb}
    .f-forgot{font-size:.75rem;color:#2563eb;background:none;border:none;cursor:pointer;font-family:inherit;padding:0}
    .btn-login{width:100%;background:#2563eb;color:#fff;border:none;border-radius:7px;padding:.85rem;font-family:'Poppins',sans-serif;font-size:.8rem;font-weight:700;letter-spacing:.08em;text-transform:uppercase;cursor:pointer;transition:all .2s;box-shadow:0 4px 16px rgba(37,99,235,.28)}
    .btn-login:hover{background:#1d4ed8;transform:translateY(-1px)}
    .err-box{background:#fef2f2;border:1px solid rgba(220,38,38,.25);color:#dc2626;font-size:.76rem;padding:.65rem .95rem;border-radius:6px;margin-bottom:.9rem;display:none;line-height:1.5}
    .login-note{text-align:center;font-size:.75rem;color:#9ca3af;margin-top:1rem}
    .login-note a{color:#2563eb;text-decoration:none}
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<div class="page-hero">
    <div class="page-hero-content">
      <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>›</span><span>Portal</span><span>›</span><span>Employer Login</span></div>
      <span class="section-tag">Employer Portal</span>
      <h1 class="page-hero-title">Employer <em>Sign In</em></h1>
    </div>
  </div>

  <section class="login-section">
    <div class="login-layout">
      <div class="reveal">
        <span class="section-tag">Employer Portal</span>
        <h2 class="login-info-title">Manage Your <em>Hiring Pipeline</em></h2>
        <div class="divider"></div>
        <p class="login-info-body">Sign in to your employer dashboard — post jobs, review candidates, shortlist talent and communicate with applicants all in one place.</p>
        <div class="feat-list">
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>Post & Manage Jobs</strong> — Full job listings with requirements, benefits and deadlines</div></div>
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>Candidate Database</strong> — View all applicants, filter by job, shortlist or reject</div></div>
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>Communication</strong> — Send direct status updates to candidates</div></div>
          <div class="feat-item"><div class="feat-dot"></div><div class="feat-text"><strong>Job History</strong> — Full archive of past, expired and deleted postings</div></div>
        </div>
        <div class="cta-switch">
          <p>Looking for a job opportunity?</p>
          <a href="<%= ResolveUrl("~/pages/candidate-login.aspx") %>">Go to Candidate Portal →</a>
        </div>
      </div>
      <div class="login-card reveal" style="transition-delay:.1s">
        <div class="login-card-title">Sign In to Dashboard</div>
        <div class="login-card-sub">Use your employer credentials to continue.</div>
        <div class="err-box" id="err-box"></div>
        <div class="f-group">
          <label class="f-label" for="emp-user">Username</label>
          <input class="f-input" type="text" id="emp-user" placeholder="Enter your username" autocomplete="username"/>
        </div>
        <div class="f-group">
          <label class="f-label" for="emp-pass">Password</label>
          <input class="f-input" type="password" id="emp-pass" placeholder="Enter your password" autocomplete="current-password"/>
        </div>
        <div class="f-row">
          <label class="f-remember"><input type="checkbox"/> Remember me</label>
          <button class="f-forgot" onclick="showForgot()">Forgot password?</button>
        </div>
        <button class="btn-login" onclick="doLogin()">Sign In to Dashboard</button>
        <div class="login-note">Need access? Contact <a href="mailto:info@aivirtrix.com">info@aivirtrix.com</a></div>
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