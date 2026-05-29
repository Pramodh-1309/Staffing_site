/* ============================================================
   form.js — Contact Form Validation & Submission
   Aivirtrix
   Uses: EmailJS (free tier) OR plain fetch to a backend
   ============================================================ */

document.addEventListener('DOMContentLoaded', function () {

  const form = document.getElementById('enquiryForm');
  if (!form) return;

  /* ── HELPER: Show field error ── */
  function showError(fieldId, message) {
    const field = document.getElementById(fieldId);
    const errorEl = document.getElementById(fieldId + 'Error');
    if (field)   field.style.borderColor = '#e05555';
    if (errorEl) { errorEl.textContent = message; errorEl.style.display = 'block'; }
  }

  /* ── HELPER: Clear field error ── */
  function clearError(fieldId) {
    const field = document.getElementById(fieldId);
    const errorEl = document.getElementById(fieldId + 'Error');
    if (field)   field.style.borderColor = '';
    if (errorEl) { errorEl.textContent = ''; errorEl.style.display = 'none'; }
  }

  /* ── HELPER: Validate email format ── */
  function isValidEmail(email) {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  }

  /* ── HELPER: Validate phone (10+ digits, optional) ── */
  function isValidPhone(phone) {
    return phone === '' || /^[+\d\s\-]{10,}$/.test(phone);
  }

  /* ── VALIDATE FORM ── */
  function validateForm() {
    let isValid = true;

    // Name
    const name = document.getElementById('name').value.trim();
    clearError('name');
    if (!name || name.length < 2) {
      showError('name', 'Please enter your full name (at least 2 characters).');
      isValid = false;
    }

    // Company
    const company = document.getElementById('company').value.trim();
    clearError('company');
    if (!company) {
      showError('company', 'Please enter your company or organization name.');
      isValid = false;
    }

    // Email
    const email = document.getElementById('email').value.trim();
    clearError('email');
    if (!email || !isValidEmail(email)) {
      showError('email', 'Please enter a valid email address.');
      isValid = false;
    }

    // Phone (optional but validate format if filled)
    const phone = document.getElementById('phone').value.trim();
    clearError('phone');
    if (!isValidPhone(phone)) {
      showError('phone', 'Please enter a valid phone number.');
      isValid = false;
    }

    // Enquiry type
    const type = document.getElementById('enquiryType').value;
    clearError('enquiryType');
    if (!type) {
      showError('enquiryType', 'Please select an enquiry type.');
      isValid = false;
    }

    // Message
    const message = document.getElementById('message').value.trim();
    clearError('message');
    if (!message || message.length < 20) {
      showError('message', 'Please describe your requirements (at least 20 characters).');
      isValid = false;
    }

    return isValid;
  }

  /* ── REAL-TIME VALIDATION (on blur) ── */
  ['name', 'company', 'email', 'phone', 'enquiryType', 'message'].forEach(function (id) {
    const el = document.getElementById(id);
    if (el) {
      el.addEventListener('blur', function () { validateForm(); });
      el.addEventListener('input', function () { clearError(id); });
    }
  });

  /* ── FORM SUBMIT ── */
  form.addEventListener('submit', function (e) {
    e.preventDefault();

    if (!validateForm()) return;

    const submitBtn = form.querySelector('[type="submit"]');
    submitBtn.textContent = 'Sending…';
    submitBtn.disabled = true;

    /* ────────────────────────────────────────────────
       OPTION A: EmailJS (easiest, no backend needed)
       1. Sign up at https://www.emailjs.com (free)
       2. Create a service + email template
       3. Replace YOUR_SERVICE_ID, YOUR_TEMPLATE_ID, YOUR_PUBLIC_KEY
    ──────────────────────────────────────────────── */
    /*
    emailjs.send('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', {
      from_name:    document.getElementById('name').value,
      from_company: document.getElementById('company').value,
      from_email:   document.getElementById('email').value,
      phone:        document.getElementById('phone').value,
      enquiry_type: document.getElementById('enquiryType').value,
      message:      document.getElementById('message').value
    }, 'YOUR_PUBLIC_KEY')
    .then(function () {
      showSuccess();
    })
    .catch(function (err) {
      showFailed();
      console.error('EmailJS error:', err);
    });
    */

    /* ────────────────────────────────────────────────
       OPTION B: FormSpree (drop-in form backend)
       1. Sign up at https://formspree.io
       2. Create a form, get your form ID
       3. Replace YOUR_FORM_ID below
    ──────────────────────────────────────────────── */
    /*
    fetch('https://formspree.io/f/YOUR_FORM_ID', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
      body: JSON.stringify({
        name:    document.getElementById('name').value,
        company: document.getElementById('company').value,
        email:   document.getElementById('email').value,
        phone:   document.getElementById('phone').value,
        type:    document.getElementById('enquiryType').value,
        message: document.getElementById('message').value
      })
    })
    .then(function (res) {
      if (res.ok) showSuccess(); else showFailed();
    })
    .catch(function () { showFailed(); });
    */

    // ── DEMO (remove when using real service above) ──
    setTimeout(function () {
      showSuccess();
    }, 1200);
  });

  /* ── SUCCESS STATE ── */
  function showSuccess() {
    const successMsg = document.getElementById('formSuccess');
    const submitBtn  = form.querySelector('[type="submit"]');
    if (successMsg) successMsg.style.display = 'block';
    form.reset();
    submitBtn.textContent = 'Send Enquiry →';
    submitBtn.disabled = false;
    successMsg.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
    setTimeout(function () {
      if (successMsg) successMsg.style.display = 'none';
    }, 6000);
  }

  /* ── FAIL STATE ── */
  function showFailed() {
    const failMsg   = document.getElementById('formFail');
    const submitBtn = form.querySelector('[type="submit"]');
    if (failMsg) failMsg.style.display = 'block';
    submitBtn.textContent = 'Send Enquiry →';
    submitBtn.disabled = false;
    setTimeout(function () {
      if (failMsg) failMsg.style.display = 'none';
    }, 5000);
  }

});
