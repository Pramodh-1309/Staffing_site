<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SiteFooter.ascx.cs" Inherits="Controls_SiteFooter" %>
<footer class="site-footer">
  <div class="sf-top"><div class="sf-inner">
    <div class="sf-brand-col">
      <a class="sf-logo" href="<%= ResolveUrl("~/Default.aspx") %>">
        <img src="<%= ResolveUrl("~/images/AivirtrixWB.png") %>" alt="Aivirtrix" class="sf-logo-img" style="filter:invert(1)"/>
      </a>
      <p class="sf-tagline">AI-powered staffing and workforce solutions &mdash; connecting employers and job seekers across every industry, anywhere in the world.</p>
      <div class="sf-social">
        <a href="#" target="_blank" rel="noopener" aria-label="LinkedIn" class="sf-social-link">
          <svg viewBox="0 0 24 24" fill="currentColor"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
        </a>
      </div>
      <div class="sf-contact">
        <a href="mailto:info@aivirtrix.com" class="sf-contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="4" width="20" height="16" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
          <span>info@aivirtrix.com</span>
        </a>
        <a href="tel:+18000000000" class="sf-contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 13a19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 3.56 2h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 9.91a16 16 0 0 0 6 6l.9-.9a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
          <span>+1-800-000-0000</span>
        </a>
        <div class="sf-contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 10c0 6-8 12-8 12s-8-6-8-12a8 8 0 0 1 16 0Z"/><circle cx="12" cy="10" r="3"/></svg>
          <span>Delaware, USA</span>
        </div>
      </div>
    </div>

    <div class="sf-col">
      <div class="sf-col-title">Quick Links</div>
      <ul class="sf-links">
        <li><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a></li>
        <li><a href="<%= ResolveUrl("~/pages/about.aspx") %>">About Us</a></li>
        <li><a href="<%= ResolveUrl("~/pages/services.aspx") %>">Our Services</a></li>
        <li><a href="<%= ResolveUrl("~/pages/operations.aspx") %>">Industries We Serve</a></li>
        <li><a href="<%= ResolveUrl("~/pages/careers.aspx") %>">Careers</a></li>
        <li><a href="<%= ResolveUrl("~/pages/contact.aspx") %>">Contact Us</a></li>
      </ul>
    </div>

    <div class="sf-col">
      <div class="sf-col-title">Industries</div>
      <ul class="sf-links">
        <li><a href="<%= ResolveUrl("~/pages/technical-support.aspx") %>">Technology &amp; IT</a></li>
        <li><a href="<%= ResolveUrl("~/pages/healthcare.aspx") %>">Healthcare</a></li>
        <li><a href="<%= ResolveUrl("~/pages/industrial.aspx") %>">Light Industrial</a></li>
        <li><a href="<%= ResolveUrl("~/pages/operations.aspx") %>">Engineering &amp; Ops</a></li>
        <li><a href="<%= ResolveUrl("~/pages/business-support.aspx") %>">Corporate Services</a></li>
        <li><a href="<%= ResolveUrl("~/pages/customer-service.aspx") %>">Customer Service</a></li>
        <li><a href="<%= ResolveUrl("~/pages/leadership.aspx") %>">Leadership</a></li>
      </ul>
    </div>

    <div class="sf-col">
      <div class="sf-col-title">For Candidates</div>
      <ul class="sf-links" style="margin-bottom:1.8rem">
        <li><a href="<%= ResolveUrl("~/pages/careers.aspx") %>">Browse Jobs</a></li>
        <li><a href="<%= ResolveUrl("~/pages/candidate-login.aspx") %>">Submit Resume</a></li>
      </ul>
      <div class="sf-col-title">For Employers</div>
      <ul class="sf-links">
        <li><a href="<%= ResolveUrl("~/pages/employer-login.aspx") %>">Hire Talent</a></li>
        <li><a href="<%= ResolveUrl("~/pages/contact.aspx") %>">Hiring Process</a></li>
      </ul>
    </div>

    <div class="sf-col">
      <div class="sf-col-title">Newsletter</div>
      <p class="sf-newsletter-sub">Stay updated with the latest job openings and hiring insights.</p>
      <form class="sf-newsletter-form" onsubmit="sfSubscribe(event)">
        <input type="email" class="sf-newsletter-input" placeholder="Enter your email" required/>
        <button type="submit" class="sf-newsletter-btn">Subscribe</button>
      </form>
    </div>

  </div></div>
  <div class="sf-bottom"><div class="sf-bottom-inner">
    <div class="sf-copy">&copy; <%= DateTime.Now.Year %> Aivirtrix. All rights reserved.</div>
    <div class="sf-legal">
      <a href="#" onclick="openLegalModal('privacy');return false;">Privacy Policy</a>
      <span class="sf-legal-sep">&middot;</span>
      <a href="#" onclick="openLegalModal('terms');return false;">Terms &amp; Conditions</a>
    </div>
    <div class="sf-bottom-web">info@aivirtrix.com</div>
  </div></div>
</footer>