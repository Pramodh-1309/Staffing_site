<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageHero.ascx.cs" Inherits="Controls_PageHero" %>
<div class="page-hero">
  <div class="page-hero-content container">
    <div class="breadcrumb">
      <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a>
      <% if (!string.IsNullOrEmpty(ParentLabel)) { %><span>&#8250;</span><a href="<%= ParentUrl %>"><%= ParentLabel %></a><% } %>
      <span>&#8250;</span><span><%= PageLabel %></span>
    </div>
    <% if (!string.IsNullOrEmpty(SectionTag)) { %>
      <span class="section-tag"><%= SectionTag %></span>
    <% } %>
    <h1 class="page-hero-title"><%= Title %></h1>
    <% if (!string.IsNullOrEmpty(SubTitle)) { %>
      <p class="page-hero-sub"><%= SubTitle %></p>
    <% } %>
    <asp:ContentPlaceHolder ID="HeroExtra" runat="server"/>
  </div>
</div>