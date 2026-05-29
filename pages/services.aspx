<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="Pages_services" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Services &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Aivirtrix Staffing Services — Permanent, Contract, RPO</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server">

  <style>
:root{
      --blue:#2563eb; --blue-light:#60a5fa;
      --blue-pale:#eff6ff; --blue-xpale:#f0f6ff;
      --blue-shadow:rgba(37,99,235,.13);
      --navy:#060d1f; --black:#0d1117; --black-soft:#0f172a;
      --bdr:#e2e8f0; --bdr-blue:#bfdbfe;
      --ease:cubic-bezier(.4,0,.2,1);
    }
    *,*::before,*::after{box-sizing:border-box;margin:0;padding:0}
    html{scroll-behavior:smooth}
    body{font-family:'Poppins',sans-serif;background:#f8fafc;color:#1e293b;line-height:1.6;-webkit-font-smoothing:antialiased}
    a{text-decoration:none;color:inherit}
    ul{list-style:none}
    img{display:block;max-width:100%}
    .container{max-width:1200px;margin:0 auto;padding:0 5%}

    /* ── TOPBAR ── */
    
    
    
    
    
    
    
    
    

    /* ── NAVBAR ── */
    
    
    
    
    .logo-text{font-size:.98rem;font-weight:lighter;color:var(--black);line-height:1.1;letter-spacing:-.01em}
    .logo-text span{display:block;font-size:.52rem;font-weight:700;letter-spacing:.2em;color:#64748b;text-transform:uppercase;margin-top:.1rem}
    .logo-accent{color:var(--blue)}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /* ── HERO ── */
    .page-hero{
      background:var(--black-soft);
      background-image:radial-gradient(ellipse 65% 55% at 12% 55%,rgba(37,99,235,.24) 0%,transparent 65%),radial-gradient(ellipse 40% 40% at 80% 20%,rgba(96,165,250,.1) 0%,transparent 60%),linear-gradient(135deg,#060d1f 0%,#0d1b3e 40%,#0a0f1e 100%);
      padding:8rem 5% 5rem;position:relative;overflow:hidden;
    }
    .page-hero::before{content:'';position:absolute;inset:0;background-image:radial-gradient(circle,rgba(255,255,255,.04) 1px,transparent 1px);background-size:28px 28px;pointer-events:none}
    .page-hero::after{content:'';position:absolute;bottom:0;left:0;right:0;height:3px;background:linear-gradient(90deg,transparent,var(--blue),var(--blue-light),var(--blue),transparent)}
    .hero-inner{position:relative;z-index:1;max-width:1200px;margin:0 auto}
    .breadcrumb{display:flex;align-items:center;gap:.4rem;font-size:.7rem;font-weight:600;color:rgba(255,255,255,.38);letter-spacing:.08em;text-transform:uppercase;margin-bottom:1.4rem}
    .breadcrumb a{color:var(--blue-light)}
    .breadcrumb a:hover{color:#fff}
    .section-tag{display:inline-block;font-size:.63rem;font-weight:700;letter-spacing:.17em;text-transform:uppercase;color:var(--blue-light);background:rgba(37,99,235,.18);border:1px solid rgba(96,165,250,.25);border-radius:20px;padding:.22rem .85rem;margin-bottom:1rem}

    /* HERO TITLE — VERY BOLD matching screenshot */
    .page-hero-title{font-size:clamp(1.4rem,2.6vw,2.2rem);font-weight:lighter;color:#fff;line-height:1.1;letter-spacing:-.025em;margin-bottom:1.1rem;white-space:nowrap}
    .page-hero-title em{font-style:italic;color:var(--blue-light)}
    .page-hero-sub{font-size:.93rem;color:rgba(255,255,255,.55);max-width:100%;line-height:1.78;white-space:nowrap}
    .hero-stats{display:flex;gap:3rem;margin-top:2.8rem;flex-wrap:wrap;justify-content:center}
    .stat-num{font-size:2.3rem;font-weight:lighter;color:var(--blue-light);line-height:1}
    .stat-lbl{font-size:.6rem;font-weight:700;letter-spacing:.16em;text-transform:uppercase;color:rgba(255,255,255,.38);margin-top:.3rem}

    /* ── UTILITY ── */
    .divider{height:2px;background:linear-gradient(90deg,var(--blue),transparent);margin-bottom:2.8rem;border-radius:2px;opacity:.3}
    section .section-tag{color:var(--blue);background:rgba(37,99,235,.08);border-color:rgba(37,99,235,.2)}

    /* CAT HEADER — bold section headings matching screenshot */
    .cat-header{display:flex;align-items:center;gap:1.4rem;margin-bottom:2.5rem}
    .cat-num{width:54px;height:54px;border-radius:50%;background:var(--blue);color:#fff;font-size:1.3rem;font-weight:lighter;display:flex;align-items:center;justify-content:center;flex-shrink:0;box-shadow:0 6px 20px rgba(37,99,235,.35)}
    .cat-title .section-tag{margin-bottom:.25rem}
    .cat-title h2{font-size:clamp(1.7rem,3vw,2.4rem);font-weight:lighter;color:var(--black);letter-spacing:-.02em;line-height:1.15;margin:0}
    .cat-title h2 em{font-style:italic;color:var(--blue)}

    /* ── TABS ── */
    .tabs-wrap{background:#f1f5f9;border-bottom:2px solid #e2e8f0;position:sticky;top:70px;z-index:100}
    .tabs-inner{display:flex;max-width:1200px;margin:0 auto;padding:0 5%;overflow-x:auto}
    .tab-btn{padding:1.1rem 2.8rem;font-family:'Poppins',sans-serif;font-size:.76rem;font-weight:800;letter-spacing:.12em;text-transform:uppercase;border:none;background:none;cursor:pointer;color:#64748b;border-bottom:3px solid transparent;margin-bottom:-2px;transition:all .25s;white-space:nowrap}
    .tab-btn.active,.tab-btn:hover{color:var(--blue);border-bottom-color:var(--blue)}
    .tab-panel{display:none}
    .tab-panel.active{display:block}

    /* ── SERVICE CARDS ── */
    .svc-cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(290px,1fr));gap:2rem;margin-bottom:4rem}
    .svc-card{background:#fff;border:1px solid var(--bdr);border-radius:12px;padding:2.3rem 2rem;transition:all .35s var(--ease);position:relative;overflow:hidden}
    .svc-card::after{content:'';position:absolute;inset:0;background:linear-gradient(135deg,var(--blue),#1d4ed8);opacity:0;transition:opacity .35s var(--ease);border-radius:12px;z-index:0}
    .svc-card:hover{transform:translateY(-7px);box-shadow:0 24px 56px var(--blue-shadow);border-color:transparent}
    .svc-card:hover::after{opacity:1}
    .svc-card>*{position:relative;z-index:1}
    .svc-card:hover .svc-tag,.svc-card:hover .svc-name,.svc-card:hover .svc-desc,.svc-card:hover .svc-list li,.svc-card:hover .card-cta{color:#fff!important}
    .svc-card:hover .svc-icon{background:rgba(255,255,255,.15)!important}
    .svc-card:hover .svc-list li::before{background:rgba(255,255,255,.8)!important}
    .svc-card:hover .card-cta{border-top-color:rgba(255,255,255,.25)!important}
    .svc-icon{width:52px;height:52px;border-radius:12px;background:var(--blue-pale);display:flex;align-items:center;justify-content:center;font-size:1.5rem;margin-bottom:1.2rem;transition:background .35s}
    .svc-tag{font-size:.6rem;font-weight:800;letter-spacing:.14em;text-transform:uppercase;color:var(--blue);display:block;margin-bottom:.4rem;transition:color .35s}
    .svc-name{font-size:1.08rem;font-weight:800;color:var(--black);margin-bottom:.75rem;line-height:1.35;transition:color .35s}
    .svc-desc{font-size:.82rem;color:#64748b;line-height:1.75;margin-bottom:1.2rem;transition:color .35s}
    .svc-list{padding:0;margin:0 0 1.4rem;display:flex;flex-direction:column;gap:.4rem}
    .svc-list li{font-size:.79rem;color:#475569;display:flex;align-items:flex-start;gap:.5rem;line-height:1.5;transition:color .35s}
    .svc-list li::before{content:'';width:5px;height:5px;border-radius:50%;background:var(--blue);flex-shrink:0;margin-top:.46em;transition:background .35s}
    .card-cta{display:inline-flex;align-items:center;gap:.4rem;font-size:.72rem;font-weight:800;letter-spacing:.1em;text-transform:uppercase;color:var(--blue);padding-top:.9rem;border-top:1px solid var(--bdr);width:100%;transition:all .35s}
    .card-cta::after{content:'→';transition:transform .25s}
    .svc-card:hover .card-cta::after{transform:translateX(5px)}

    /* ── INDUSTRIES SPLIT ── */
    .ind-split{display:grid;grid-template-columns:1fr 1fr;gap:4rem;align-items:center;margin-bottom:4rem}
    .ind-img-wrap{position:relative;border-radius:14px;overflow:hidden;height:420px;box-shadow:0 24px 64px rgba(0,0,0,.16);background:linear-gradient(135deg,#0f172a,#1e3a5f);display:flex;align-items:center;justify-content:center}
    .ind-img-wrap img{width:100%;height:100%;object-fit:cover}
    .ind-badge{position:absolute;bottom:1.4rem;left:1.4rem;background:#fff;border-radius:10px;padding:.8rem 1.2rem;box-shadow:0 6px 24px rgba(0,0,0,.14)}
    .ind-badge-num{font-size:1.4rem;font-weight:lighter;color:var(--blue);line-height:1}
    .ind-badge-lbl{font-size:.62rem;font-weight:700;letter-spacing:.08em;text-transform:uppercase;color:#64748b;line-height:1.35}
    .ind-tags-wrap h3{font-size:1rem;font-weight:800;color:var(--black);margin-bottom:1rem;padding-bottom:.7rem;border-bottom:2px solid var(--blue-pale)}
    .ind-tags{display:flex;flex-wrap:wrap;gap:.5rem}
    .ind-tag{background:#fff;border:1px solid var(--bdr);border-radius:7px;padding:.38rem .88rem;font-size:.73rem;font-weight:600;color:#334155;transition:all .22s;cursor:default}
    .ind-tag:hover{border-color:var(--bdr-blue);color:var(--blue);background:var(--blue-pale);transform:translateY(-1px)}

    /* ── PROCESS STEPS ── */
    .process-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:1.5rem;margin-bottom:4rem;align-items:start}
    .process-step{background:#fff;border:1px solid var(--bdr);border-radius:12px;padding:1.8rem 1.5rem;transition:all .3s var(--ease);position:relative;overflow:hidden;display:flex;flex-direction:column;align-items:flex-start;word-wrap:break-word;overflow-wrap:break-word}    .process-step::before{content:'';position:absolute;top:0;left:0;right:0;height:3px;background:linear-gradient(90deg,var(--blue),var(--blue-light));opacity:0;transition:opacity .3s}
    .process-step:hover{border-color:var(--bdr-blue);box-shadow:0 14px 36px var(--blue-shadow);transform:translateY(-5px)}
    .process-step:hover::before{opacity:1}
    .step-num{width:36px;height:36px;border-radius:50%;background:var(--blue);color:#fff;font-size:.78rem;font-weight:800;display:flex;align-items:center;justify-content:center;margin-bottom:.8rem;flex-shrink:0}
    .step-title{font-size:.88rem;font-weight:800;color:var(--black);margin-bottom:.45rem;width:100%}
    .step-text{font-size:.76rem;color:#64748b;line-height:1.65;word-wrap:break-word;overflow-wrap:break-word;white-space:normal;width:100%;flex:1}

    /* ── BENEFITS ── */
    .benefits-list{display:flex;flex-direction:column;gap:.75rem;margin-bottom:4rem}
    .benefit-row{display:flex;align-items:flex-start;gap:1rem;padding:1rem 1.3rem;background:#fff;border:1px solid var(--bdr);border-radius:10px;transition:all .25s var(--ease)}
    .benefit-row:hover{border-color:var(--bdr-blue);box-shadow:0 6px 22px var(--blue-shadow);transform:translateX(4px)}
    .benefit-icon{width:40px;height:40px;border-radius:9px;background:var(--blue-pale);display:flex;align-items:center;justify-content:center;font-size:1.1rem;flex-shrink:0}
    .benefit-body strong{display:block;font-size:.86rem;font-weight:800;color:var(--black);margin-bottom:.15rem}
    .benefit-body span{font-size:.78rem;color:#64748b;line-height:1.55}

    /* ── WHY CARDS ── */
    .why-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:1.4rem;margin-bottom:4rem}
    .why-card{background:var(--blue-pale);border-radius:10px;padding:1.8rem;text-align:center;transition:all .3s var(--ease);cursor:default}
    .why-card:hover{background:var(--blue);transform:translateY(-4px);box-shadow:0 16px 40px var(--blue-shadow)}
    .why-card:hover .why-title,.why-card:hover .why-text{color:#fff}
    .why-icon{font-size:2rem;margin-bottom:.8rem}
    .why-title{font-size:.9rem;font-weight:800;color:var(--black);margin-bottom:.4rem;transition:color .3s}
    .why-text{font-size:.78rem;color:#555;line-height:1.65;transition:color .3s}

    /* ── FAQ ── */
    .faq-list{display:flex;flex-direction:column;gap:.6rem;margin-bottom:4rem}
    .faq-item{border:1px solid var(--bdr);border-radius:10px;overflow:hidden;background:#fff}
    .faq-q{width:100%;text-align:left;background:none;border:none;padding:1.1rem 1.3rem;font-family:'Poppins',sans-serif;font-size:.85rem;font-weight:700;color:var(--black);cursor:pointer;display:flex;justify-content:space-between;align-items:center;gap:1rem;transition:color .2s}
    .faq-q::after{content:'+';font-size:1.3rem;color:var(--blue);flex-shrink:0;transition:transform .25s}
    .faq-q.open::after{transform:rotate(45deg)}
    .faq-q:hover{color:var(--blue)}
    .faq-a{font-size:.82rem;color:#64748b;line-height:1.75;padding:0 1.3rem;max-height:0;overflow:hidden;transition:max-height .35s var(--ease),padding .3s}
    .faq-a.open{max-height:300px;padding:0 1.3rem 1.1rem}

    /* ── BUTTONS ── */
    .btn{display:inline-flex;align-items:center;justify-content:center;font-family:'Poppins',sans-serif;font-size:.8rem;font-weight:800;letter-spacing:.1em;text-transform:uppercase;padding:.9rem 2.3rem;border-radius:8px;border:2px solid transparent;cursor:pointer;transition:all .25s var(--ease)}
    .btn-primary{background:var(--blue);color:#fff;border-color:var(--blue)}
    .btn-primary:hover{background:#1d4ed8;border-color:#1d4ed8;transform:translateY(-2px);box-shadow:0 8px 24px rgba(37,99,235,.4)}
    .btn-outline-white{background:transparent;color:#fff;border-color:rgba(255,255,255,.4)}
    .btn-outline-white:hover{background:rgba(255,255,255,.1);border-color:#fff;transform:translateY(-2px)}

    /* ── CTA ── */
    .cta-section{background:var(--black-soft);background-image:radial-gradient(ellipse 50% 60% at 12% 55%,rgba(37,99,235,.18) 0%,transparent 65%),radial-gradient(ellipse 35% 50% at 85% 30%,rgba(96,165,250,.07) 0%,transparent 60%);padding:5.5rem 5%;text-align:center;position:relative;overflow:hidden}
    .cta-section::before{content:'';position:absolute;inset:0;background-image:radial-gradient(circle,rgba(255,255,255,.03) 1px,transparent 1px);background-size:28px 28px;pointer-events:none}
    .cta-inner{position:relative;z-index:1;max-width:1200px;margin:0 auto}
    .cta-section h2{font-size:clamp(1.8rem,3.5vw,2.8rem);font-weight:lighter;color:#fff;letter-spacing:-.02em;margin-bottom:1rem}
    .cta-section h2 em{color:var(--blue-light);font-style:italic}
    .cta-section p{max-width:560px;margin:0 auto 2.5rem;color:rgba(255,255,255,.55);font-size:.93rem;line-height:1.75}
    .cta-btns{display:flex;gap:1rem;justify-content:center;flex-wrap:wrap}

    /* ── FOOTER ── */
    
    
    
    
    
    
    
    
    
    
    
    
    

    /* ── REVEAL ── */
    .reveal{opacity:0;transform:translateY(24px);transition:opacity .55s var(--ease),transform .55s var(--ease)}
    .reveal.visible{opacity:1;transform:translateY(0)}

    /* ── BACK TO TOP ── */
    
    
    

    /* ── RESPONSIVE ── */
    @media(max-width:1024px){}
    @media(max-width:900px){.ind-split{grid-template-columns:1fr;gap:2.5rem}.ind-img-wrap{height:260px}}
    @media(max-width:640px){.hero-stats{gap:1.6rem}.page-hero{padding:8rem 5% 3rem}}
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<!-- HERO -->
<div class="page-hero">
  <div class="hero-inner">
    <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>›</span><span>Services</span></div>
    <span class="section-tag">What We Offer</span>
    <h1 class="page-hero-title">Hire the Best Talent to <em>Stay One Step Ahead</em></h1>
    <p class="page-hero-sub">Aivirtrix takes pride in connecting the best talent with the right opportunity — whether you're an employer building a team or a professional seeking your next role.</p>
    <div class="hero-stats">
      <div><div class="stat-num">3</div><div class="stat-lbl">Service Models</div></div>
      <div><div class="stat-num">14+</div><div class="stat-lbl">Industries Covered</div></div>
      <div><div class="stat-num">100%</div><div class="stat-lbl">Vetted Candidates</div></div>
      <div><div class="stat-num">Fast</div><div class="stat-lbl">Turnaround</div></div>
    </div>
  </div>
</div>

<!-- TABS -->
<div class="tabs-wrap">
  <div class="tabs-inner">
    <button class="tab-btn active" data-tab="employers">For Employers</button>
    <button class="tab-btn" data-tab="jobseekers">For Job Seekers</button>
  </div>
</div>

<!-- ════ EMPLOYERS ════ -->
<div id="tab-employers" class="tab-panel active">

  <section style="background:#fff;padding:5rem 0">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-num">1</div>
        <div class="cat-title"><span class="section-tag">Staffing Models</span><h2>Our <em>Hiring Solutions</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="svc-cards">
        <div class="svc-card reveal">
          <div class="svc-icon">🔄</div><span class="svc-tag">Flexible Staffing</span>
          <div class="svc-name">Contract / Contract-to-Hire Staffing</div>
          <div class="svc-desc">Hire for a day, a month, or as long as you need. Flexible terms for both contract and contract-to-hire consultants — speed is the essence in filling these positions.</div>
          <ul class="svc-list"><li>Rapid deployment of pre-screened candidates</li><li>Short-term or long-term contract durations</li><li>Option to convert to permanent hire at any time</li><li>Ideal for seasonal demand or project-based work</li></ul>
          <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="card-cta">Request Talent</a>
        </div>
        <div class="svc-card reveal">
          <div class="svc-icon">🤝</div><span class="svc-tag">Permanent Placement</span>
          <div class="svc-name">Direct Hire / Permanent Staffing</div>
          <div class="svc-desc">From entry-level to senior-level professionals. We source candidates who fit both skill set and company culture for lasting tenure.</div>
          <ul class="svc-list"><li>Deep cultural-fit and competency assessment</li><li>Success measured by employee tenure length</li><li>Faster sourcing through our active talent pipeline</li><li>End-to-end recruitment management handled for you</li></ul>
          <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="card-cta">Request Talent</a>
        </div>
        <div class="svc-card reveal">
          <div class="svc-icon">📦</div><span class="svc-tag">Outsourced Hiring</span>
          <div class="svc-name">RaaS – Recruitment as a Service</div>
          <div class="svc-desc">A monthly retainer model with minimal placement fees. We follow your internal hiring processes and partner with you through every stage of recruitment.</div>
          <ul class="svc-list"><li>Dedicated recruiter embedded in your hiring workflow</li><li>JD writing, SEO optimisation, and market rate advisory</li><li>Access to Naukri, LinkedIn, Indeed, Glassdoor & more</li><li>Background checks and onboarding support included</li></ul>
          <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="card-cta">Request Talent</a>
        </div>
      </div>
    </div>
  </section>

  

  <section style="background:#fff;padding:5rem 0">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-num">2</div>
        <div class="cat-title"><span class="section-tag">Our Process</span><h2>How Aivirtrix <em>Works for You</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="process-grid">
        <div class="process-step reveal"><div class="step-num">01</div><div class="step-title">Understand Your Needs</div><div class="step-text">A dedicated Account Manager learns your requirements, culture, and growth goals in depth.</div></div>
        <div class="process-step reveal"><div class="step-num">02</div><div class="step-title">Source & Pipeline</div><div class="step-text">Industry-specialised recruiters proactively source and pipeline qualified candidates for your roles.</div></div>
        <div class="process-step reveal"><div class="step-num">03</div><div class="step-title">Triple Vetting</div><div class="step-text">Every candidate is screened by our Sourcer, Recruiter, and Account Manager before submission.</div></div>
        <div class="process-step reveal"><div class="step-num">04</div><div class="step-title">Interview Management</div><div class="step-text">We manage the entire interview process — scheduling, feedback, and communication end-to-end.</div></div>
        <div class="process-step reveal"><div class="step-num">05</div><div class="step-title">Placement & Follow-Up</div><div class="step-text">We stay engaged post-placement and measure success by how long the employee thrives with you.</div></div>
      </div>
      <div class="cat-header reveal">
        <div class="cat-num">★</div>
        <div class="cat-title"><span class="section-tag">Why Choose Aivirtrix</span><h2>Employer <em>Advantages</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="benefits-list">
        <div class="benefit-row reveal"><div class="benefit-icon">🏷️</div><div class="benefit-body"><strong>Industry-Organised Recruiting Teams</strong><span>Our recruiters are structured by sector — enabling them to become true subject-matter experts in their specific hiring area.</span></div></div>
        <div class="benefit-row reveal"><div class="benefit-icon">🔍</div><div class="benefit-body"><strong>Continuous Candidate Pipelining</strong><span>We proactively source and pipeline candidates for high-demand positions so you never start from scratch when a role opens.</span></div></div>
        <div class="benefit-row reveal"><div class="benefit-icon">👤</div><div class="benefit-body"><strong>Single Point of Contact</strong><span>Each client gets a dedicated Account Manager who deeply understands your business, team, and culture requirements.</span></div></div>
        <div class="benefit-row reveal"><div class="benefit-icon">✅</div><div class="benefit-body"><strong>100% Vetted Submissions Only</strong><span>We only submit candidates with the right skill set, culture fit, and who are ready to interview and start immediately.</span></div></div>
        <div class="benefit-row reveal"><div class="benefit-icon">📢</div><div class="benefit-body"><strong>Targeted Advertising for Hard-to-Fill Roles</strong><span>We run targeted ads across Naukri, LinkedIn, Indeed, and Glassdoor — screening every applicant before submission.</span></div></div>
      </div>
    </div>
  </section>

  <section style="background:var(--blue-xpale);padding:5rem 0">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-num">?</div>
        <div class="cat-title"><span class="section-tag">Employer FAQs</span><h2>Frequently Asked <em>Questions</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="faq-list">
        <div class="faq-item"><button class="faq-q">1. How can I share my hiring requirements?</button><div class="faq-a">Employers can share their hiring needs through our website’s contact form or by directly reaching out via email or phone. Once we receive your requirement, our team connects with you to understand job roles, required skills, experience level, timelines, and other specific expectations.</div></div>
        <div class="faq-item"><button class="faq-q">2. What types of hiring services do you offer?</button><div class="faq-a">We provide end-to-end recruitment solutions including permanent hiring, contract staffing, and bulk hiring. Our services are designed to support companies of all sizes, from startups to established organizations, ensuring they find the right talent efficiently.</div></div>
        <div class="faq-item"><button class="faq-q">3. How do you ensure the quality of candidates?</button><div class="faq-a">We follow a structured screening process where candidate profiles are evaluated based on skills, experience, and job fit. Basic verification and initial assessments are conducted before sharing profiles with clients, ensuring that only relevant and qualified candidates are shortlisted.</div></div>
        <div class="faq-item"><button class="faq-q">4. How long does it take to close a position?</button><div class="faq-a">The hiring timeline depends on factors such as role complexity, required experience, and market availability of candidates. However, we aim to provide relevant candidate profiles within a short time frame and ensure a smooth and efficient hiring process.</div></div>
        <div class="faq-item"><button class="faq-q">5. Do you support bulk hiring requirements?</button><div class="faq-a">Yes, we specialize in bulk hiring solutions for companies looking to recruit multiple candidates within a short period. Our team is equipped to handle large-scale hiring needs while maintaining quality and speed.</div></div>
      </div>
    </div>
  </section>
</div>

<!-- ════ JOB SEEKERS ════ -->
<div id="tab-jobseekers" class="tab-panel">

  <section style="background:#fff;padding:5rem 0">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-num">1</div>
        <div class="cat-title"><span class="section-tag">Placement Options</span><h2>Find Your <em>Next Role</em></h2></div>
      </div>
      <div class="divider"></div>
      <p style="font-size:.88rem;color:#64748b;max-width:640px;line-height:1.8;margin-bottom:2.2rem">Aivirtrix understands the challenges candidates face — trust us to guide you through the entire process, from first conversation to offer letter.</p>
      <div class="svc-cards">
        <div class="svc-card reveal">
          <div class="svc-icon">📅</div><span class="svc-tag">Short-Term</span>
          <div class="svc-name">Contract Staffing</div>
          <div class="svc-desc">Contract work lets you assess the culture, colleagues, and job demands before committing to a permanent role.</div>
          <ul class="svc-list"><li>Experience new industries and working environments</li><li>Build your skills and professional network fast</li><li>Flexible schedule to suit your lifestyle</li><li>Fast placement — often within days of registration</li></ul>
          <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="card-cta">Search Jobs</a>
        </div>
        <div class="svc-card reveal">
          <div class="svc-icon">🚀</div><span class="svc-tag">Try Before You Commit</span>
          <div class="svc-name">Contract-to-Hire Staffing</div>
          <div class="svc-desc">From early-career professionals to executives — Aivirtrix assists you to find the right full-time opportunity with the right employer.</div>
          <ul class="svc-list"><li>Prove your value before accepting a permanent offer</li><li>Full recruiter support throughout the process</li><li>Clear pathway to a permanent role with great employers</li><li>Access to roles not publicly advertised</li></ul>
          <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="card-cta">Search Jobs</a>
        </div>
        <div class="svc-card reveal">
          <div class="svc-icon">🎯</div><span class="svc-tag">Permanent Placement</span>
          <div class="svc-name">Direct Hire / Permanent Staffing</div>
          <div class="svc-desc">Aivirtrix works directly with clients across multiple industries. We keep you informed every step and negotiate salary and benefits on your behalf.</div>
          <ul class="svc-list"><li>Access to exclusive direct-client opportunities</li><li>Salary and benefits negotiation on your behalf</li><li>Interview preparation and coaching included</li><li>Account Manager follows up with hiring managers for you</li></ul>
          <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="card-cta">Search Jobs</a>
        </div>
      </div>
    </div>
  </section>

  <section style="background:var(--blue-xpale);padding:5rem 0">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-num">2</div>
        <div class="cat-title"><span class="section-tag">Candidate Support</span><h2>Benefits of Partnering <em>With Aivirtrix</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="why-grid">
        <div class="why-card reveal"><div class="why-icon"></div><div class="why-title">Recruiter Advocacy</div><div class="why-text">Your recruiter works hard to understand your skills, needs, and career goals so they can match you to the right positions.</div></div>
        <div class="why-card reveal"><div class="why-icon"></div><div class="why-title">Proactive Job Matching</div><div class="why-text">We proactively search new positions from our clients and contact you whenever you're a strong fit for one.</div></div>
        <div class="why-card reveal"><div class="why-icon"></div><div class="why-title">Career Guidance</div><div class="why-text">Expert guidance on current job trends, salary benchmarks, and what employers are prioritising right now.</div></div>
        <div class="why-card reveal"><div class="why-icon"></div><div class="why-title">Interview Preparation</div><div class="why-text">Your Account Manager prepares you for every interview and stays in touch with hiring managers on your behalf.</div></div>
        <div class="why-card reveal"><div class="why-icon"></div><div class="why-title">Salary Negotiation</div><div class="why-text">Aivirtrix negotiates salary and benefits on your behalf so you always get the compensation you deserve.</div></div>
        <div class="why-card reveal"><div class="why-icon"></div><div class="why-title">Seamless Transitions</div><div class="why-text">We track your contract end date and line up your next opportunity in advance to minimise any gap between roles.</div></div>
      </div>
    </div>
  </section>

  <section style="background:#fff;padding:5rem 0">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-num">3</div>
        <div class="cat-title"><span class="section-tag">Getting Started</span><h2>Your Journey <em>Starts Here</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="process-grid">
        <div class="process-step reveal"><div class="step-num">01</div><div class="step-title">Submit Your Resume</div><div class="step-text">Share your profile and career goals with our team so we can get to know you beyond a job title.</div></div>
        <div class="process-step reveal"><div class="step-num">02</div><div class="step-title">Recruiter Call</div><div class="step-text">A dedicated recruiter contacts you to understand your skills, preferences, and ideal next role.</div></div>
        <div class="process-step reveal"><div class="step-num">03</div><div class="step-title">Matched to Roles</div><div class="step-text">We match your profile to current and upcoming vacancies — including exclusive unadvertised positions.</div></div>
        <div class="process-step reveal"><div class="step-num">04</div><div class="step-title">Interview Prep</div><div class="step-text">Your Account Manager prepares you and manages all communications with the employer throughout.</div></div>
        <div class="process-step reveal"><div class="step-num">05</div><div class="step-title">Offer & Onboarding</div><div class="step-text">We negotiate your offer, support your onboarding, and track your next opportunity in advance.</div></div>
      </div>
    </div>
  </section>

  <section style="background:var(--blue-xpale);padding:5rem 0">
    <div class="container">
      <div class="cat-header reveal">
        <div class="cat-num">?</div>
        <div class="cat-title"><span class="section-tag">Candidate FAQs</span><h2>Frequently Asked <em>Questions</em></h2></div>
      </div>
      <div class="divider"></div>
      <div class="faq-list">
        <div class="faq-item"><button class="faq-q">1. How do I apply for jobs on your platform?</button><div class="faq-a">You can explore available job opportunities directly on our website and apply by submitting your updated resume along with basic details such as your skills, experience, and preferred location. Once your application is received, our recruitment team reviews your profile and matches it with relevant job openings. If your profile aligns with the requirement, we will reach out to you for the next steps.</div></div>
        <div class="faq-item"><button class="faq-q">2. Do I need to pay any fees to apply for jobs?</button><div class="faq-a">No, our services for job seekers are completely free of cost. We do not charge any registration, application, or placement fees at any stage of the hiring process. Our goal is to support candidates in finding the right opportunity without any financial burden.</div></div>
        <div class="faq-item"><button class="faq-q">3. How will I know if my application is shortlisted?</button><div class="faq-a">If your profile matches the job requirements, our team will contact you via email or phone call. You may also receive updates regarding interview schedules, feedback, or further steps. We recommend regularly checking your email and keeping your contact details up to date to avoid missing any communication.</div></div>
        <div class="faq-item"><button class="faq-q">4. Can freshers apply for jobs?</button><div class="faq-a">Yes, we provide opportunities for both freshers and experienced professionals. We understand the challenges faced by freshers and career restart candidates, so we actively work to connect them with entry-level roles and companies open to hiring candidates with strong potential and learning mindset.</div></div>
        <div class="faq-item"><button class="faq-q">5. Do you provide interview preparation support?</button><div class="faq-a">Yes, we offer basic interview guidance to help candidates perform better. This includes tips on resume improvement, commonly asked interview questions, communication guidance, and general best practices to boost confidence during the hiring process.?</button><div class="faq-a">Yes. Aivirtrix negotiates salary and benefits on your behalf so you always get a fair and competitive package based on current market rates.</div></div>
      </div>
    </div>
  </section>
</div>

<!-- CTA -->
<div class="cta-section">
  <div class="cta-inner">
    <span class="section-tag" style="color:var(--blue-light);background:rgba(96,165,250,.15);border-color:rgba(96,165,250,.25)">Work With Aivirtrix</span>
    <h2>Ready to Take the <em>Next Step?</em></h2>
    <p>Whether you're building a team or searching for your next career opportunity — Aivirtrix connects you with the right match, fast.</p>
    <div class="cta-btns">
      <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-primary">Hire Talent</a>
      <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-outline-white">Find a Job</a>
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