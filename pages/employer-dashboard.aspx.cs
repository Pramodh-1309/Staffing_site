using System;
using System.Web;
using System.Web.UI;

public partial class Pages_employer_dashboard : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Auth guard: employer must be logged in via session
        if (Session["employer_logged_in"] == null || !(bool)Session["employer_logged_in"])
        {
            // Allow JS-based session to work (localStorage); just ensure page loads
            // For server-side auth: uncomment below
            // Response.Redirect("~/pages/employer-login.aspx");
        }
    }
}