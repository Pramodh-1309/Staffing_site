using System;
using System.Web.UI;

public partial class Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Set active nav highlight via master page
        var master = this.Master as MasterPages.Site;
        if (master != null) master.ActivePage = "home";
        
    }
}