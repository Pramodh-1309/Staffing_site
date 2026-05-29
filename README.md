# Aivirtrix – Global Staffing Platform
## ASP.NET WebForms 4.8

### Project Structure
```
Aivirtrix/
├── MasterPages/
│   ├── Site.master           # Shared layout (topbar, navbar, footer)
│   └── Site.master.cs
├── Controls/
│   ├── NavBar.ascx           # Active-link-aware navbar
│   ├── SiteFooter.ascx       # Full footer with legal modal
│   ├── ContactForm.ascx      # Server-side email form
│   └── PageHero.ascx         # Reusable page hero
├── App_Code/
│   └── SiteHelper.cs         # Shared utility class
├── Config/
│   ├── AppSettings.config    # ⚠️ Add to .gitignore — SMTP & keys
│   └── ConnectionStrings.config
├── css/                      # All stylesheets
├── js/                       # JavaScript files (vpstore, careers, dashboard)
├── images/                   # Site images
├── Mobile/
│   └── mobile-overrides.css  # Mobile/tablet responsive overrides
├── pages/                    # All inner pages
│   ├── about.aspx
│   ├── services.aspx
│   ├── careers.aspx
│   ├── contact.aspx
│   ├── operations.aspx       # Industry pages (7 total)
│   ├── candidate-login.aspx
│   ├── employer-login.aspx
│   ├── candidate-dashboard.aspx
│   ├── employer-dashboard.aspx
│   ├── 404.aspx
│   └── error.aspx
├── Default.aspx              # Home page
├── Global.asax               # URL routing & error handling
└── Web.config                # IIS config, SMTP, routes
```

### Setup
1. Open in **Visual Studio 2019+** or publish via **Web Deploy / FTP**
2. Copy `Config/AppSettings.config.example` → `Config/AppSettings.config`
3. Fill in SMTP credentials in `AppSettings.config`
4. Publish to IIS with **ASP.NET 4.8 application pool**
5. Ensure `Write` permissions on `App_Data/` (for logs)

### Tech Stack
- ASP.NET WebForms 4.8 / C#
- IIS 8.5+ with URL Rewrite Module
- localStorage-based job board (vpstore.js) — no database required for MVP
- SMTP email via `ContactForm.ascx.cs` (Gmail App Password recommended)

### Live Features
- 🔍 Job search & filtering (careers.js + vpstore.js)
- 📋 Employer job posting dashboard (employer-dashboard.js)
- 👤 Candidate application tracking (candidate-dashboard — inline JS)
- 📧 Server-side contact form with email delivery
- 🌐 Clean URL routing via Global.asax
- 📱 Fully responsive (mobile-overrides.css)
