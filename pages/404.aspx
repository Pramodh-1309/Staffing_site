<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="Pages_404" %>
<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Page Not Found &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Page Not Found &ndash; Aivirtrix</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server"></asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">

  <section style="min-height:70vh;display:flex;align-items:center;justify-content:center;background:#f8f9fb;text-align:center;padding:6rem 5%">
    <div style="max-width:580px">
      <div style="font-family:'Poppins',sans-serif;font-size:8rem;font-weight:lighter;color:#eef0f4;line-height:1;margin-bottom:1rem;user-select:none">404</div>
      <span class="section-tag">Page Not Found</span>
      <h1 class="section-title" style="margin-bottom:1rem">This page doesn't exist</h1>
      <p style="font-size:.95rem;color:#6b7280;line-height:1.85;margin-bottom:2.5rem">The page you're looking for may have been moved, renamed, or might not exist. Please check the URL or navigate back to the homepage.</p>
      <div style="display:flex;gap:1rem;flex-wrap:wrap;justify-content:center">
        <a href="<%= ResolveUrl("~/Default.aspx") %>" class="btn btn-primary">&#8592; Go Home</a>
        <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-outline">Contact Us</a>
      </div>
    </div>
  </section>
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent"   runat="server"></asp:Content>