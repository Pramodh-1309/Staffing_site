<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="leadership.aspx.cs" Inherits="Pages_leadership" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Leadership Staffing &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Executive & Leadership placement — Aivirtrix</asp:Content>
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
      <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>›</span><a href="<%= ResolveUrl("~/pages/contact.aspx") %>">Industries</a><span>›</span><span>Leadership</span></div>
      <span class="section-tag">Industry Vertical</span>
      <h1 class="page-hero-title">Leadership <em>Staffing</em></h1>
      <p class="page-hero-sub" style="max-width:560px;color:rgba(255,255,255,.68);margin-top:.8rem">Identifying transformational leaders — from C-suite executives to director-level talent — who align with your organisation's vision and drive sustainable growth.</p>
      <div class="ind-hero-stats">
        <div class="ind-stat"><div class="ind-stat-num">3</div><div class="ind-stat-lbl">Sub-Categories</div></div>
        <div class="ind-stat"><div class="ind-stat-num">15+</div><div class="ind-stat-lbl">Role Specialisations</div></div>
        <div class="ind-stat"><div class="ind-stat-num">Fast</div><div class="ind-stat-lbl">Turnaround</div></div>
      </div>
    </div>
  </div>

  <section style="background:#fff;padding:5rem 5%">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-number">★</div>
        <div class="cat-title-wrap"><span class="section-tag">Why Choose Us</span><h2>Leadership <em>Expertise</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="why-grid">
        <div class="why-card"><div class="why-icon">👑</div><div class="why-title">Executive Search</div><div class="why-text">Discreet, high-touch search for senior and C-suite roles.</div></div>
        <div class="why-card"><div class="why-icon">🎯</div><div class="why-title">Culture Fit</div><div class="why-text">We assess leadership style, values, and organisational alignment.</div></div>
        <div class="why-card"><div class="why-icon">🌐</div><div class="why-title">Wide Network</div><div class="why-text">Access to passive and active senior talent across industries.</div></div>
        <div class="why-card"><div class="why-icon">📈</div><div class="why-title">Proven Track Record</div><div class="why-text">Leaders who have delivered measurable results in past roles.</div></div>
      </div>
    </div>
  </section>

  <section style="background:var(--blue-xpale,#f0f6ff);padding:5rem 5%">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-number">1</div>
        <div class="cat-title-wrap"><span class="section-tag">Roles We Staff</span><h2>Leadership <em>Roles</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="subcat-grid">
        <div class="subcat-card reveal">
          <div class="subcat-name">C-Suite Executives</div>
          <ul class="subcat-roles">
            <li>Chief Executive Officer (CEO)</li><li>Chief Operating Officer (COO)</li><li>Chief Financial Officer (CFO)</li><li>Chief Technology Officer (CTO)</li><li>Chief People Officer (CPO)</li>
          </ul>
        </div>
        <div class="subcat-card reveal">
          <div class="subcat-name">VP &amp; Director Level</div>
          <ul class="subcat-roles">
            <li>VP of Operations</li><li>VP of Sales &amp; Marketing</li><li>VP of Technology</li><li>Director of Finance</li><li>Director of HR</li>
          </ul>
        </div>
        <div class="subcat-card reveal">
          <div class="subcat-name">Senior Management</div>
          <ul class="subcat-roles">
            <li>General Manager</li><li>Regional Manager</li><li>Head of Business Development</li><li>Head of Customer Experience</li><li>Head of Product</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="faq-section">
      <h3 class="faq-title">Frequently Asked Questions</h3>
      <div class="faq-item"><button class="faq-q">1. What leadership roles do you recruit for?</button><div class="faq-a">We recruit for CEO, COO, CFO, CTO, VP-level, and Director-level positions across all functions and industries.</div></div>
      <div class="faq-item"><button class="faq-q">2. Is your executive search process confidential?</button><div class="faq-a">Yes, discretion and confidentiality are fundamental to our executive search methodology.</div></div>
      <div class="faq-item"><button class="faq-q">3. How do you evaluate leadership candidates?</button><div class="faq-a">Through competency-based interviews, leadership assessments, reference checks, and culture-fit evaluations.</div></div>
      <div class="faq-item"><button class="faq-q">4. Can you fill leadership roles across different industries?</button><div class="faq-a">Yes, our leadership talent spans manufacturing, technology, healthcare, financial services, and professional services sectors.</div></div>
      <div class="faq-item"><button class="faq-q">5. How long does executive search typically take?</button><div class="faq-a">Depending on the role, most senior placements are completed within 4–10 weeks from brief to offer.</div></div>
    </div>
  </section>

  <div class="ind-cta">
    <div class="container">
      <span class="section-tag" style="color:var(--blue-light)">Work With Us</span>
      <h2>Looking for the <em style="color:var(--blue-light);font-style:italic">Right Leader?</em></h2>
      <p>Whether you need a single executive or a full leadership team, our staffing experts will find the perfect match for your organisation.</p>
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