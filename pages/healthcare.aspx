<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="healthcare.aspx.cs" Inherits="Pages_healthcare" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Healthcare Staffing &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Healthcare & Life Sciences staffing — Aivirtrix</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server">

  <style>
.ind-hero-stats{display:flex;gap:3rem;margin-top:2.5rem;flex-wrap:wrap}
    .ind-stat{text-align:center}
    .ind-stat-num{font-size:2.2rem;font-weight:800;color:var(--blue-light);line-height:1}
    .ind-stat-lbl{font-size:.72rem;font-weight:600;letter-spacing:.12em;text-transform:uppercase;color:rgba(255,255,255,.55);margin-top:.35rem}
    .cat-header{display:flex;align-items:center;gap:1.5rem;margin-bottom:2.5rem}
    .cat-number{width:52px;height:52px;border-radius:50%;background:var(--blue-mid);color:#fff;font-size:1.3rem;font-weight:800;display:flex;align-items:center;justify-content:center;flex-shrink:0}
    .cat-title-wrap .section-tag{margin-bottom:.2rem}
    .cat-title-wrap h2{margin:0;font-size:clamp(1.5rem,2.8vw,2.2rem);font-weight:700;color:var(--black)}
    .subcat-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(230px,1fr));gap:1.6rem;margin-bottom:4rem}
    .subcat-card{background:#fff;border:1px solid var(--bdr-light);border-radius:8px;padding:1.6rem 1.8rem;transition:all .3s var(--ease)}
    .subcat-card:hover{border-color:var(--bdr-blue);transform:translateY(-4px);box-shadow:0 12px 32px var(--blue-shadow)}
    .subcat-name{font-size:.78rem;font-weight:700;letter-spacing:.1em;text-transform:uppercase;color:var(--blue-mid);margin-bottom:1rem;padding-bottom:.6rem;border-bottom:2px solid var(--blue-pale)}
    .subcat-roles{list-style:none;padding:0;margin:0}
    .subcat-roles li{font-size:.82rem;color:#444;padding:.28rem 0;display:flex;align-items:center;gap:.5rem;line-height:1.4}
    .subcat-roles li::before{content:'';width:5px;height:5px;border-radius:50%;background:var(--blue-mid);flex-shrink:0}
    .ind-cta{background:var(--black-soft);color:#fff;padding:5rem 5%;text-align:center}
    .ind-cta h2{font-size:clamp(1.6rem,3vw,2.4rem);font-weight:700;margin-bottom:1rem;color:#fff}
    .ind-cta p{max-width:560px;margin:0 auto 2rem;color:rgba(255,255,255,.65);font-size:.95rem}
    .ind-cta-btns{display:flex;gap:1rem;justify-content:center;flex-wrap:wrap}
    .why-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:1.4rem;margin-bottom:4rem}
    .why-card{background:var(--blue-pale,#f0f6ff);border-radius:8px;padding:1.8rem;text-align:center}
    .why-icon{font-size:2rem;margin-bottom:.8rem}
    .why-title{font-size:.9rem;font-weight:700;color:var(--black);margin-bottom:.4rem}
    .why-text{font-size:.8rem;color:#555;line-height:1.6}
    @media(max-width:640px){.ind-hero-stats{gap:1.5rem}.cat-header{flex-direction:column;align-items:flex-start;gap:.8rem}}

    /* ── FAQ ACCORDION ── */
    .faq-section { padding: 3rem 5%; background: #f8fafc; }
    .faq-list { display:flex; flex-direction:column; gap:.6rem; margin-bottom:3rem; max-width:900px; }
    .faq-item { border:1px solid #e2e8f0; border-radius:10px; overflow:hidden; background:#fff; box-shadow:0 1px 3px rgba(0,0,0,.04); }
    .faq-q {
      width:100%; text-align:left; background:none; border:none;
      padding:1.15rem 1.4rem; font-family:'Poppins',sans-serif;
      font-size:.88rem; font-weight:700; color:#0d1117; cursor:pointer;
      display:flex; justify-content:space-between; align-items:center;
      gap:1rem; transition:color .2s, background .2s; line-height:1.4;
    }
    .faq-q::after { content:'+'; font-size:1.5rem; color:#2563eb; flex-shrink:0; transition:transform .3s; font-weight:300; }
    .faq-q.open { color:#2563eb; background:#f0f6ff; }
    .faq-q.open::after { transform:rotate(45deg); }
    .faq-q:hover { color:#2563eb; background:#f8faff; }
    .faq-a {
      font-size:.84rem; color:#475569; line-height:1.8;
      padding:0 1.4rem; max-height:0; overflow:hidden;
      transition:max-height .4s ease, padding .3s ease;
    }
    .faq-a.open { max-height:500px; padding:.85rem 1.4rem 1.3rem; }
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<div class="page-hero">
    <div class="page-hero-content container">
      <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>›</span><a href="<%= ResolveUrl("~/pages/contact.aspx") %>">Industries</a><span>›</span><span>Healthcare</span></div>
      <span class="section-tag">Industry Vertical</span>
      <h1 class="page-hero-title">Healthcare <em>Staffing</em></h1>
      <p class="page-hero-sub" style="max-width:560px;color:rgba(255,255,255,.68);margin-top:.8rem">Connecting healthcare organisations with skilled clinical and administrative professionals who are ready to deliver quality patient care from day one.</p>
      <div class="ind-hero-stats">
        <div class="ind-stat"><div class="ind-stat-num">4</div><div class="ind-stat-lbl">Sub-Categories</div></div>
        <div class="ind-stat"><div class="ind-stat-num">20+</div><div class="ind-stat-lbl">Role Specialisations</div></div>
        <div class="ind-stat"><div class="ind-stat-num">Fast</div><div class="ind-stat-lbl">Turnaround</div></div>
      </div>
    </div>
  </div>

  <section style="background:#fff;padding:5rem 5%">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-number">★</div>
        <div class="cat-title-wrap"><span class="section-tag">Why Choose Us</span><h2>Healthcare <em>Expertise</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="why-grid">
        <div class="why-card"><div class="why-icon">🏥</div><div class="why-title">Credential Verified</div><div class="why-text">All healthcare staff verified for licences, certifications, and compliance.</div></div>
        <div class="why-card"><div class="why-icon">❤️</div><div class="why-title">Patient-Focused</div><div class="why-text">We select professionals known for quality care and compassion.</div></div>
        <div class="why-card"><div class="why-icon">🔬</div><div class="why-title">Clinical &amp; Life Sciences</div><div class="why-text">Coverage across hospitals, clinics, labs, and research organisations.</div></div>
        <div class="why-card"><div class="why-icon">📋</div><div class="why-title">Compliance Ready</div><div class="why-text">Thorough background checks aligned with healthcare regulations.</div></div>
      </div>
    </div>
  </section>

  <section style="background:var(--blue-xpale,#f0f6ff);padding:5rem 5%">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-number">1</div>
        <div class="cat-title-wrap"><span class="section-tag">Roles We Staff</span><h2>Healthcare <em>Roles</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="subcat-grid">
        <div class="subcat-card reveal">
          <div class="subcat-name">Clinical Nursing</div>
          <ul class="subcat-roles">
            <li>Registered Nurse (RN)</li><li>Licensed Practical Nurse (LPN)</li><li>Critical Care Nurse</li><li>Theatre Nurse</li><li>Community Health Nurse</li>
          </ul>
        </div>
        <div class="subcat-card reveal">
          <div class="subcat-name">Allied Health</div>
          <ul class="subcat-roles">
            <li>Medical Assistant</li><li>Lab Technician</li><li>Radiographer</li><li>Physiotherapist</li><li>Occupational Therapist</li>
          </ul>
        </div>
        <div class="subcat-card reveal">
          <div class="subcat-name">Healthcare Administration</div>
          <ul class="subcat-roles">
            <li>Healthcare Administrator</li><li>Medical Records Specialist</li><li>Medical Billing &amp; Coding</li><li>Patient Coordinator</li><li>Health Information Manager</li>
          </ul>
        </div>
        <div class="subcat-card reveal">
          <div class="subcat-name">Life Sciences</div>
          <ul class="subcat-roles">
            <li>Research Scientist</li><li>Clinical Research Associate</li><li>Biotechnologist</li><li>Quality Assurance Specialist</li><li>Regulatory Affairs Manager</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="faq-section">
      <h3 class="faq-title">Frequently Asked Questions</h3>
      <div class="faq-item"><button class="faq-q">1. What healthcare roles do you staff?</button><div class="faq-a">We place nurses, allied health professionals, medical assistants, healthcare administrators, and life sciences researchers.</div></div>
      <div class="faq-item"><button class="faq-q">2. Do you verify medical licences and certifications?</button><div class="faq-a">Yes, licence and credential verification is a mandatory step in our healthcare screening process.</div></div>
      <div class="faq-item"><button class="faq-q">3. Can you supply temporary healthcare staff for surge demand?</button><div class="faq-a">Yes, we offer rapid deployment of qualified temp healthcare professionals for short-term and emergency needs.</div></div>
      <div class="faq-item"><button class="faq-q">4. Do you cover life sciences and research roles?</button><div class="faq-a">Yes — including research scientists, clinical research associates, biotechnologists, and regulatory affairs managers.</div></div>
      <div class="faq-item"><button class="faq-q">5. Can you staff for hospitals, clinics, and diagnostics centres?</button><div class="faq-a">Absolutely. We serve hospitals, multi-specialty clinics, diagnostic labs, pharma companies, and research institutions.</div></div>
    </div>
  </section>

  <div class="ind-cta">
    <div class="container">
      <span class="section-tag" style="color:var(--blue-light)">Work With Us</span>
      <h2>Ready to Build Your <em style="color:var(--blue-light);font-style:italic">Healthcare Team?</em></h2>
      <p>Tell us your requirements and our healthcare staffing experts will connect you with the right talent — fast.</p>
      <div class="ind-cta-btns">
        <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-primary">Get in Touch</a>
        <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-outline-white">View Open Roles</a>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent"   runat="server">
<button id="backToTop" style="position:fixed;bottom:2rem;right:2rem;background:#2563eb;color:#fff;border:none;width:44px;height:44px;border-radius:50%;font-size:1.2rem;cursor:pointer;opacity:0;transition:opacity .3s;z-index:999;box-shadow:0 4px 16px rgba(37,99,235,.4)">&#8679;</button>
<script src="<%= ResolveUrl("~/js/main.js"></script>
<script src="<%= ResolveUrl("~/js/vpstore.js"></script>
<script src="<%= ResolveUrl("~/js/portal-widget.js"></script>
</asp:Content>