using System;
using System.Web.UI;

namespace MasterPages
{
    public partial class Site : MasterPage
    {
        // Set by each page code-behind to highlight the active nav link
        public string ActivePage { get; set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Pass ActivePage down to the NavBar user control
            NavBar1.ActivePage = ActivePage;
        }
    }
}