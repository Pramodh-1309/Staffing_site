using System;
using System.Web.UI;

public partial class Controls_NavBar : UserControl
{
    public string ActivePage { get; set; } = "";

    protected void Page_Load(object sender, EventArgs e) { }

    // Returns class="active" if this page matches
    protected string IsActive(string page)
    {
        return string.Equals(ActivePage, page, StringComparison.OrdinalIgnoreCase)
            ? " class=\"active\""
            : "";
    }
}