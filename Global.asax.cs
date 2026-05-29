using System;
using System.Web;
using System.Web.Routing;

public class Global : HttpApplication
{
    protected void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }

    private void RegisterRoutes(RouteCollection routes)
    {
        // Home
        routes.MapPageRoute("Home",               "",                          "~/Default.aspx");

        // Main pages
        routes.MapPageRoute("About",              "about",                     "~/pages/about.aspx");
        routes.MapPageRoute("Services",           "services",                  "~/pages/services.aspx");
        routes.MapPageRoute("Careers",            "careers",                   "~/pages/careers.aspx");
        routes.MapPageRoute("Contact",            "contact",                   "~/pages/contact.aspx");

        // Industry pages
        routes.MapPageRoute("Operations",         "industries/operations",     "~/pages/operations.aspx");
        routes.MapPageRoute("Industrial",         "industries/industrial",     "~/pages/industrial.aspx");
        routes.MapPageRoute("CustomerService",    "industries/customer-service","~/pages/customer-service.aspx");
        routes.MapPageRoute("BusinessSupport",    "industries/business-support","~/pages/business-support.aspx");
        routes.MapPageRoute("TechnicalSupport",   "industries/technical-support","~/pages/technical-support.aspx");
        routes.MapPageRoute("Healthcare",         "industries/healthcare",     "~/pages/healthcare.aspx");
        routes.MapPageRoute("Leadership",         "industries/leadership",     "~/pages/leadership.aspx");

        // Portal pages
        routes.MapPageRoute("CandidateLogin",     "portal/candidate-login",    "~/pages/candidate-login.aspx");
        routes.MapPageRoute("EmployerLogin",      "portal/employer-login",     "~/pages/employer-login.aspx");
        routes.MapPageRoute("CandidateDashboard", "portal/candidate",          "~/pages/candidate-dashboard.aspx");
        routes.MapPageRoute("EmployerDashboard",  "portal/employer",           "~/pages/employer-dashboard.aspx");

        // Utility pages
        routes.MapPageRoute("NotFound",           "404",                       "~/pages/404.aspx");
        routes.MapPageRoute("Error",              "error",                     "~/pages/error.aspx");
    }

    protected void Application_BeginRequest(object sender, EventArgs e)
    {
        // Remove trailing slashes (except root)
        string path = Request.Url.AbsolutePath;
        if (path.Length > 1 && path.EndsWith("/"))
        {
            string newUrl = Request.Url.GetLeftPart(UriPartial.Authority)
                          + path.TrimEnd('/')
                          + (Request.Url.Query.Length > 0 ? Request.Url.Query : "");
            Response.RedirectPermanent(newUrl);
        }
    }

    protected void Application_Error(object sender, EventArgs e)
    {
        Exception ex = Server.GetLastError();
        if (ex is HttpException httpEx && httpEx.GetHttpCode() == 404)
        {
            Server.ClearError();
            Response.Redirect("~/pages/404.aspx");
        }
    }

    protected void Session_Start(object sender, EventArgs e)  { }
    protected void Session_End(object sender, EventArgs e)    { }
    protected void Application_End(object sender, EventArgs e){ }
}
