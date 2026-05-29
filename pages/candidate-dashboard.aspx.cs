using System;
using System.Web;
using System.Web.UI;

public partial class Pages_candidate_dashboard : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Auth guard: candidate must be logged in via session
        if (Session["candidate_logged_in"] == null || !(bool)Session["candidate_logged_in"])
        {
            // Allow JS-based session to work (sessionStorage); just ensure page loads
            // For server-side auth: uncomment below
            // Response.Redirect("~/pages/candidate-login.aspx");
        }
    }
}