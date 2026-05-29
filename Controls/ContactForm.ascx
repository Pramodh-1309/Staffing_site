<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<asp:Panel ID="pnlForm" runat="server">
  <asp:ValidationSummary ID="valSummary" runat="server" CssClass="form-validation-summary" DisplayMode="BulletList" ShowSummary="true" ShowMessageBox="false"/>
  <div class="form-row">
    <div class="form-group">
      <label>Full Name *</label>
      <asp:TextBox ID="txtName" runat="server" CssClass="fg-input" placeholder="Your full name"/>
      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Full name is required." Display="None"/>
    </div>
    <div class="form-group">
      <label>Company / Organisation</label>
      <asp:TextBox ID="txtCompany" runat="server" CssClass="fg-input" placeholder="Company name"/>
    </div>
  </div>
  <div class="form-row">
    <div class="form-group">
      <label>Email Address *</label>
      <asp:TextBox ID="txtEmail" runat="server" CssClass="fg-input" placeholder="your@email.com" TextMode="Email"/>
      <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Email address is required." Display="None"/>
      <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email." Display="None"/>
    </div>
    <div class="form-group">
      <label>Phone Number</label>
      <asp:TextBox ID="txtPhone" runat="server" CssClass="fg-input" placeholder="+1 XXX XXX XXXX" TextMode="Phone"/>
    </div>
  </div>
  <div class="form-group">
    <label>Enquiry Type *</label>
    <asp:DropDownList ID="ddlEnquiry" runat="server" CssClass="fg-select">
      <asp:ListItem Value="">Select enquiry type</asp:ListItem>
      <asp:ListItem>Hiring / Talent Acquisition</asp:ListItem>
      <asp:ListItem>Contract Staffing</asp:ListItem>
      <asp:ListItem>Permanent Placement</asp:ListItem>
      <asp:ListItem>RPO Solutions</asp:ListItem>
      <asp:ListItem>Career / Job Enquiry</asp:ListItem>
      <asp:ListItem>Partnership</asp:ListItem>
      <asp:ListItem>General Information</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlEnquiry" ErrorMessage="Please select an enquiry type." Display="None"/>
  </div>
  <div class="form-group">
    <label>Industry of Interest</label>
    <asp:DropDownList ID="ddlIndustry" runat="server" CssClass="fg-select">
      <asp:ListItem Value="">Select industry</asp:ListItem>
      <asp:ListItem>Technology &amp; IT</asp:ListItem>
      <asp:ListItem>Healthcare</asp:ListItem>
      <asp:ListItem>Light Industrial</asp:ListItem>
      <asp:ListItem>Engineering &amp; Ops</asp:ListItem>
      <asp:ListItem>Corporate Services</asp:ListItem>
      <asp:ListItem>Customer Service</asp:ListItem>
      <asp:ListItem>Leadership</asp:ListItem>
      <asp:ListItem>Multiple Industries</asp:ListItem>
    </asp:DropDownList>
  </div>
  <div class="form-group">
    <label>Your Message *</label>
    <asp:TextBox ID="txtMessage" runat="server" CssClass="fg-input" TextMode="MultiLine" Rows="5" placeholder="Tell us about your requirements..."/>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMessage" ErrorMessage="Message is required." Display="None"/>
  </div>
  <asp:Button ID="btnSubmit" runat="server" Text="Send Enquiry &rarr;" CssClass="btn btn-primary" OnClick="btnSubmit_Click" style="width:100%"/>
</asp:Panel>
<asp:Panel ID="pnlSuccess" runat="server" Visible="false" style="text-align:center;padding:2rem;background:#eff6ff;border-radius:6px;border:1px solid rgba(37,99,235,.2)">
  <div style="font-size:2.5rem;margin-bottom:.8rem">&#9989;</div>
  <div style="font-weight:700;color:#1d4ed8;margin-bottom:.4rem">Message Sent!</div>
  <div style="font-size:.85rem;color:#4b5563">Thank you. We will respond within 1&ndash;2 business days.</div>
</asp:Panel>