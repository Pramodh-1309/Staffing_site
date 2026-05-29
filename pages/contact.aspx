<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="Pages_contact" %>

<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Contact Us &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Contact Aivirtrix — business enquiries, staffing solutions</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server">

  <style>
.contact-grid{display:grid;grid-template-columns:1fr 1.4fr;gap:5rem;align-items:start;max-width:1200px;margin:0 auto}
    .form-row{display:grid;grid-template-columns:1fr 1fr;gap:1.2rem;margin-bottom:1.2rem}
    .form-group{display:flex;flex-direction:column;gap:.45rem;margin-bottom:1.2rem}
    .form-group label{font-size:.77rem;font-weight:700;letter-spacing:.06em;text-transform:uppercase;color:#374151}
    .form-group input,.form-group select,.form-group textarea{width:100%;padding:.8rem 1rem;border:1.5px solid rgba(0,0,0,.1);border-radius:4px;font-size:.9rem;font-family:'Poppins',sans-serif;color:#0a0a0a;background:#fff;transition:border-color .25s,box-shadow .25s}
    .form-group input:focus,.form-group select:focus,.form-group textarea:focus{border-color:#2563eb;box-shadow:0 0 0 3px rgba(37,99,235,.1);outline:none}
    .form-group textarea{resize:vertical;min-height:130px}
    .info-card{background:#f8f9fb;border:1px solid rgba(0,0,0,.08);border-radius:8px;padding:1.5rem;display:flex;align-items:flex-start;gap:1rem;margin-bottom:1rem;transition:border-color .25s}
    .info-card:hover{border-color:rgba(37,99,235,.28)}
    .info-icon{font-size:1.6rem;flex-shrink:0}
    .info-title{font-weight:700;font-size:.85rem;color:#0a0a0a;margin-bottom:.2rem}
    .info-value{font-size:.83rem;color:#6b7280;line-height:1.7}
    .info-value a{color:#2563eb;text-decoration:none}
    .info-value a:hover{text-decoration:underline}
  </style>
</asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">
<div class="page-hero">
    <div class="page-hero-content container">
      <div class="breadcrumb"><a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a><span>›</span><span>Contact Us</span></div>
      <span class="section-tag">Contact Us</span>
      <h1 class="page-hero-title">Start a <em>Conversation</em> With Us</h1>
    </div>
  </div>

  <section style="background:#fff">
    <div class="contact-grid">
      <!-- Info Side -->
      <div class="reveal">
        <span class="section-tag">Get In Touch</span>
        <h2 class="section-title">Let's Discuss Your <em>Requirements</em></h2>
        <div class="divider"></div>
        <p style="font-size:.93rem;color:#4b5563;line-height:1.85;margin-bottom:2rem">Looking to build a strong and reliable workforce? Aivirtrix connects you with pre-screened, skilled professionals across multiple industries. Whether you need permanent hires, contract staffing, or bulk recruitment solutions, our team ensures fast and efficient hiring tailored to your business goals.</p>
        <div class="info-card">
          <div class="info-icon">✉️</div>
          <div><div class="info-title">General Enquiries</div><div class="info-value"><a href="mailto:info@aivirtrix.com">info@aivirtrix.com</a></div></div>
        </div>
        
        <div class="info-card">
          <div class="info-icon">📞</div>
          <div><div class="info-title">Phone</div><div class="info-value"><a href="tel:+91XXXXXXXXXX">+1-800-000-0000</a></div></div>
        </div>
        <div class="info-card">
          <div class="info-icon">📍</div>
          <div><div class="info-title">Headquarters</div><div class="info-value">Delaware, USA</div></div>
        </div>
        <div style="margin-top:2rem;padding:1.5rem;background:linear-gradient(135deg,#eff6ff,#dbeafe);border-radius:8px;border:1px solid rgba(37,99,235,.15)">
          <div style="font-weight:700;font-size:.85rem;color:#1d4ed8;margin-bottom:.5rem">Response Commitment</div>
          <p style="font-size:.8rem;color:#4b5563;line-height:1.75">We respond to all business enquiries within 1–2 business days. For urgent matters, please mention in the subject line.</p>
        </div>
      </div>
      <!-- Form Side -->
      <div class="reveal" style="transition-delay:.15s">
        <div style="background:#f8f9fb;border:1px solid rgba(0,0,0,.08);border-radius:10px;padding:3rem">
          <div style="font-family:'Poppins',sans-serif;font-size:1.3rem;font-weight:700;color:#0a0a0a;margin-bottom:1.8rem">Send Us a Message</div>
          <form id="contactForm" onsubmit="submitForm(event)">
            <div class="form-row">
              <div class="form-group"><label>Full Name *</label><input type="text" placeholder="Your full name" required/></div>
              <div class="form-group"><label>Company / Organisation</label><input type="text" placeholder="Company name"/></div>
            </div>
            <div class="form-row">
              <div class="form-group"><label>Email Address *</label><input type="email" placeholder="your@email.com" required/></div>
              <div class="form-group"><label>Phone Number</label><input type="tel" placeholder="+91 XXXXX XXXXX"/></div>
            </div>
            <div class="form-group"><label>Enquiry Type *</label>
              <select required>
                <option value="">Select enquiry type</option>
                <option>Hiring / Talent Acquisition</option>
                <option>Contract Staffing</option>
                <option>Permanent Placement</option>
                <option>RPO Solutions</option>
                <option>Career / Job Enquiry</option>
                <option>Partnership</option>
                <option>General Information</option>
              </select>
            </div>
            <div class="form-group"><label>Industry of Interest</label>
              <select>
                <option value="">Select product category</option>
                <option>Rice</option><option>Pulses</option><option>Spices</option>
                <option>Flour</option><option>Edible Oils</option><option>Multiple Products</option>
              </select>
            </div>
            <div class="form-group"><label>Your Message *</label><textarea placeholder="Tell us about your requirements — quantities, packaging preferences, target markets, or any questions..." required></textarea></div>
            <button type="submit" class="btn btn-primary" style="width:100%;font-size:.85rem">Send Enquiry →</button>
          </form>
          <div id="formSuccess" style="display:none;text-align:center;padding:2rem;background:#eff6ff;border-radius:6px;border:1px solid rgba(37,99,235,.2)">
            <div style="font-size:2.5rem;margin-bottom:.8rem">✅</div>
            <div style="font-weight:700;color:#1d4ed8;margin-bottom:.4rem">Message Sent!</div>
            <div style="font-size:.85rem;color:#4b5563">Thank you. We will respond within 1–2 business days.</div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- WHAT TO EXPECT — Light Gray -->
  <section style="background:#f8f9fb">
    <div class="container">
      <div class="reveal" style="text-align:center;max-width:560px;margin:0 auto 3rem">
        <span class="section-tag">How We Work</span>
        <h2 class="section-title">What Happens After You Enquire</h2>
        <div class="divider center"></div>
      </div>
      <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:1.5rem;max-width:1200px;margin:0 auto">
        <div class="card reveal" style="text-align:center"><div style="width:40px;height:40px;background:#2563eb;border-radius:50%;color:#fff;font-weight:700;font-size:.9rem;display:flex;align-items:center;justify-content:center;margin:0 auto .8rem">1</div><div style="font-weight:700;margin-bottom:.4rem;color:#0a0a0a">We Review</div><div style="font-size:.8rem;color:#6b7280">Your enquiry is reviewed by our team and assigned to the right person.</div></div>
        <div class="card reveal" style="text-align:center;transition-delay:.08s"><div style="width:40px;height:40px;background:#0a0a0a;border-radius:50%;color:#fff;font-weight:700;font-size:.9rem;display:flex;align-items:center;justify-content:center;margin:0 auto .8rem">2</div><div style="font-weight:700;margin-bottom:.4rem;color:#0a0a0a">Initial Response</div><div style="font-size:.8rem;color:#6b7280">We respond within 1–2 business days with answers or clarifying questions.</div></div>
        <div class="card reveal" style="text-align:center;transition-delay:.16s"><div style="width:40px;height:40px;background:#2563eb;border-radius:50%;color:#fff;font-weight:700;font-size:.9rem;display:flex;align-items:center;justify-content:center;margin:0 auto .8rem">3</div><div style="font-weight:700;margin-bottom:.4rem;color:#0a0a0a">Screening & Shortlisting</div><div style="font-size:.8rem;color:#6b7280">We conduct detailed screening including skill evaluation, experience validation, and role alignment to ensure only the most suitable candidates are shortlisted.</div></div>
        <div class="card reveal" style="text-align:center;transition-delay:.24s"><div style="width:40px;height:40px;background:#0a0a0a;border-radius:50%;color:#fff;font-weight:700;font-size:.9rem;display:flex;align-items:center;justify-content:center;margin:0 auto .8rem">4</div><div style="font-weight:700;margin-bottom:.4rem;color:#0a0a0a">Interview Coordination</div><div style="font-size:.8rem;color:#6b7280">Our team schedules and manages interviews, coordinates feedback, and ensures smooth communication between you and the candidates throughout the hiring process.</div></div>
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