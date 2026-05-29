<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="careers.aspx.cs" Inherits="Pages_careers" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Careers &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Find your next opportunity — Aivirtrix Careers</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server">
  <link rel="stylesheet" href="<%= ResolveUrl(\"~/css/careers.css\") %>"/>
  <style>
@keyframes spin { to { transform: rotate(360deg); } }
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<!-- AI BANNER (below navbar) -->
<div class="ai-banner">
  <div class="ai-banner-inner">
    <span class="ai-banner-badge"><span class="ai-banner-badge-dot"></span>AI-Powered</span>
    <span class="ai-banner-text">
      <strong>Aivirtrix uses AI</strong> to intelligently match candidates with the right roles &#8212; smart screening, bias-free shortlisting, and real-time hiring insights for every position.
    </span>
    <a href="<%= ResolveUrl("~/pages/about.aspx") %>" class="ai-banner-link">Learn how it works &#8594;</a>
  </div>
</div>

<!-- HERO -->
<div class="cr-hero">
  <div class="cr-hero-inner">
    <div class="cr-breadcrumb">
      <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>&#8250;</span><span>Careers</span>
    </div>
    <h1 class="cr-hero-title">Find Your Next <em>Opportunity</em></h1>
    <p class="cr-hero-sub">Aivirtrix connects top talent with forward-thinking employers using AI-driven matching. Apply directly, track your status in real time, and get hired faster.</p>
    <div class="cr-hero-stats">
      <div><div class="cr-stat-num" id="cr-stat-jobs">0</div><div class="cr-stat-lbl">Active Roles</div></div>
      <div><div class="cr-stat-num">AI</div><div class="cr-stat-lbl">Smart Matching</div></div>
      <div><div class="cr-stat-num">24h</div><div class="cr-stat-lbl">Avg Response</div></div>
    </div>
  </div>
</div>

<!-- SEARCH BAR (sticky below navbar+banner) -->
<div class="cr-search-wrap">
  <div class="cr-search-inner">
    <div class="cr-search-row">
      <div class="cr-search-field">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
        <input class="cr-input" id="cr-kw" type="text" placeholder="Keywords &#8212; role, skill, department..."/>
      </div>
      <div class="cr-search-field">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/></svg>
        <input class="cr-input" id="cr-title" type="text" placeholder="Job title..."/>
      </div>
      <div class="cr-search-field">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
        <input class="cr-input" id="cr-skills" type="text" placeholder="Skills &#8212; e.g. Excel, Python..."/>
      </div>
      <button class="cr-search-btn" onclick="applyFilters()">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
        Search
      </button>
      <button class="cr-filter-toggle" id="cr-filter-toggle">
        <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg>
        <span class="cr-ft-label">Advanced Filters</span>
      </button>
    </div>

    <!-- Advanced filters row -->
    <div class="cr-filter-row" id="cr-filter-row">
      <select class="cr-select" id="cr-dept">
        <option value="">All Departments</option>
        <option>Operations</option><option>Quality Control</option>
        <option>Sales &amp; Export</option><option>Manufacturing</option>
        <option>Logistics</option><option>HR</option>
        <option>Finance</option><option>IT</option><option>General</option>
      </select>
      <select class="cr-select" id="cr-exp">
        <option value="">Any Experience</option>
        <option value="0-1">0-1 Years (Fresher)</option>
        <option value="1-3">1-3 Years</option>
        <option value="3-5">3-5 Years</option>
        <option value="5+">5+ Years (Senior)</option>
      </select>
      <select class="cr-select" id="cr-type">
        <option value="">All Job Types</option>
        <option>Full-time</option><option>Part-time</option>
        <option>Contract</option><option>Internship</option>
      </select>
      <select class="cr-select" id="cr-mode">
        <option value="">All Work Modes</option>
        <option>On-site</option><option>Hybrid</option><option>Remote</option>
      </select>
      <button class="cr-clear-btn" onclick="clearSearch()">&#x2715; Clear All</button>
    </div>

    <!-- Meta row -->
    <div class="cr-search-meta">
      <div>Showing <strong id="cr-job-count">0 jobs</strong></div>
      <div style="display:flex;align-items:center;gap:.8rem;flex-wrap:wrap">
        <div class="cr-active-filters" id="cr-active-filters"></div>
        <div class="cr-sort">Sort: <select onchange="sortJobs(this.value)"><option value="newest">Newest First</option><option value="deadline">Closing Soon</option></select></div>
      </div>
    </div>
  </div>
</div>

