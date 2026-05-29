using System;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;

/// <summary>
/// Shared helper methods available across all pages and controls.
/// </summary>
public static class SiteHelper
{
    public static string SiteName    => WebConfigurationManager.AppSettings["SiteName"]    ?? "Aivirtrix";
    public static string ContactEmail=> WebConfigurationManager.AppSettings["ContactEmail"] ?? "info@aivirtrix.com";
    public static string PhoneNumber => WebConfigurationManager.AppSettings["PhoneNumber"]  ?? "+1-800-000-0000";
    public static string Address     => WebConfigurationManager.AppSettings["Address"]      ?? "Delaware, USA";
    public static string SiteUrl     => WebConfigurationManager.AppSettings["SiteUrl"]      ?? "https://www.aivirtrix.com";

    /// <summary>Returns true if the site is in maintenance mode.</summary>
    public static bool IsMaintenanceMode =>
        bool.TryParse(WebConfigurationManager.AppSettings["MaintenanceMode"], out bool v) && v;

    /// <summary>HTML-encodes a string safely.</summary>
    public static string HtmlEncode(string s) => HttpUtility.HtmlEncode(s ?? "");

    /// <summary>Returns a friendly time-ago string, e.g. "2 hours ago".</summary>
    public static string TimeAgo(DateTime dt)
    {
        var span = DateTime.UtcNow - dt;
        if (span.TotalDays  >= 365) return $"{(int)(span.TotalDays/365)} year(s) ago";
        if (span.TotalDays  >= 30)  return $"{(int)(span.TotalDays/30)} month(s) ago";
        if (span.TotalDays  >= 1)   return $"{(int)span.TotalDays} day(s) ago";
        if (span.TotalHours >= 1)   return $"{(int)span.TotalHours} hour(s) ago";
        if (span.TotalMinutes >= 1) return $"{(int)span.TotalMinutes} minute(s) ago";
        return "just now";
    }
}