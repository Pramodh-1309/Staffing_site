using System;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;
using System.Web.UI;

public partial class Controls_ContactForm : UserControl
{
    protected void Page_Load(object sender, EventArgs e) { }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        try
        {
            string contactEmail = WebConfigurationManager.AppSettings["ContactEmail"] ?? "info@aivirtrix.com";
            string smtpHost     = WebConfigurationManager.AppSettings["SmtpHost"]    ?? "smtp.gmail.com";
            int    smtpPort     = int.Parse(WebConfigurationManager.AppSettings["SmtpPort"] ?? "587");
            string smtpUser     = WebConfigurationManager.AppSettings["SmtpUser"]    ?? "";
            string smtpPass     = WebConfigurationManager.AppSettings["SmtpPass"]    ?? "";
            string fromEmail    = WebConfigurationManager.AppSettings["SmtpFromEmail"] ?? "noreply@aivirtrix.com";
            string fromName     = WebConfigurationManager.AppSettings["SmtpFromName"]  ?? "Aivirtrix";

            string subject = $"[Aivirtrix] New Enquiry – {ddlEnquiry.SelectedValue}";
            string body    = $@"
<h2 style='color:#2563eb'>New Enquiry from Aivirtrix Website</h2>
<table style='width:100%;border-collapse:collapse;font-family:Arial,sans-serif;font-size:14px'>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Name</td><td style='padding:8px;border:1px solid #e5e7eb'>{txtName.Text}</td></tr>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Company</td><td style='padding:8px;border:1px solid #e5e7eb'>{txtCompany.Text}</td></tr>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Email</td><td style='padding:8px;border:1px solid #e5e7eb'><a href='mailto:{txtEmail.Text}'>{txtEmail.Text}</a></td></tr>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Phone</td><td style='padding:8px;border:1px solid #e5e7eb'>{txtPhone.Text}</td></tr>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Enquiry Type</td><td style='padding:8px;border:1px solid #e5e7eb'>{ddlEnquiry.SelectedValue}</td></tr>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Industry</td><td style='padding:8px;border:1px solid #e5e7eb'>{ddlIndustry.SelectedValue}</td></tr>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Message</td><td style='padding:8px;border:1px solid #e5e7eb'>{txtMessage.Text.Replace(Environment.NewLine,"<br/>")}</td></tr>
  <tr><td style='padding:8px;border:1px solid #e5e7eb;font-weight:700;background:#f9fafb'>Submitted</td><td style='padding:8px;border:1px solid #e5e7eb'>{DateTime.Now:dd MMM yyyy HH:mm} UTC</td></tr>
</table>";

            using var client = new SmtpClient(smtpHost, smtpPort)
            {
                Credentials    = new NetworkCredential(smtpUser, smtpPass),
                EnableSsl      = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
            };
            using var mail = new MailMessage
            {
                From       = new MailAddress(fromEmail, fromName),
                Subject    = subject,
                Body       = body,
                IsBodyHtml = true,
            };
            mail.To.Add(contactEmail);
            mail.ReplyToList.Add(new MailAddress(txtEmail.Text, txtName.Text));
            client.Send(mail);

            pnlForm.Visible    = false;
            pnlSuccess.Visible = true;
        }
        catch (Exception ex)
        {
            // Log error; show generic message
            System.Diagnostics.Trace.TraceError("ContactForm error: " + ex.Message);
            valSummary.HeaderText = "Sorry, there was a problem sending your message. Please try again or email us directly at info@aivirtrix.com.";
        }
    }
}