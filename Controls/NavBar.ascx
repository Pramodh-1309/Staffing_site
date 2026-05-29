<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavBar.ascx.cs" Inherits="Controls_NavBar" %>
<nav id="navbar">
  <a class="nav-logo" href="<%= ResolveUrl("~/Default.aspx") %>">
    <img src="<%= ResolveUrl("~/images/AivirtrixWB.png") %>" alt="Aivirtrix" class="nav-logo-img"/>
  </a>
  <ul class="nav-links">
    <li><a href="<%= ResolveUrl("~/Default.aspx") %>"<%=IsActive("home")%>>Home</a></li>
    <li><a href="<%= ResolveUrl("~/pages/about.aspx") %>"<%=IsActive("about")%>>About Us</a></li>
    <li><a href="<%= ResolveUrl("~/pages/services.aspx") %>"<%=IsActive("services")%>>Services</a></li>
    <li class="has-dropdown">
      <a href="<%= ResolveUrl("~/pages/operations.aspx") %>"<%=IsActive("industries")%>>Industries</a>
      <ul class="dropdown">
        <li><a href="<%= ResolveUrl("~/pages/operations.aspx") %>">Operations</a></li>
        <li><a href="<%= ResolveUrl("~/pages/industrial.aspx") %>">Industrial</a></li>
        <li><a href="<%= ResolveUrl("~/pages/customer-service.aspx") %>">Customer Service</a></li>
        <li><a href="<%= ResolveUrl("~/pages/business-support.aspx") %>">Business Support</a></li>
        <li><a href="<%= ResolveUrl("~/pages/technical-support.aspx") %>">Technical Support</a></li>
        <li><a href="<%= ResolveUrl("~/pages/healthcare.aspx") %>">Healthcare</a></li>
        <li><a href="<%= ResolveUrl("~/pages/leadership.aspx") %>">Leadership</a></li>
      </ul>
    </li>
    <li><a href="<%= ResolveUrl("~/pages/careers.aspx") %>"<%=IsActive("careers")%>>Careers</a></li>
    <li><a href="<%= ResolveUrl("~/pages/contact.aspx") %>"<%=IsActive("contact")%>>Contact Us</a></li>
    <li>
      <button class="portal-nav-btn" onclick="PP.open('employer')" id="portal-nav-btn">
        <span class="pnb-dot"></span> Portal <span class="pnb-arrow">&#9662;</span>
      </button>
    </li>
  </ul>
  <button class="hamburger" id="hamburger" aria-label="Open menu">
    <span></span><span></span><span></span>
  </button>
</nav>
<div class="mobile-menu" id="mobileMenu">
  <button class="close-btn" id="closeMenu">&#10005;</button>
  <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a>
  <a href="<%= ResolveUrl("~/pages/about.aspx") %>">About Us</a>
  <a href="<%= ResolveUrl("~/pages/services.aspx") %>">Services</a>
  <a href="<%= ResolveUrl("~/pages/operations.aspx") %>">Industries</a>
  <a href="<%= ResolveUrl("~/pages/careers.aspx") %>">Careers</a>
  <a href="<%= ResolveUrl("~/pages/contact.aspx") %>">Contact Us</a>
  <a href="#" onclick="PP.open('employer')" class="mobile-cta">Portal</a>
</div>