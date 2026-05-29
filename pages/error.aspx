<%@ Page Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="Pages_Error" %>
<asp:Content ID="TitleContent"  ContentPlaceHolderID="PageTitle"       runat="server">Something Went Wrong &ndash; Aivirtrix</asp:Content>
<asp:Content ID="DescContent"   ContentPlaceHolderID="PageDescription" runat="server">Something Went Wrong &ndash; Aivirtrix</asp:Content>
<asp:Content ID="HeadContent"   ContentPlaceHolderID="HeadContent"     runat="server"></asp:Content>
<asp:Content ID="MainContent"   ContentPlaceHolderID="MainContent"     runat="server">

  <section style="min-height:70vh;display:flex;align-items:center;justify-content:center;background:#f8f9fb;text-align:center;padding:6rem 5%">
    <div style="max-width:580px">
      <div style="font-size:4rem;margin-bottom:1rem">&#9888;&#65039;</div>
      <span class="section-tag">Server Error</span>
      <h1 class="section-title" style="margin-bottom:1rem">Something went wrong</h1>
      <p style="font-size:.95rem;color:#6b7280;line-height:1.85;margin-bottom:2.5rem">We apologise for the inconvenience. Our team has been notified. Please try again in a few minutes.</p>
      <div style="display:flex;gap:1rem;flex-wrap:wrap;justify-content:center">
        <a href="<%= ResolveUrl("~/Default.aspx") %>" class="btn btn-primary">&#8592; Go Home</a>
        <a href="<%= ResolveUrl("~/pages/contact.aspx") %>" class="btn btn-outline">Contact Us</a>
      </div>
    </div>
  </section>
</asp:Content>
<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptContent"   runat="server"></asp:Content>