<!-- MAIN CONTENT -->
<div class="cr-main">
  <div class="cr-main-inner" id="cr-main-layout">

    <!-- Jobs List -->
    <div class="cr-jobs-col">
      <div class="cr-jobs-header">
        <div class="cr-jobs-title">Active Jobs</div>
        <span class="cr-jobs-count" id="cr-jobs-badge">0</span>
      </div>
      <div id="cr-jobs-list">
        <div class="cr-empty">
          <div class="cr-empty-icon">&#8987;</div>
          <div class="cr-empty-title">Loading jobs...</div>
        </div>
      </div>
    </div>

    <!-- Application Panel (slides in on Apply click) -->
    <div class="cr-apply-panel" id="cr-apply-panel">

      <!-- Panel Header -->
      <div class="cr-panel-head">
        <div>
          <div class="cr-panel-title">Application Form</div>
          <div class="cr-panel-job">
            <span id="cr-panel-job-name">-</span>
            <span style="opacity:.6;margin:0 .3rem">&middot;</span>
            <span id="cr-panel-dept" style="opacity:.7"></span>
          </div>
        </div>
        <button class="cr-panel-close" onclick="closePanel()" aria-label="Close">&#x2715;</button>
      </div>

      <!-- Panel Body -->
      <div class="cr-panel-body">

        <!-- Sign In & Apply banner -->
        <div class="cr-signin-banner">
          <div class="cr-signin-banner-icon">&#9889;</div>
          <div class="cr-signin-banner-text">
            <div class="cr-signin-banner-title">Apply faster with your profile</div>
            <div class="cr-signin-banner-sub">Sign in to auto-fill your details and track status in real time</div>
          </div>
          <a href="<%= ResolveUrl("~/pages/candidate-login.aspx") %>" class="cr-signin-btn">Sign In &amp; Apply</a>
        </div>

        <!-- Success state -->
        <div class="cr-success-state" id="cr-success-state">
          <div class="cr-success-icon">&#127881;</div>
          <div class="cr-success-title">Application Submitted!</div>
          <div class="cr-success-text">Your application has been received. The hiring team will review it shortly.<br/><br/>Sign in to your candidate portal to track your application status in real time.</div>
          <a href="<%= ResolveUrl("~/pages/candidate-login.aspx") %>" class="cr-btn cr-btn-primary" style="display:inline-flex;margin:.5rem auto 0">Go to Candidate Portal &#8594;</a>
        </div>

        <!-- Application Form -->
        <div id="cr-form-content">
          <form id="cr-apply-form" onsubmit="submitApplication(event)" autocomplete="on">

            <div class="cr-form-divider">Personal Details</div>

            <div class="cr-fg">
              <label class="cr-label" for="cr-f-name">Full Name <span>*</span></label>
              <input class="cr-field" id="cr-f-name" type="text" placeholder="e.g. John Smith" required autocomplete="name"/>
            </div>

            <div style="display:grid;grid-template-columns:1fr 1fr;gap:.7rem">
              <div class="cr-fg">
                <label class="cr-label" for="cr-f-email">Email Address <span>*</span></label>
                <input class="cr-field" id="cr-f-email" type="email" placeholder="you@example.com" required autocomplete="email"/>
              </div>
              <div class="cr-fg">
                <label class="cr-label" for="cr-f-phone">Phone Number</label>
                <input class="cr-field" id="cr-f-phone" type="tel" placeholder="+1 XXX XXX XXXX" autocomplete="tel"/>
              </div>
            </div>

            <div class="cr-form-divider">Professional Details</div>

            <div class="cr-fg">
              <label class="cr-label">Skills</label>
              <div class="cr-skill-input-wrap" id="cr-skill-wrap" onclick="document.getElementById('cr-skill-raw').focus()">
                <input class="cr-skill-raw-input" id="cr-skill-raw" type="text" placeholder="Type a skill and press Enter..." onkeydown="skillKeydown(event)"/>
              </div>
              <div class="cr-field-hint">Press Enter or comma to add each skill</div>
            </div>

            <div class="cr-fg">
              <label class="cr-label" for="cr-f-exp">Total Experience</label>
              <input class="cr-field" id="cr-f-exp" type="text" placeholder="e.g. 3 years, Fresher, 5+ years"/>
            </div>

            <div class="cr-fg">
              <label class="cr-label" for="cr-f-edu">Highest Education</label>
              <input class="cr-field" id="cr-f-edu" type="text" placeholder="e.g. B.Tech Computer Science, MBA Finance"/>
            </div>

            <div class="cr-fg">
              <label class="cr-label" for="cr-f-cover">Cover Note</label>
              <textarea class="cr-field" id="cr-f-cover" rows="3" placeholder="Brief note about why you are a great fit for this role..."></textarea>
            </div>

            <div class="cr-form-divider">Resume / CV</div>

            <div class="cr-fg">
              <div class="cr-upload-zone" id="cr-upload-zone">
                <input type="file" id="cr-resume-input" accept=".pdf,.doc,.docx" onchange="handleFileChange(this)"/>
                <div class="cr-upload-icon">&#128196;</div>
                <div class="cr-upload-text"><strong>Click to upload</strong> or drag &amp; drop your resume</div>
                <div class="cr-upload-accepted">PDF, DOC, DOCX &#8212; max 5MB</div>
              </div>
              <div class="cr-upload-preview" id="cr-upload-preview">
                <span style="font-size:1.1rem">&#128196;</span>
                <span class="cr-upload-preview-name"></span>
                <button type="button" class="cr-upload-remove" onclick="removeUpload()">&#x2715;</button>
              </div>
            </div>

          </form>
        </div>
      </div>

      <!-- Panel Footer -->
      <div class="cr-panel-footer" id="cr-panel-footer">
        <button class="cr-submit-btn" id="cr-submit-btn" onclick="submitApplication(event)">
          <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
          Submit Application
        </button>
        <div class="cr-submit-note">Your data is secure &middot; Privacy Policy applies</div>
      </div>

    </div><!-- /cr-apply-panel -->
  </div><!-- /cr-main-inner -->
</div><!-- /cr-main -->
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent"   runat="server">
<button id="backToTop" style="position:fixed;bottom:2rem;right:2rem;background:#2563eb;color:#fff;border:none;width:44px;height:44px;border-radius:50%;font-size:1.2rem;cursor:pointer;opacity:0;transition:opacity .3s;z-index:999;box-shadow:0 4px 16px rgba(37,99,235,.4)">&#8679;</button>
<script src="<%= ResolveUrl("~/js/main.js"></script>
<script src="<%= ResolveUrl("~/js/vpstore.js"></script>
<script src="<%= ResolveUrl("~/js/portal-widget.js"></script>
</asp:Content>