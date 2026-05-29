using System;
using System.Web.UI;

public partial class Pages_Error : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.StatusCode = 500;
    }
}