using System;
using System.Web.UI;

public partial class Pages_customer_service : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var master = this.Master as MasterPages.Site;
        if (master != null) master.ActivePage = "industries";
    }
}