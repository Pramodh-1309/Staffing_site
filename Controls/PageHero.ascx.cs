using System;
using System.Web.UI;

public partial class Controls_PageHero : UserControl
{
    public string Title       { get; set; } = "";
    public string SubTitle    { get; set; } = "";
    public string SectionTag  { get; set; } = "";
    public string PageLabel   { get; set; } = "";
    public string ParentLabel { get; set; } = "";
    public string ParentUrl   { get; set; } = "";

    protected void Page_Load(object sender, EventArgs e) { }
}