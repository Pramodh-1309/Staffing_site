<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Aivirtrix &ndash; Global Staffing Platform</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Aivirtrix &ndash; AI-powered global staffing platform. Hire the best talent, any industry, anywhere.</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server">
  <style>
/* ════════ HERO ════════ */
    #home{min-height:100vh;display:grid;place-items:center;position:relative;overflow:hidden;background:#0a0a0a;padding-top:110px}
    .hbg{position:absolute;inset:0;pointer-events:none;background-image:repeating-linear-gradient(0deg,transparent,transparent 79px,rgba(37,99,235,.05) 80px),repeating-linear-gradient(90deg,transparent,transparent 79px,rgba(37,99,235,.05) 80px)}
    .hg{position:absolute;border-radius:50%;pointer-events:none;filter:blur(100px);animation:hp 9s ease-in-out infinite}
    .hg1{width:600px;height:600px;top:-150px;right:-100px;background:rgba(37,99,235,.16)}
    .hg2{width:400px;height:400px;bottom:-100px;left:-80px;background:rgba(37,99,235,.09);animation-delay:-5s}
    @keyframes hp{0%,100%{transform:scale(1)}50%{transform:scale(1.12) rotate(4deg)}}
    .hc{position:relative;z-index:2;text-align:center;max-width:980px;padding:4rem 2rem 6rem}
    .htag{display:inline-flex;align-items:center;gap:.55rem;background:rgba(37,99,235,.13);border:1px solid rgba(37,99,235,.3);color:#93c5fd;padding:.42rem 1.5rem;border-radius:50px;font-size:.7rem;font-weight:700;letter-spacing:.2em;text-transform:uppercase;margin-bottom:2.6rem;animation:fu .8s ease both}
    .htag::before{content:"";width:6px;height:6px;background:#3b82f6;border-radius:50%;display:inline-block}
    .ht{font-size:clamp(2.7rem,5.8vw,5rem);font-weight:lighter;line-height:1.07;color:#fff;margin-bottom:1.9rem;animation:fu .8s ease .15s both;letter-spacing:-.01em}
    .ht em{font-style:italic;color:#3b82f6}
    .hs{font-size:1.05rem;font-weight:300;line-height:1.9;color:rgba(255,255,255,.52);max-width:700px;margin:0 auto 3.2rem;animation:fu .8s ease .3s both}
    .hb{display:flex;gap:1rem;flex-wrap:wrap;justify-content:center;animation:fu .8s ease .45s both}
    .hr{width:100%;height:1px;background:linear-gradient(90deg,transparent,rgba(37,99,235,.3),transparent);margin:4.5rem 0 3.5rem;animation:fu .8s ease .55s both}
    .hst{display:flex;gap:4rem;justify-content:center;flex-wrap:wrap;animation:fu .8s ease .65s both}
    .si{text-align:center}
    .sn{font-size:2.8rem;font-weight:lighter;color:#fff;line-height:1}
    .sn span{color:#3b82f6}
    .sl{font-size:.68rem;letter-spacing:.16em;text-transform:uppercase;color:rgba(255,255,255,.35);margin-top:.5rem}
    @keyframes fu{from{opacity:0;transform:translateY(30px)}to{opacity:1;transform:translateY(0)}}
    /* TICKER */
    .bb{background:#1d4ed8;padding:1.2rem 5%;display:flex;align-items:center;justify-content:space-between;flex-wrap:wrap;gap:1rem}
    .bb p{color:rgba(255,255,255,.92);font-size:.85rem;font-weight:500;letter-spacing:.02em}
    /* SECTION 2 REACH */
    #reach-s{background:#fff}
    .reach-grid{display:grid;grid-template-columns:1fr 1fr;gap:5rem;align-items:center;max-width:1200px;margin:0 auto}
    .reach-pillars{display:grid;grid-template-columns:1fr 1fr;gap:1.2rem}
    .pillar-card{background:#f8f9fb;border:1px solid rgba(0,0,0,.08);border-radius:8px;padding:1.8rem 1.4rem;text-align:center;transition:border-color .3s,box-shadow .3s}
    .pillar-card:hover{border-color:rgba(37,99,235,.25);box-shadow:0 8px 24px rgba(37,99,235,.08)}
    .pillar-icon{font-size:2rem;margin-bottom:.7rem}
    .pillar-label{font-size:.72rem;color:#6b7280;font-weight:700;text-transform:uppercase;letter-spacing:.08em}
    .about-para{font-size:.95rem;color:#4b5563;line-height:1.85;margin-bottom:1.1rem}
    .cap-cards{display:flex;flex-direction:column;gap:1rem;margin-top:2rem}
    .cap-card{background:#f8f9fb;border:1px solid rgba(0,0,0,.07);border-radius:8px;padding:1.4rem 1.6rem;transition:all .3s}
    .cap-card:hover{border-color:rgba(37,99,235,.25);box-shadow:0 4px 16px rgba(37,99,235,.08);transform:translateX(4px)}
    .cap-card-title{font-weight:700;font-size:.9rem;color:#0a0a0a;margin-bottom:.3rem}
    .cap-card-desc{font-size:.82rem;color:#6b7280;line-height:1.65}
    /* SECTION 3 INDUSTRIES */
    #industries-s{background:#f8f9fb}
    .ind-intro{max-width:1200px;margin:0 auto 3rem}
    .ind-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:0;border:1px solid rgba(0,0,0,.07);max-width:1200px;margin:0 auto}
    .ind-card{background:#fff;border:1px solid rgba(0,0,0,.06);padding:2.5rem;position:relative;overflow:hidden;transition:border-color .35s,transform .35s,box-shadow .35s;cursor:pointer}
    .ind-card:hover{border-color:rgba(37,99,235,.28);transform:translateY(-4px);box-shadow:0 16px 40px rgba(37,99,235,.1);z-index:2}
    .ind-card-icon{font-size:2.4rem;margin-bottom:1.2rem;display:block}
    .ind-card-name{font-size:1.1rem;font-weight:700;margin-bottom:.55rem;color:#0a0a0a}
    .ind-card-desc{font-size:.82rem;color:#6b7280;line-height:1.82}
    .ind-card-arrow{position:absolute;bottom:1.8rem;right:1.8rem;color:#2563eb;font-size:1.1rem;opacity:0;transform:translateX(-8px);transition:all .3s}
    .ind-card:hover .ind-card-arrow{opacity:1;transform:translateX(0)}
    /* SECTION 4 MARKETS */
    #markets-s{background:#111318}
    .markets-inner{max-width:1200px;margin:0 auto}
    .markets-grid{display:grid;grid-template-columns:1fr 1fr;gap:2rem;margin-top:3rem}
    .market-card{background:rgba(255,255,255,.04);border:1px solid rgba(255,255,255,.07);border-radius:10px;padding:2.5rem;transition:all .3s}
    .market-card:hover{background:rgba(37,99,235,.1);border-color:rgba(37,99,235,.3)}
    .market-flag{font-size:2.5rem;margin-bottom:1rem}
    .market-name{font-size:1.3rem;font-weight:lighter;color:#fff;margin-bottom:.3rem}
    .market-sub{font-size:.78rem;color:#93c5fd;font-weight:600;letter-spacing:.1em;text-transform:uppercase;margin-bottom:1.5rem}
    .market-list{display:flex;flex-direction:column;gap:.75rem}
    .market-item{display:flex;gap:.9rem;align-items:flex-start}
    .m-dot{width:8px;height:8px;background:#3b82f6;border-radius:50%;margin-top:.42rem;flex-shrink:0}
    .m-text{font-size:.83rem;color:rgba(255,255,255,.62);line-height:1.6}
    .market-stat{margin-top:1.5rem;background:rgba(37,99,235,.12);border:1px solid rgba(37,99,235,.2);border-radius:6px;padding:.9rem 1.2rem;font-size:.82rem;color:#93c5fd;font-style:italic}
    .market-badges{display:flex;flex-wrap:wrap;gap:.5rem;margin-top:1rem}
    .market-badge{background:rgba(37,99,235,.15);border:1px solid rgba(37,99,235,.28);border-radius:50px;padding:.3rem .9rem;font-size:.72rem;font-weight:600;color:#93c5fd}
    .expanding-bar{margin-top:3rem;padding:1.5rem 2rem;background:rgba(255,255,255,.03);border:1px solid rgba(255,255,255,.07);border-radius:8px;display:flex;align-items:center;gap:1rem;flex-wrap:wrap}
    .expand-star{color:#3b82f6;font-size:1.1rem}
    .expand-text{font-size:.85rem;color:rgba(255,255,255,.55)}
    .expand-tags{display:flex;gap:.6rem;flex-wrap:wrap}
    .expand-tag{background:rgba(37,99,235,.1);border:1px solid rgba(37,99,235,.2);border-radius:50px;padding:.25rem .8rem;font-size:.72rem;color:#93c5fd;font-weight:600}
    /* SECTION 5 HOW */
    #how-s{background:#fff}
    .how-grid{display:grid;grid-template-columns:1fr 1fr;gap:5rem;align-items:center;max-width:1200px;margin:0 auto}
    .steps-list{display:flex;flex-direction:column;gap:0;border:1px solid rgba(0,0,0,.07);border-radius:8px;overflow:hidden}
    .step-row{display:flex;align-items:center;gap:1.4rem;padding:1.5rem 1.8rem;border-bottom:1px solid rgba(0,0,0,.06);transition:background .25s}
    .step-row:last-child{border-bottom:none}
    .step-row:hover{background:#eff6ff}
    .step-num{font-size:1.6rem;font-weight:lighter;color:rgba(37,99,235,.2);line-height:1;min-width:2.2rem}
    .step-content .step-title{font-weight:700;font-size:.9rem;color:#0a0a0a;margin-bottom:.2rem}
    .step-content .step-desc{font-size:.79rem;color:#6b7280;line-height:1.65}
    .how-para{font-size:.95rem;color:#4b5563;line-height:1.85;margin-bottom:1.1rem}
    /* SECTION 6 WHY */
    #why-s{background:#0a0a0a;position:relative;overflow:hidden}
    #why-s::before{content:"";position:absolute;inset:0;background:radial-gradient(ellipse 70% 55% at 50% 50%,rgba(37,99,235,.15),transparent);pointer-events:none}
    .why-inner{position:relative;z-index:2;max-width:1200px;margin:0 auto}
    .why-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(210px,1fr));gap:1.4rem;max-width:1200px;margin:3rem auto 0}
    .why-card{background:rgba(255,255,255,.04);border:1px solid rgba(255,255,255,.07);border-radius:8px;padding:2rem;text-align:center;transition:all .3s}
    .why-card:hover{background:rgba(37,99,235,.12);border-color:rgba(37,99,235,.35);transform:translateY(-4px)}
    .why-icon{font-size:2.2rem;margin-bottom:1rem}
    .why-title{font-size:1.02rem;font-weight:700;margin-bottom:.5rem;color:#fff}
    .why-body{font-size:.8rem;color:rgba(255,255,255,.45);line-height:1.78}
    .testimonial{max-width:720px;margin:3.5rem auto 0;background:rgba(255,255,255,.04);border:1px solid rgba(37,99,235,.2);border-radius:10px;padding:2.5rem;text-align:center}
    .testimonial-text{font-size:.95rem;color:rgba(255,255,255,.7);line-height:1.8;font-style:italic;margin-bottom:1.2rem}
    .testimonial-author{font-size:.78rem;color:#93c5fd;font-weight:600;letter-spacing:.08em;text-transform:uppercase}
    /* SECTION 7 INSIGHTS */
    #insights-s{background:#f8f9fb}
    .insights-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:2rem;max-width:1200px;margin:3rem auto 0}
    .insight-card{background:#fff;border:1px solid rgba(0,0,0,.07);border-radius:8px;padding:2rem;transition:all .3s}
    .insight-card:hover{border-color:rgba(37,99,235,.25);box-shadow:0 8px 24px rgba(37,99,235,.08);transform:translateY(-4px)}
    .insight-tag{background:#eff6ff;color:#2563eb;font-size:.68rem;font-weight:700;text-transform:uppercase;letter-spacing:.12em;padding:.3rem .8rem;border-radius:50px;display:inline-block;margin-bottom:1rem}
    .insight-title{font-size:.95rem;font-weight:700;color:#0a0a0a;line-height:1.5;margin-bottom:.8rem}
    .insight-link{font-size:.8rem;color:#2563eb;font-weight:600}
    .insight-link:hover{text-decoration:underline}
    /* SECTION 8 CTA */
    #cta-s{background:#0a0a0a;text-align:center;position:relative;overflow:hidden}
    #cta-s::before{content:"";position:absolute;inset:0;background:radial-gradient(ellipse 60% 50% at 50% 50%,rgba(37,99,235,.18),transparent);pointer-events:none}
    .cta-inner{position:relative;z-index:2;max-width:820px;margin:0 auto}
    .cta-divider{width:60px;height:2px;background:linear-gradient(90deg,#3b82f6,transparent);margin:1.5rem auto 2rem}
    .cta-pillars{display:flex;gap:3rem;justify-content:center;flex-wrap:wrap;margin-top:3.5rem}
    .cta-pillar{text-align:center}
    .cta-pillar-word{font-size:1.5rem;font-weight:lighter;color:#fff;display:block;margin-bottom:.3rem}
    .cta-pillar-sub{font-size:.68rem;letter-spacing:.18em;text-transform:uppercase;color:rgba(255,255,255,.3)}
    /* REVEAL */
    .reveal{opacity:0;transform:translateY(28px);transition:opacity .65s ease,transform .65s ease}
    .reveal.in,.reveal.visible{opacity:1;transform:translateY(0)}
    /* TAG */
    .tag{background:#eff6ff;border:1px solid rgba(37,99,235,.2);color:#2563eb;padding:.22rem .75rem;border-radius:50px;font-size:.72rem;font-weight:600}
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<!-- ══ HERO ══ -->
<section id="home">
  <div class="hbg"></div>
  <div class="hg hg1"></div>
  <div class="hg hg2"></div>
  <div class="hc">
    <span class="htag">AI-Powered Global Staffing Platform</span>
    <h1 class="ht">Hire the Best Talent.<br><em>Any Industry. Anywhere.</em></h1>
    <p class="hs">One platform to source, vet, onboard, and pay skilled professionals across the globe. From enterprise RPO to on-demand contingent hiring — we operate where you operate.</p>
    <div class="hb">
      <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-primary">Find Talent</a>
      <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-outline-white">Become a Partner</a>
      <a href="#markets-s" class="btn btn-outline-white" onclick="smoothTo(event,'markets-s')">See Our Global Footprint →</a>
    </div>
    <div class="hr"></div>
    <div class="hst">
      <div class="si"><div class="sn">4,000<span>+</span></div><div class="sl">Companies Trusted</div></div>
      <div class="si"><div class="sn">40<span>+</span></div><div class="sl">Currencies Supported</div></div>
      <div class="si"><div class="sn">12<span>d</span></div><div class="sl">Avg Tech Time-to-Fill</div></div>
      <div class="si"><div class="sn">98<span>%</span></div><div class="sl">LMIA Approval Rate</div></div>
    </div>
  </div>
</section>

<!-- TICKER -->
<div class="bb">
  <p><strong>Technology · Healthcare · Industrial · Engineering · Finance · Retail</strong> — Trusted by 4,000+ companies from Fortune 500 to fast-growing startups</p>
  <a href="<%= ResolveUrl("~/pages/services.aspx") %>" class="btn btn-outline-white" style="padding:.48rem 1.3rem;font-size:.76rem">View All Services</a>
</div>

<!-- ══ SECTION 2 — GLOBAL REACH ══ -->
<section id="reach-s">
  <div class="reach-grid">
    <div class="reveal">
      <div style="background:#f8f9fb;border:1px solid rgba(0,0,0,.07);border-radius:10px;padding:2.8rem;position:relative;overflow:hidden">
        <div style="position:absolute;top:-30px;right:-30px;width:120px;height:120px;border-radius:50%;background:rgba(37,99,235,.06)"></div>
        <div class="reach-pillars">
          <div class="pillar-card"><div class="pillar-icon">🌐</div><div class="pillar-label">Global Scale</div></div>
          <div class="pillar-card"><div class="pillar-icon">🏛️</div><div class="pillar-label">Local Compliance</div></div>
          <div class="pillar-card"><div class="pillar-icon">💳</div><div class="pillar-label">Multi-Currency Pay</div></div>
          <div class="pillar-card"><div class="pillar-icon">🤖</div><div class="pillar-label">AI Matching</div></div>
        </div>
      </div>
    </div>
    <div class="reveal" style="transition-delay:.15s">
      <span class="section-tag">One Platform. Dozens of Markets.</span>
      <h2 class="section-title">Global Scale with <em>Local Depth</em></h2>
      <div class="divider"></div>
      <p class="about-para">We combine global reach with in-country compliance, payroll, and cultural intelligence — whether you need engineers in Austin, nurses in Toronto, or warehouse staff in London.</p>
      <div class="cap-cards">
        <div class="cap-card"><div class="cap-card-title">💰 Multi-Country Payroll</div><div class="cap-card-desc">Pay contractors and permanent hires in 40+ currencies. One invoice. One dashboard.</div></div>
        <div class="cap-card"><div class="cap-card-title">⚖️ Local Compliance Engine</div><div class="cap-card-desc">Automated work authorization checks, tax filings, and labor law updates for every country we operate in.</div></div>
        <div class="cap-card"><div class="cap-card-title">🎯 In-Market Talent Pools</div><div class="cap-card-desc">Pre-vetted, language-fluent candidates already living and working in your target city.</div></div>
      </div>
      <a href="#markets-s" class="btn btn-blue-outline" style="margin-top:1.5rem" onclick="smoothTo(event,'markets-s')">Explore Our Markets</a>
    </div>
  </div>
</section>

<!-- ══ SECTION 3 — INDUSTRIES ══ -->
<section id="industries-s">
  <div class="ind-intro reveal">
    <span class="section-tag">Industries We Serve</span>
    <h2 class="section-title">Specialized Talent. <em>Every Vertical.</em></h2>
    <div class="divider"></div>
    <p class="section-body" style="color:#4b5563">No single industry is too niche. No volume is too high. We deliver precision talent across every major sector.</p>
  </div>
  <div class="ind-grid">
    <div class="ind-card reveal" onclick="location.href='pages/technical-support.html'" style="cursor:pointer">
      <span class="ind-card-icon">💻</span>
      <div class="ind-card-name">Technology &amp; IT</div>
      <div class="ind-card-desc">Software engineers, data scientists, cybersecurity, cloud architects, QA, and product managers.</div>
      <div style="display:flex;flex-wrap:wrap;gap:.4rem;margin-top:1rem"><span class="tag">Cloud</span><span class="tag">Cybersecurity</span><span class="tag">Data Science</span></div>
      <span class="ind-card-arrow">→</span>
    </div>
    <div class="ind-card reveal" style="transition-delay:.08s" onclick="location.href='pages/healthcare.html'" >
      <span class="ind-card-icon">🏥</span>
      <div class="ind-card-name">Healthcare &amp; Life Sciences</div>
      <div class="ind-card-desc">RNs, traveling nurses, lab techs, allied health, medical coding, and locum tenens physicians.</div>
      <div style="display:flex;flex-wrap:wrap;gap:.4rem;margin-top:1rem"><span class="tag">Travel Nursing</span><span class="tag">Allied Health</span><span class="tag">Locum</span></div>
      <span class="ind-card-arrow">→</span>
    </div>
    <div class="ind-card reveal" style="transition-delay:.16s" onclick="location.href='pages/industrial.html'">
      <span class="ind-card-icon">🏭</span>
      <div class="ind-card-name">Light Industrial &amp; Skilled Trades</div>
      <div class="ind-card-desc">Warehouse associates, assemblers, welders, electricians, logistics coordinators, and maintenance techs.</div>
      <div style="display:flex;flex-wrap:wrap;gap:.4rem;margin-top:1rem"><span class="tag">Welding</span><span class="tag">Logistics</span><span class="tag">Electrical</span></div>
      <span class="ind-card-arrow">→</span>
    </div>
    <div class="ind-card reveal" style="transition-delay:.24s" onclick="location.href='pages/business-support.html'">
      <span class="ind-card-icon">🏢</span>
      <div class="ind-card-name">Professional &amp; Corporate Services</div>
      <div class="ind-card-desc">Finance, accounting, HR, legal, compliance, marketing, and executive assistants.</div>
      <div style="display:flex;flex-wrap:wrap;gap:.4rem;margin-top:1rem"><span class="tag">Finance</span><span class="tag">Legal</span><span class="tag">HR</span></div>
      <span class="ind-card-arrow">→</span>
    </div>
    <div class="ind-card reveal" style="transition-delay:.32s" onclick="location.href='pages/operations.html'">
      <span class="ind-card-icon">⚙️</span>
      <div class="ind-card-name">Engineering &amp; Manufacturing</div>
      <div class="ind-card-desc">Mechanical, civil, electrical, and aerospace engineers plus production supervisors.</div>
      <div style="display:flex;flex-wrap:wrap;gap:.4rem;margin-top:1rem"><span class="tag">Mechanical</span><span class="tag">Aerospace</span><span class="tag">Civil</span></div>
      <span class="ind-card-arrow">→</span>
    </div>
    <div class="ind-card reveal" style="transition-delay:.4s;background:linear-gradient(135deg,#eff6ff,#dbeafe)" onclick="location.href='pages/customer-service.html'">
      <span class="ind-card-icon">🛒</span>
      <div class="ind-card-name">Retail, Hospitality &amp; Logistics</div>
      <div class="ind-card-desc">Store associates, event staff, delivery drivers, supply chain coordinators, and customer support.</div>
      <div style="display:flex;flex-wrap:wrap;gap:.4rem;margin-top:1rem"><span class="tag">Supply Chain</span><span class="tag">Events</span><span class="tag">Customer Support</span></div>
      <span class="ind-card-arrow">→</span>
    </div>
  </div>
  <div style="text-align:center;margin-top:3rem" class="reveal">
    <a href="<%= ResolveUrl("~/pages/services.aspx") %>" class="btn btn-primary">Explore All Services</a>
  </div>
</section>

<!-- ══ SECTION 4 — MARKETS ══ -->
<section id="markets-s" style="background:#111318">
  <div class="markets-inner">
    <div style="text-align:center" class="reveal">
      <span class="section-tag" style="color:#93c5fd">Enterprise-Grade Hiring Hubs</span>
      <h2 class="section-title" style="color:#fff">Deepest Local Coverage. <em style="color:#3b82f6">Fully Operational Today.</em></h2>
      <div class="divider center" style="background:linear-gradient(90deg,#3b82f6,transparent)"></div>
      <p class="section-body" style="color:rgba(255,255,255,.52);margin:0 auto">Our most mature markets offer end-to-end staffing, compliance, and payroll — ready for enterprise scale.</p>
    </div>
    <div class="markets-grid">
      <div class="market-card reveal">
        <div class="market-flag">🇺🇸</div>
        <div class="market-name">United States</div>
        <div class="market-sub">Coast to Coast</div>
        <div class="market-list">
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>50-state compliance</strong> — payroll taxes, workers' comp, I-9, E-Verify</div></div>
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>Visa &amp; immigration support:</strong> H-1B transfers, TN visas, Green Card sponsorship</div></div>
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>Key industries:</strong> Tech (SF, Seattle, Austin), light industrial (Midwest), travel nursing nationwide</div></div>
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>Enterprise integrations:</strong> SAP Fieldglass, Beeline, Workday</div></div>
        </div>
        <div class="market-stat">⚡ Average time-to-fill for tech roles: <strong>12 days</strong> vs. industry avg of 33 days</div>
        <div class="market-badges"><span class="market-badge">Cybersecurity Analyst</span><span class="market-badge">RN</span><span class="market-badge">AWS Architect</span><span class="market-badge">Salesforce Admin</span></div>
      </div>
      <div class="market-card reveal" style="transition-delay:.12s">
        <div class="market-flag">🇨🇦</div>
        <div class="market-name">Canada</div>
        <div class="market-sub">Bilingual &amp; Border-Ready</div>
        <div class="market-list">
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>English &amp; French (Québec compliant)</strong> hiring support</div></div>
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>LMIA &amp; Global Talent Stream experts:</strong> 2-week work permits for specialized roles</div></div>
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>Provincial mastery:</strong> Ontario (AODA), Québec (Bill 96), BC, Alberta</div></div>
          <div class="market-item"><div class="m-dot"></div><div class="m-text"><strong>Indigenous &amp; diversity hiring pathways</strong> for ESG credits</div></div>
        </div>
        <div class="market-stat">✅ <strong>98%</strong> of Canadian LMIA applications approved on first submission (industry avg: 78%)</div>
        <div class="market-badges"><span class="market-badge">Bilingual Support</span><span class="market-badge">Mining Engineer</span><span class="market-badge">Full-Stack Dev</span><span class="market-badge">NMC Nurse</span></div>
      </div>
    </div>
    <div class="expanding-bar reveal">
      <span class="expand-star">✦</span>
      <span class="expand-text" style="color:rgba(255,255,255,.7);font-weight:600">Expanding Soon:</span>
      <div class="expand-tags">
        <span class="expand-tag">🇬🇧 United Kingdom</span><span class="expand-tag">🇮🇳 India</span><span class="expand-tag">🇦🇺 Australia</span><span class="expand-tag">🇩🇪 Germany</span>
      </div>
      <span class="expand-text" style="margin-left:auto">Need talent in a market not listed? <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" style="color:#93c5fd;font-weight:600">Talk to our team →</a></span>
    </div>
  </div>
</section>

<!-- ══ SECTION 5 — HOW IT WORKS ══ -->
<section id="how-s">
  <div class="how-grid">
    <div class="reveal">
      <span class="section-tag">Simple Process</span>
      <h2 class="section-title">From Requisition to <em>First Day.</em></h2>
      <div class="divider"></div>
      <p class="how-para">One unified workflow replaces dozens of vendors, manual steps, and compliance headaches.</p>
      <p class="how-para">Our AI + human model ensures speed without sacrificing fit — local recruiters do final vetting on every candidate our algorithm surfaces.</p>
      <p class="how-para">From digital offer to onboarded and paid, every step is tracked in one dashboard, one invoice, one SLA.</p>
      <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-blue-outline" style="margin-top:1.5rem">Start Your First Search</a>
    </div>
    <div class="reveal" style="transition-delay:.15s">
      <div class="steps-list">
        <div class="step-row"><div class="step-num">01</div><div class="step-content"><div class="step-title">Post or Import Role</div><div class="step-desc">Use the AI job description generator or integrate directly with your ATS.</div></div></div>
        <div class="step-row"><div class="step-num">02</div><div class="step-content"><div class="step-title">AI Matching + Human Review</div><div class="step-desc">Our algorithm ranks by skills, availability, location, and compliance status. Local recruiters do final vetting.</div></div></div>
        <div class="step-row"><div class="step-num">03</div><div class="step-content"><div class="step-title">Interview &amp; Offer</div><div class="step-desc">Schedule, negotiate, and send digital offer letters with e-signature — all in one place.</div></div></div>
        <div class="step-row"><div class="step-num">04</div><div class="step-content"><div class="step-title">Onboard &amp; Pay</div><div class="step-desc">Automated background checks, digital contracts, and unified payroll across all countries.</div></div></div>
      </div>
    </div>
  </div>
</section>

<!-- ══ SECTION 6 — WHY US ══ -->
<section id="why-s">
  <div class="why-inner">
    <div style="text-align:center" class="reveal">
      <span class="section-tag" style="color:#93c5fd">Why Enterprises Choose Us</span>
      <h2 class="section-title" style="color:#fff">Built for Scale. <em style="color:#3b82f6">Certified for Compliance.</em></h2>
      <div class="divider center" style="background:linear-gradient(90deg,#3b82f6,transparent)"></div>
      <p class="section-body" style="color:rgba(255,255,255,.52);margin:0 auto">Our operations are designed to create long-term reliability for enterprise clients across every active market.</p>
    </div>
    <div class="why-grid">
      <div class="why-card reveal"><div class="why-icon">🔐</div><div class="why-title">ISO 27001 · SOC 2 Type II · GDPR</div><div class="why-body">Enterprise-grade security and data compliance certifications covering every market we operate in.</div></div>
      <div class="why-card reveal" style="transition-delay:.08s"><div class="why-icon">🔗</div><div class="why-title">VMS Integrations</div><div class="why-body">Native integrations with SAP Fieldglass, Beeline, and Coupa for seamless enterprise workflow.</div></div>
      <div class="why-card reveal" style="transition-delay:.16s"><div class="why-icon">🕐</div><div class="why-title">24/5 Support</div><div class="why-body">Local account managers in every active region, with a 2-hour emergency fill SLA for contingent roles.</div></div>
      <div class="why-card reveal" style="transition-delay:.24s"><div class="why-icon">📋</div><div class="why-title">Single SLA. All Countries.</div><div class="why-body">One service agreement covers compliance, payroll, and fill rates across every country simultaneously.</div></div>
      <div class="why-card reveal" style="transition-delay:.32s"><div class="why-icon">💹</div><div class="why-title">Proven Cost Savings</div><div class="why-body">Clients report up to 22% savings on blended bill rates by consolidating regional vendors into one platform.</div></div>
    </div>
    <div class="testimonial reveal">
      <div class="testimonial-text">"We replaced five regional staffing vendors with this single platform. Compliance headaches disappeared. And we saved 22% on blended bill rates."</div>
      <div class="testimonial-author">— VP of Global Talent Acquisition, Fortune 1000 Manufacturer</div>
    </div>
  </div>
</section>

<!-- ══ SECTION 7 — INSIGHTS ══ -->
<section id="insights-s">
  <div style="max-width:1200px;margin:0 auto;text-align:center" class="reveal">
    <span class="section-tag">Hiring Intelligence by Market</span>
    <h2 class="section-title">Stay Ahead of <em>Compliance &amp; Trends</em></h2>
    <div class="divider center"></div>
    <p class="section-body" style="color:#4b5563;margin:0 auto">Expert insights on cross-border hiring, compliance, and workforce strategy — updated by our local market teams.</p>
  </div>
  <div class="insights-grid">
    <div class="insight-card reveal"><span class="insight-tag">Compliance</span><div class="insight-title">IR35, 1099 vs W-2, and Québec Bill 96: A cross-border compliance cheat sheet</div><a href="#" class="insight-link">Read article →</a></div>
    <div class="insight-card reveal" style="transition-delay:.1s"><span class="insight-tag">Market Strategy</span><div class="insight-title">How to hire tech talent in North America without a local entity — EOR vs staffing explained</div><a href="<%= ResolveUrl("~/pages/services.aspx") %>" class="insight-link">Read more →</a></div>
    <div class="insight-card reveal" style="transition-delay:.2s"><span class="insight-tag">Benchmarks</span><div class="insight-title">Seasonal staffing benchmarks: USA holiday peak vs Canada summer festival hiring trends</div><a href="#" class="insight-link">Read article →</a></div>
  </div>
</section>

<!-- ══ SECTION 8 — FINAL CTA ══ -->
<section id="cta-s">
  <div class="cta-inner reveal">
    <span class="section-tag" style="color:#93c5fd">Ready to Scale?</span>
    <h2 class="section-title" style="color:#fff;font-size:clamp(2rem,4vw,3.2rem)">Ready to Build a Better Workforce.<br><em style="color:#3b82f6">Anywhere.</em></h2>
    <div class="cta-divider"></div>
    <p class="section-body" style="color:rgba(255,255,255,.52);margin:0 auto;text-align:center">No matter which country you need talent in next — we're either already there or we'll get there with you.</p>
    <div style="display:flex;gap:1rem;flex-wrap:wrap;justify-content:center;margin-top:2.5rem">
      <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-primary">Post a Job (Free Trial)</a>
      <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-outline-white">Talk to a Global Hiring Expert</a>
    </div>
    <div class="cta-pillars">
      <div class="cta-pillar"><span class="cta-pillar-word">Speed</span><div class="cta-pillar-sub">12-Day Fill</div></div>
      <div class="cta-pillar"><span class="cta-pillar-word">Compliance</span><div class="cta-pillar-sub">Every Market</div></div>
      <div class="cta-pillar"><span class="cta-pillar-word">Savings</span><div class="cta-pillar-sub">Up to 22%</div></div>
    </div>
  </div>
</section>

<!-- FOOTER (staffing site-footer) -->
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent"   runat="server">
<button id="backToTop" style="position:fixed;bottom:2rem;right:2rem;background:#2563eb;color:#fff;border:none;width:44px;height:44px;border-radius:50%;font-size:1.2rem;cursor:pointer;opacity:0;transition:opacity .3s;z-index:999;box-shadow:0 4px 16px rgba(37,99,235,.4)">↑</button>

<script src="js/main.js"></script>
<script src="js/vpstore.js"></script>
<script src="js/portal-widget.js"></script>

<script>
function smoothTo(e,id){e.preventDefault();var el=document.getElementById(id);if(!el)return;var nav=document.getElementById('navbar');var offset=nav?nav.offsetHeight+8:80;window.scrollTo({top:el.getBoundingClientRect().top+window.scrollY-offset,behavior:'smooth'});}
function sfSubscribe(e){e.preventDefault();var btn=e.target.querySelector('.sf-newsletter-btn');btn.textContent='Subscribed!';btn.style.background='#16a34a';e.target.querySelector('.sf-newsletter-input').value='';setTimeout(function(){btn.textContent='Subscribe';btn.style.background='';},3000);}
var LEGAL_CONTENT={privacy:{icon:'🔒',title:'Privacy Policy',sections:[{title:'Data Collection & Use',body:'We respect your privacy and are committed to protecting your personal information. Any data collected through our website is used solely for recruitment and communication purposes.'},{title:'Data Sharing',body:'We do not share your information with third parties without your consent, except when required for job placement or legal obligations.'},{title:'Your Rights',body:'You have the right to access, correct, or request deletion of your personal data at any time. Contact us at info@aivirtrix.com.'}]},terms:{icon:'📋',title:'Terms & Conditions',sections:[{title:'Acceptance of Terms',body:'By using our website, you agree to comply with our terms and conditions. The information provided is for general recruitment purposes only.'},{title:'No Guarantee of Placement',body:'We do not guarantee job placement or hiring outcomes. Aivirtrix acts as an intermediary between employers and candidates.'},{title:'User Responsibilities',body:'Users are responsible for the accuracy of the information they provide. Submitting false information may result in removal from our platform.'}]}};
function openLegalModal(type){var c=LEGAL_CONTENT[type];if(!c)return;document.getElementById('legal-modal-icon').innerHTML=c.icon;document.getElementById('legal-modal-title-text').textContent=c.title;document.getElementById('legal-modal-body').innerHTML=c.sections.map(function(s){return'<div class="legal-section"><div class="legal-section-title">'+s.title+'</div><div class="legal-section-body"><p>'+s.body+'</p></div></div>';}).join('');document.getElementById('legal-modal-backdrop').classList.add('open');document.body.style.overflow='hidden';}
function closeLegalModal(e){if(e&&e.target!==document.getElementById('legal-modal-backdrop'))return;document.getElementById('legal-modal-backdrop').classList.remove('open');document.body.style.overflow='';}
document.addEventListener('keydown',function(e){if(e.key==='Escape')closeLegalModal();});
</script>
</asp:Content>