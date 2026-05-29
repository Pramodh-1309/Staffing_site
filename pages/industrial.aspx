<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="industrial.aspx.cs" Inherits="Pages_industrial" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Industrial Staffing &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Light Industrial & Skilled Trades staffing — Aivirtrix</asp:Content>
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
    .why-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:1.4rem;margin-top:2.5rem}
    .why-card{background:var(--blue-pale,#f0f6ff);border-radius:8px;padding:1.8rem;text-align:center}
    .why-icon{font-size:2rem;margin-bottom:.8rem}
    .why-title{font-size:.9rem;font-weight:700;color:var(--black);margin-bottom:.4rem}
    .why-text{font-size:.8rem;color:#555;line-height:1.6}

    /* ── WHY CHOOSE US: image + about split ── */
    .why-intro{
      display:grid;
      grid-template-columns:1fr 1fr;
      gap:4rem;
      align-items:center;
      margin-bottom:3rem;
    }
    .why-intro-img{
      position:relative;
      border-radius:12px;
      overflow:hidden;
      height:400px;
      box-shadow:0 20px 56px rgba(0,0,0,.13);
    }
    .why-intro-img img{
      width:100%;height:100%;object-fit:cover;display:block;
      border-radius:12px;
    }
    .why-intro-img-badge{
      position:absolute;bottom:1.4rem;left:1.4rem;
      background:#fff;border-radius:8px;
      padding:.7rem 1.1rem;
      display:flex;align-items:center;gap:.6rem;
      box-shadow:0 6px 20px rgba(0,0,0,.12);
    }
    .why-intro-img-badge .badge-num{
      font-size:1.4rem;font-weight:800;color:var(--blue-mid,#2563eb);line-height:1;
    }
    .why-intro-img-badge .badge-lbl{
      font-size:.68rem;font-weight:600;letter-spacing:.08em;
      text-transform:uppercase;color:#64748b;line-height:1.3;
    }
    .why-intro-text .section-tag{margin-bottom:.6rem}
    .why-intro-text h2{
      font-size:clamp(1.6rem,2.6vw,2.2rem);font-weight:700;
      color:var(--black,#111);margin-bottom:1rem;line-height:1.25;
    }
    .why-intro-text h2 em{
      font-style:italic;color:var(--blue-mid,#2563eb);
    }
    .why-intro-text p{
      font-size:.9rem;color:#555;line-height:1.8;margin-bottom:.85rem;
    }
    .why-intro-text p:last-of-type{margin-bottom:1.6rem}
    .why-bullets{list-style:none;padding:0;margin:0 0 1.8rem;display:flex;flex-direction:column;gap:.55rem}
    .why-bullets li{
      font-size:.85rem;color:#444;display:flex;align-items:flex-start;gap:.6rem;line-height:1.5;
    }
    .why-bullets li::before{
      content:'✓';width:18px;height:18px;border-radius:50%;
      background:var(--blue-mid,#2563eb);color:#fff;
      font-size:.6rem;font-weight:800;display:flex;align-items:center;
      justify-content:center;flex-shrink:0;margin-top:1px;
    }
    .why-divider{height:1px;background:linear-gradient(90deg,var(--blue-mid,#2563eb),transparent);margin:1.8rem 0;opacity:.25}

    @media(max-width:900px){
      .why-intro{grid-template-columns:1fr;gap:2.4rem}
      .why-intro-img{height:280px}
    }
    @media(max-width:640px){
      .ind-hero-stats{gap:1.5rem}
      .cat-header{flex-direction:column;align-items:flex-start;gap:.8rem}
    }

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
      <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>›</span><a href="<%= ResolveUrl("~/pages/contact.aspx") %>">Industries</a><span>›</span><span>Industrial</span></div>
      <span class="section-tag">Industry Vertical</span>
      <h1 class="page-hero-title">Industrial <em>Staffing</em></h1>
      <p class="page-hero-sub" style="max-width:560px;color:rgba(255,255,255,.68);margin-top:.8rem">Placing qualified industrial professionals across manufacturing, maintenance, and production environments — built for precision, reliability, and scale.</p>
      <div class="ind-hero-stats">
        <div class="ind-stat"><div class="ind-stat-num">4</div><div class="ind-stat-lbl">Sub-Categories</div></div>
        <div class="ind-stat"><div class="ind-stat-num">20+</div><div class="ind-stat-lbl">Role Specialisations</div></div>
        <div class="ind-stat"><div class="ind-stat-num">Fast</div><div class="ind-stat-lbl">Turnaround</div></div>
      </div>
    </div>
  </div>

  <!-- ══ WHY CHOOSE US ══ -->
  <section style="background:#fff;padding:5rem 5%">
    <div class="container">

      <div class="cat-header reveal">
        <div class="cat-number">★</div>
        <div class="cat-title-wrap">
          <span class="section-tag">Why Choose Us</span>
          <h2>Industrial <em>Expertise</em></h2>
        </div>
      </div>
      <div class="divider"></div>

      <!-- IMAGE LEFT + ABOUT TEXT RIGHT -->
      <div class="why-intro reveal">

        <!-- LEFT: Image -->
        <div class="why-intro-img">
          <!--
            🖼️ REPLACE THIS src WITH YOUR ACTUAL IMAGE PATH
            e.g. src="<%= ResolveUrl("~/images/industrial-why.jpg"
          -->
          <img
           src="<%= ResolveUrl("~/images/industries.jpg (6).jpg"
           alt="Industrial staffing professionals at work"
          />
          <!-- Floating badge -->
          <div class="why-intro-img-badge">
            <div class="badge-num"></div>
            <div class="badge-lbl"><br/></div>
          </div>
        </div>

        <!-- RIGHT: About matter -->
        <div class="why-intro-text">
          <span class="section-tag">About Our Industrial Division</span>
          <h2>Precision Staffing for <em>Industrial Excellence</em></h2>
          <p>
            At Aivirtrix, our Industrial division is built for the demands of
            modern manufacturing and plant environments. We connect businesses
            with skilled, site-ready professionals who understand the pace,
            safety standards, and technical rigour of industrial operations.
          </p>
          <p>
            From heavy manufacturing floors to specialised maintenance teams,
            we source, screen, and deploy talent that fits — not just on paper,
            but on the ground.
          </p>

          <div class="why-divider"></div>

          <ul class="why-bullets">
            <li>Candidates pre-screened for technical and hands-on competency</li>
            <li>Safety certification verification on every placement</li>
            <li>Capability to handle bulk and large-scale hiring drives</li>
            <li>Both contract and permanent staffing options available</li>
            <li>Fast deployment — screened candidates within days</li>
            <li>Deep expertise across manufacturing, maintenance, and plant ops</li>
          </ul>
        </div>

      </div>
      <!-- END split -->

      

    <div class="faq-section">
      <h3 class="faq-title">Frequently Asked Questions</h3>
      <div class="faq-item">
        <button class="faq-q">1. What industrial roles do you cover?</button>
        <div class="faq-a">We staff CNC operators, maintenance technicians, welders, quality inspectors, HSE officers, and plant operators across all industrial sectors.</div>
      </div>
      <div class="faq-item">
        <button class="faq-q">2. Do you verify safety certifications?</button>
        <div class="faq-a">Yes, every candidate undergoes certification verification to ensure they meet required safety and industry standards.</div>
      </div>
      <div class="faq-item">
        <button class="faq-q">3. Can you handle large-scale factory staffing?</button>
        <div class="faq-a">Absolutely. We manage bulk hiring projects for industrial facilities with structured screening and deployment processes.</div>
      </div>
      <div class="faq-item">
        <button class="faq-q">4. Do you provide contract and permanent industrial staff?</button>
        <div class="faq-a">Yes, we offer both contract/temp and permanent placement for all industrial roles.</div>
      </div>
      <div class="faq-item">
        <button class="faq-q">5. How quickly can you deploy industrial talent?</button>
        <div class="faq-a">Depending on the role and volume, we can deploy screened candidates within days for most industrial positions.</div>
      </div>
    </div>
  </section>

  <!-- CTA -->
  <div class="ind-cta">
    <div class="container">
      <span class="section-tag" style="color:var(--blue-light)">Work With Us</span>
      <h2>Ready to Build Your <em style="color:var(--blue-light);font-style:italic">Industrial Team?</em></h2>
      <p>Tell us your requirements and our industrial staffing experts will connect you with the right talent — fast.</p>
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