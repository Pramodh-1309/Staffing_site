using System;
using System.Web.UI;

public partial class Pages_404 : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.StatusCode = 404;
    }
}