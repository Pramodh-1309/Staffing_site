<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="Pages_about" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">About Us &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">AI-powered staffing — About Aivirtrix</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server">

  <style>
/* ── ABOUT PAGE EXTRAS ── */
    .about-stat-strip {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 0;
      background: #2563eb;
      max-width: 100%;
    }
    .about-stat-item {
      padding: 2.2rem 1.5rem;
      text-align: center;
      border-right: 1px solid rgba(255,255,255,.18);
    }
    .about-stat-item:last-child { border-right: none; }
    .about-stat-num {
      font-size: 2.4rem;
      font-weight: 900;
      color: #fff;
      line-height: 1;
      margin-bottom: .3rem;
      font-family: monospace;
    }
    .about-stat-label {
      font-size: .72rem;
      color: rgba(255,255,255,.75);
      text-transform: uppercase;
      letter-spacing: .12em;
      font-weight: 600;
    }

    .industry-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 1.2rem;
      max-width: 1200px;
      margin: 0 auto;
    }
    .industry-card {
      background: #fff;
      border: 1.5px solid rgba(0,0,0,.07);
      border-radius: 10px;
      padding: 1.6rem 1.3rem;
      text-align: center;
      transition: border-color .22s, transform .22s, box-shadow .22s;
    }
    .industry-card:hover {
      border-color: #2563eb;
      transform: translateY(-4px);
      box-shadow: 0 10px 32px rgba(37,99,235,.12);
    }
    .industry-icon {
      width: 52px; height: 52px;
      border-radius: 12px;
      background: #eff6ff;
      display: flex; align-items: center; justify-content: center;
      margin: 0 auto 1rem;
      font-size: 1.4rem;
    }
    .industry-name {
      font-size: .88rem;
      font-weight: 700;
      color: #0a0a0a;
      margin-bottom: .35rem;
    }
    .industry-desc {
      font-size: .74rem;
      color: #6b7280;
      line-height: 1.6;
    }

    .service-card {
      background: #fff;
      border: 1.5px solid rgba(0,0,0,.07);
      border-radius: 12px;
      padding: 2rem 2rem 2rem;
      position: relative;
      overflow: hidden;
      transition: all .25s;
    }
    .service-card:hover {
      border-color: #2563eb;
      box-shadow: 0 12px 40px rgba(37,99,235,.12);
      transform: translateY(-3px);
    }
    .service-card-accent {
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 3px;
    }
    .service-card-num {
      font-size: 3.5rem;
      font-weight: 900;
      color: rgba(37,99,235,.08);
      line-height: 1;
      margin-bottom: .5rem;
      font-family: monospace;
    }
    .service-card-title {
      font-size: 1.1rem;
      font-weight: 800;
      color: #0a0a0a;
      margin-bottom: .6rem;
    }
    .service-card-desc {
      font-size: .83rem;
      color: #6b7280;
      line-height: 1.8;
      margin-bottom: 1rem;
    }
    .service-card-features {
      list-style: none;
      padding: 0;
      display: flex;
      flex-direction: column;
      gap: .4rem;
    }
    .service-card-features li {
      font-size: .78rem;
      color: #374151;
      display: flex;
      align-items: flex-start;
      gap: .5rem;
    }
    .service-card-features li::before {
      content: "✓";
      color: #2563eb;
      font-weight: 700;
      flex-shrink: 0;
      margin-top: .05rem;
    }

    .process-row {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 0;
      position: relative;
      max-width: 1000px;
      margin: 0 auto;
    }
    .process-row::before {
      content: '';
      position: absolute;
      top: 28px;
      left: 12.5%;
      right: 12.5%;
      height: 2px;
      background: linear-gradient(90deg, #2563eb, #3b82f6);
      z-index: 0;
    }
    .process-step-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      padding: 0 1rem;
      position: relative;
      z-index: 1;
    }
    .process-circle {
      width: 56px; height: 56px;
      border-radius: 50%;
      background: #2563eb;
      color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: .88rem;
      font-weight: 800;
      margin-bottom: 1rem;
      box-shadow: 0 4px 18px rgba(37,99,235,.35);
      flex-shrink: 0;
    }
    .process-step-title {
      font-size: .82rem;
      font-weight: 700;
      color: #0a0a0a;
      margin-bottom: .3rem;
    }
    .process-step-desc {
      font-size: .72rem;
      color: #6b7280;
      line-height: 1.6;
    }

    .value-strip {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 1.5rem;
      max-width: 1200px;
      margin: 0 auto;
    }
    .value-item {
      display: flex;
      align-items: flex-start;
      gap: 1rem;
      background: rgba(255,255,255,.05);
      border: 1px solid rgba(255,255,255,.08);
      border-radius: 10px;
      padding: 1.4rem;
    }
    .value-icon-wrap {
      width: 44px; height: 44px;
      border-radius: 10px;
      background: rgba(37,99,235,.25);
      display: flex; align-items: center; justify-content: center;
      font-size: 1.15rem;
      flex-shrink: 0;
    }
    .value-item-title {
      font-size: .88rem;
      font-weight: 700;
      color: #fff;
      margin-bottom: .3rem;
    }
    .value-item-desc {
      font-size: .76rem;
      color: rgba(255,255,255,.55);
      line-height: 1.65;
    }

    .vm-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 1.5rem;
      max-width: 1200px;
      margin: 0 auto;
    }
    .vm-card {
      background: #fff;
      border: 1.5px solid rgba(0,0,0,.07);
      border-radius: 12px;
      padding: 2rem;
      border-top: 3px solid #2563eb;
      transition: all .22s;
    }
    .vm-card:hover {
      box-shadow: 0 10px 32px rgba(37,99,235,.1);
      transform: translateY(-3px);
    }
    .vm-icon { font-size: 2.2rem; margin-bottom: 1rem; }
    .vm-title { font-size: 1rem; font-weight: 800; color: #0a0a0a; margin-bottom: .6rem; }
    .vm-body  { font-size: .82rem; color: #6b7280; line-height: 1.8; }

    @media (max-width: 900px) {
      .about-stat-strip { grid-template-columns: 1fr 1fr; }
      .process-row { grid-template-columns: 1fr 1fr; gap: 2rem; }
      .process-row::before { display: none; }
      .value-strip { grid-template-columns: 1fr; }
      .vm-grid { grid-template-columns: 1fr; }
    }
    @media (max-width: 600px) {
      .about-stat-strip { grid-template-columns: 1fr 1fr; }
      .industry-grid { grid-template-columns: 1fr 1fr; }
    }
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<!-- ══ HERO ══ -->
<div class="page-hero">
  <div class="page-hero-content container">
    <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>&#8250;</span><span>About Us</span></div>
    <span class="section-tag">About Aivirtrix</span>
    <h1 class="page-hero-title">Smarter Staffing. <em>Real Results.</em></h1>
    <p style="color:rgba(255,255,255,.58);font-size:.95rem;max-width:560px;line-height:1.75;margin-top:1rem">
      We connect the right people with the right opportunities — using AI-powered matching, deep industry expertise, and a genuine commitment to both employer and candidate success.
    </p>
  </div>
</div>

<!-- ══ STATS STRIP ══ -->
<div class="about-stat-strip">
  <div class="about-stat-item">
    <div class="about-stat-num">7+</div>
    <div class="about-stat-label">Industries Served</div>
  </div>
  <div class="about-stat-item">
    <div class="about-stat-num">AI</div>
    <div class="about-stat-label">Powered Matching</div>
  </div>
  <div class="about-stat-item">
    <div class="about-stat-num">2</div>
    <div class="about-stat-label">Portals — Employer &amp; Candidate</div>
  </div>
  <div class="about-stat-item">
    <div class="about-stat-num">24h</div>
    <div class="about-stat-label">Average Response Time</div>
  </div>
</div>

<!-- ══ SECTION 1: WHO WE ARE ══ -->
<section style="background:#fff">
  <div class="container reveal">
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:5rem;align-items:center">
      <div>
        <span class="section-tag">Who We Are</span>
        <h2 class="section-title">A Staffing Partner Built for <em>Today's Workforce</em></h2>
        <div class="divider"></div>
        <p class="section-body" style="color:#4b5563">
          Aivirtrix is an AI-powered staffing and workforce solutions company headquartered in Delaware, USA. We specialize in connecting businesses with skilled professionals across a broad spectrum of industries — from operations and healthcare to technical and leadership roles.
        </p>
        <p class="section-body" style="color:#4b5563;margin-top:1rem">
          We believe hiring should be fast, fair, and accurate. Our platform combines human expertise with intelligent technology to deliver staffing outcomes that actually work — for employers who need the right talent, and for candidates who deserve the right opportunity.
        </p>
        <div style="display:flex;gap:1rem;margin-top:2rem;flex-wrap:wrap">
          <a href="<%= ResolveUrl("~/pages/careers.aspx") %>" class="btn btn-primary">Browse Jobs</a>
          <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-outline">Work With Us</a>
        </div>
      </div>
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:1rem">
        <div class="card" style="text-align:center;padding:1.5rem">
          <div style="font-size:1.8rem;margin-bottom:.6rem">&#129504;</div>
          <div style="font-weight:700;font-size:.85rem;color:#0a0a0a;margin-bottom:.3rem">AI-Powered</div>
          <div style="font-size:.74rem;color:#6b7280">Smart candidate matching &amp; screening</div>
        </div>
        <div class="card" style="text-align:center;padding:1.5rem">
          <div style="font-size:1.8rem;margin-bottom:.6rem">&#128269;</div>
          <div style="font-weight:700;font-size:.85rem;color:#0a0a0a;margin-bottom:.3rem">Deep Vetting</div>
          <div style="font-size:.74rem;color:#6b7280">Multi-stage screening process</div>
        </div>
        <div class="card" style="text-align:center;padding:1.5rem">
          <div style="font-size:1.8rem;margin-bottom:.6rem">&#127919;</div>
          <div style="font-weight:700;font-size:.85rem;color:#0a0a0a;margin-bottom:.3rem">Role-Matched</div>
          <div style="font-size:.74rem;color:#6b7280">Precision placement, not bulk resumes</div>
        </div>
        <div class="card" style="text-align:center;padding:1.5rem">
          <div style="font-size:1.8rem;margin-bottom:.6rem">&#128101;</div>
          <div style="font-weight:700;font-size:.85rem;color:#0a0a0a;margin-bottom:.3rem">Both Sides</div>
          <div style="font-size:.74rem;color:#6b7280">Dedicated portals for employers &amp; candidates</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ══ SECTION 2: INDUSTRIES WE SERVE ══ -->
<section style="background:#f8f9fb">
  <div class="container">
    <div class="reveal" style="text-align:center;max-width:620px;margin:0 auto 3rem">
      <span class="section-tag">Industries We Serve</span>
      <h2 class="section-title">Staffing Expertise Across <em>Every Sector</em></h2>
      <div class="divider center"></div>
      <p style="font-size:.9rem;color:#6b7280;line-height:1.75">We place qualified candidates across seven core industries, bringing sector-specific knowledge to every search we run.</p>
    </div>
    <div class="industry-grid reveal">
      <div class="industry-card">
        <div class="industry-icon">&#9881;&#65039;</div>
        <div class="industry-name">Operations</div>
        <div class="industry-desc">Logistics, supply chain, production, warehousing, and facility management roles.</div>
      </div>
      <div class="industry-card">
        <div class="industry-icon">&#127981;</div>
        <div class="industry-name">Industrial</div>
        <div class="industry-desc">Manufacturing, skilled trades, maintenance technicians, and plant operations.</div>
      </div>
      <div class="industry-card">
        <div class="industry-icon">&#128101;</div>
        <div class="industry-name">Customer Service</div>
        <div class="industry-desc">Call centre, client support, account management, and CX specialist roles.</div>
      </div>
      <div class="industry-card">
        <div class="industry-icon">&#128188;</div>
        <div class="industry-name">Business Support</div>
        <div class="industry-desc">Administrative, HR, finance, data entry, and executive assistant positions.</div>
      </div>
      <div class="industry-card">
        <div class="industry-icon">&#128187;</div>
        <div class="industry-name">Technical</div>
        <div class="industry-desc">IT, software engineering, data analytics, systems administration, and QA.</div>
      </div>
      <div class="industry-card">
        <div class="industry-icon">&#129657;</div>
        <div class="industry-name">Healthcare</div>
        <div class="industry-desc">Clinical staff, allied health, medical administration, and support roles.</div>
      </div>
      <div class="industry-card">
        <div class="industry-icon">&#127775;</div>
        <div class="industry-name">Leadership</div>
        <div class="industry-desc">Executive search, senior management, directors, and C-suite placements.</div>
      </div>
    </div>
  </div>
</section>

<!-- ══ SECTION 3: OUR SERVICES ══ -->
<section style="background:#fff">
  <div class="container">
    <div class="reveal" style="text-align:center;max-width:620px;margin:0 auto 3rem">
      <span class="section-tag">Our Services</span>
      <h2 class="section-title">Solutions for <em>Employers &amp; Job Seekers</em></h2>
      <div class="divider center"></div>
    </div>
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:2rem;max-width:1200px;margin:0 auto" class="reveal">

      <!-- For Employers -->
      <div class="service-card">
        <div class="service-card-accent" style="background:linear-gradient(90deg,#2563eb,#3b82f6)"></div>
        <div class="service-card-num">01</div>
        <div class="service-card-title">For Employers</div>
        <div class="service-card-desc">
          From a single hire to large-scale workforce deployment, Aivirtrix delivers talent solutions that match your speed, budget, and culture. Post jobs, review applicants, shortlist candidates, and communicate — all from your employer dashboard.
        </div>
        <ul class="service-card-features">
          <li>Permanent &amp; contract staffing placements</li>
          <li>Bulk hiring for high-volume roles</li>
          <li>AI-screened, pre-vetted candidate shortlists</li>
          <li>Dedicated employer portal with real-time updates</li>
          <li>Direct messaging with shortlisted candidates</li>
          <li>Job expiry tracking and application analytics</li>
        </ul>
        <div style="margin-top:1.4rem">
          <a href="<%= ResolveUrl("~/pages/employer-login.aspx") %>" class="btn btn-primary" style="font-size:.78rem;padding:.65rem 1.4rem">Post a Job &#8594;</a>
        </div>
      </div>

      <!-- For Job Seekers -->
      <div class="service-card">
        <div class="service-card-accent" style="background:linear-gradient(90deg,#0a0a0a,#374151)"></div>
        <div class="service-card-num">02</div>
        <div class="service-card-title">For Job Seekers</div>
        <div class="service-card-desc">
          Your career journey deserves more than a job board. Aivirtrix gives you access to live opportunities matched to your skills, a personal candidate portal to track every application, and direct communication from employers — in real time.
        </div>
        <ul class="service-card-features">
          <li>Browse and apply for active job listings</li>
          <li>Apply as a guest or create a full candidate profile</li>
          <li>Upload your resume directly with your application</li>
          <li>Real-time application status tracking</li>
          <li>Direct messages from employers via your dashboard</li>
          <li>Career support and interview guidance</li>
        </ul>
        <div style="margin-top:1.4rem">
          <a href="<%= ResolveUrl("~/pages/careers.aspx") %>" class="btn btn-outline" style="font-size:.78rem;padding:.65rem 1.4rem">Browse Jobs &#8594;</a>
        </div>
      </div>

    </div>
  </div>
</section>

<!-- ══ SECTION 4: HOW IT WORKS ══ -->
<section style="background:#f8f9fb">
  <div class="container">
    <div class="reveal" style="text-align:center;max-width:600px;margin:0 auto 3.5rem">
      <span class="section-tag">How It Works</span>
      <h2 class="section-title">From Requirement to <em>Placement</em></h2>
      <div class="divider center"></div>
      <p style="font-size:.88rem;color:#6b7280;line-height:1.75">Our streamlined four-step process ensures the right match — quickly and transparently.</p>
    </div>
    <div class="process-row reveal">
      <div class="process-step-item">
        <div class="process-circle">01</div>
        <div class="process-step-title">Post the Role</div>
        <div class="process-step-desc">Employers post job details including requirements, skills, and deadline via the dashboard.</div>
      </div>
      <div class="process-step-item">
        <div class="process-circle">02</div>
        <div class="process-step-title">AI Screening</div>
        <div class="process-step-desc">Our system surfaces the best-matched candidates from applications and the talent pool.</div>
      </div>
      <div class="process-step-item">
        <div class="process-circle">03</div>
        <div class="process-step-title">Review &amp; Shortlist</div>
        <div class="process-step-desc">Employers review full profiles, resumes, and communicate directly with shortlisted candidates.</div>
      </div>
      <div class="process-step-item">
        <div class="process-circle">04</div>
        <div class="process-step-title">Hire &amp; Onboard</div>
        <div class="process-step-desc">Confirm your hire, share next steps, and we support the transition for a smooth onboarding.</div>
      </div>
    </div>
  </div>
</section>

<!-- ══ SECTION 5: VISION MISSION VALUES ══ -->
<section style="background:#111318">
  <div class="container">
    <div class="reveal" style="text-align:center;max-width:600px;margin:0 auto 3rem">
      <span class="section-tag" style="color:#3b82f6">Our Foundation</span>
      <h2 class="section-title" style="color:#fff">Vision, Mission <em style="color:#3b82f6">&amp; Values</em></h2>
      <div class="divider center" style="background:linear-gradient(90deg,#3b82f6,transparent)"></div>
    </div>

    <!-- Vision / Mission / Approach -->
    <div class="vm-grid reveal" style="margin-bottom:3rem">
      <div class="vm-card">
        <div class="vm-icon">&#127919;</div>
        <div class="vm-title">Our Vision</div>
        <div class="vm-body">To be the most trusted AI-powered staffing platform — where every employer finds the talent they need, and every job seeker finds work that fits their life. We envision a workforce ecosystem built on transparency, fairness, and technology.</div>
      </div>
      <div class="vm-card">
        <div class="vm-icon">&#128640;</div>
        <div class="vm-title">Our Mission</div>
        <div class="vm-body">To simplify and accelerate hiring through intelligent tools, genuine human expertise, and a dual-sided platform that puts both employers and candidates at the centre. We measure success not by placements made, but by outcomes achieved.</div>
      </div>
      <div class="vm-card">
        <div class="vm-icon">&#128161;</div>
        <div class="vm-title">Our Approach</div>
        <div class="vm-body">We combine AI-driven efficiency with relationship-first service. Every role we fill is backed by sector knowledge, honest communication, and a commitment to getting it right the first time — no filler, no bulk resumes, no guesswork.</div>
      </div>
    </div>

    <!-- Values grid -->
    <div class="value-strip reveal">
      <div class="value-item">
        <div class="value-icon-wrap">&#129305;</div>
        <div>
          <div class="value-item-title">Integrity First</div>
          <div class="value-item-desc">We are honest with both employers and candidates. No false promises, no hidden fees, no inflated expectations.</div>
        </div>
      </div>
      <div class="value-item">
        <div class="value-icon-wrap">&#9889;</div>
        <div>
          <div class="value-item-title">Speed &amp; Precision</div>
          <div class="value-item-desc">Hiring delays cost everyone. We act fast without cutting corners — because time-to-hire matters as much as quality of hire.</div>
        </div>
      </div>
      <div class="value-item">
        <div class="value-icon-wrap">&#9878;&#65039;</div>
        <div>
          <div class="value-item-title">Inclusive Hiring</div>
          <div class="value-item-desc">Our AI is designed to reduce bias. We believe the best candidate for a role should always win it — regardless of background.</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ══ SECTION 6: CTA ══ -->
<section style="background:#fff;text-align:center">
  <div class="container reveal" style="max-width:640px">
    <span class="section-tag">Get Started</span>
    <h2 class="section-title">Ready to Find the <em>Right Fit?</em></h2>
    <div class="divider center"></div>
    <p style="font-size:.95rem;color:#6b7280;line-height:1.85;margin-bottom:2.5rem">
      Whether you are an employer looking to fill a critical role or a professional looking for your next move — Aivirtrix is built for you. Start today, it takes less than two minutes.
    </p>
    <div style="display:flex;gap:1rem;justify-content:center;flex-wrap:wrap">
      <a href="<%= ResolveUrl("~/pages/employer-login.aspx") %>" class="btn btn-primary">Post a Job</a>
      <a href="<%= ResolveUrl("~/pages/careers.aspx") %>" class="btn btn-outline">Browse Opportunities</a>
    </div>
  </div>
</section>
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent"   runat="server">
<button id="backToTop" style="position:fixed;bottom:2rem;right:2rem;background:#2563eb;color:#fff;border:none;width:44px;height:44px;border-radius:50%;font-size:1.2rem;cursor:pointer;opacity:0;transition:opacity .3s;z-index:999;box-shadow:0 4px 16px rgba(37,99,235,.4)">&#8679;</button>
<script src="<%= ResolveUrl("~/js/main.js"></script>
<script src="<%= ResolveUrl("~/js/vpstore.js"></script>
<script src="<%= ResolveUrl("~/js/portal-widget.js"></script>
</asp:Content>