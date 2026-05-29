/**
 * portal-widget.js — Aivirtrix
 * Injects the Portal login panel and handles employer/candidate auth.
 * Works from both root (index.html) and pages/ subdirectory.
 */
(function () {
  // Detect if we're in pages/ or root
  const inPages = location.pathname.includes('/pages/');
  const base    = inPages ? '' : 'pages/';

  /* ── CSS ── */
  const style = document.createElement('style');
  style.textContent = `
    /* PORTAL BUTTON */
    .portal-nav-btn {
      display: inline-flex; align-items: center; gap: .38rem;
      padding: .42rem .95rem;
      background: rgba(37,99,235,.1);
      border: 1px solid rgba(37,99,235,.4);
      border-radius: 3px;
      color: #93c5fd;
      font-size: .79rem; font-weight: 600;
      cursor: pointer; white-space: nowrap;
      font-family: 'Poppins', sans-serif;
      transition: all .2s; position: relative;
      user-select: none;
    }
    .portal-nav-btn:hover {
      background: rgba(37,99,235,.22);
      border-color: #3b82f6;
      color: #fff;
    }
    .portal-nav-btn .pnb-dot {
      width: 6px; height: 6px; border-radius: 50%;
      background: #22c55e;
      display: inline-block; flex-shrink: 0;
      box-shadow: 0 0 0 2px rgba(34,197,94,.25);
    }
    .portal-nav-btn .pnb-arrow {
      font-size: .55rem;
      transition: transform .22s;
      display: inline-block;
    }
    .portal-nav-btn.open .pnb-arrow { transform: rotate(180deg); }

    /* OVERLAY BACKDROP */
    .portal-backdrop {
      position: fixed; inset: 0; z-index: 8000;
      display: none;
    }
    .portal-backdrop.open { display: block; }

    /* DROPDOWN PANEL */
    .portal-panel {
      position: fixed;
      top: 93px; right: 0;
      width: 420px;
      height: calc(100vh - 93px);
      background: #111318;
      border-left: 1px solid rgba(255,255,255,.09);
      border-top: 1px solid rgba(255,255,255,.06);
      z-index: 9000;
      display: flex; flex-direction: column;
      transform: translateX(100%);
      transition: transform .28s cubic-bezier(.4,0,.2,1);
      box-shadow: -24px 0 60px rgba(0,0,0,.5);
      overflow-y: auto;
    }
    .portal-panel.open { transform: translateX(0); }
    .portal-panel.topbar-gone { top: 60px; height: calc(100vh - 60px); }

    /* PANEL HEADER */
    .pp-header {
      padding: 1.2rem 1.5rem;
      border-bottom: 1px solid rgba(255,255,255,.07);
      display: flex; align-items: center; justify-content: space-between;
      flex-shrink: 0;
    }
    .pp-logo { display: flex; align-items: center; gap: .7rem; }
    .pp-logo-icon {
      width: 30px; height: 30px;
      background: linear-gradient(135deg,#2563eb,#1d4ed8);
      border-radius: 7px;
      display: flex; align-items: center; justify-content: center;
      font-size: .85rem; flex-shrink: 0;
    }
    .pp-logo-name { font-size: .78rem; font-weight: 800; color: #fff; line-height: 1.2; }
    .pp-logo-sub  { font-size: .6rem; color: rgba(255,255,255,.3); margin-top: .05rem; }
    .pp-close {
      width: 28px; height: 28px;
      background: rgba(255,255,255,.06);
      border: 1px solid rgba(255,255,255,.1);
      border-radius: 6px; color: rgba(255,255,255,.5);
      font-size: .85rem; cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      transition: all .18s; flex-shrink: 0;
      font-family: monospace;
    }
    .pp-close:hover { background: rgba(239,68,68,.15); border-color: rgba(239,68,68,.3); color: #f87171; }

    /* TOGGLE */
    .pp-toggle {
      display: grid; grid-template-columns: 1fr 1fr;
      background: rgba(255,255,255,.04);
      border: 1px solid rgba(255,255,255,.07);
      border-radius: 9px; padding: 4px; margin: 1.2rem 1.5rem; gap: 4px;
      flex-shrink: 0;
    }
    .pp-tab {
      padding: .6rem .5rem;
      background: none; border: none; border-radius: 6px;
      font-family: 'Poppins', sans-serif;
      font-size: .76rem; font-weight: 600;
      color: rgba(255,255,255,.35);
      cursor: pointer; transition: all .18s;
      display: flex; align-items: center; justify-content: center; gap: .4rem;
    }
    .pp-tab svg { width: 13px; height: 13px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; flex-shrink: 0; }
    .pp-tab:hover { color: rgba(255,255,255,.65); }
    .pp-tab.active {
      background: #2563eb; color: #fff;
      box-shadow: 0 2px 12px rgba(37,99,235,.4);
    }

    /* FORM AREA */
    .pp-body { padding: 0 1.5rem 1.5rem; flex: 1; }

    /* PORTAL SECTIONS */
    .pp-section { display: none; animation: ppFadeIn .2s ease; }
    .pp-section.visible { display: block; }
    @keyframes ppFadeIn { from { opacity:0; transform:translateY(6px); } to { opacity:1; transform:translateY(0); } }

    .pp-title { font-size: 1.2rem; font-weight: 800; color: #fff; margin-bottom: .25rem; line-height: 1.2; }
    .pp-title em { font-style: italic; color: #3b82f6; }
    .pp-sub { font-size: .76rem; color: rgba(255,255,255,.38); margin-bottom: 1.4rem; line-height: 1.65; }

    /* FIELDS */
    .pp-group { margin-bottom: .95rem; }
    .pp-label {
      display: block; font-size: .63rem; font-weight: 700;
      letter-spacing: .09em; text-transform: uppercase;
      color: rgba(255,255,255,.32); margin-bottom: .38rem;
    }
    .pp-input {
      width: 100%; background: rgba(255,255,255,.05);
      border: 1px solid rgba(255,255,255,.1); border-radius: 8px;
      padding: .72rem .95rem;
      font-family: 'Poppins', sans-serif; font-size: .82rem; color: #fff;
      outline: none; transition: border-color .2s, box-shadow .2s;
      box-sizing: border-box;
    }
    .pp-input::placeholder { color: rgba(255,255,255,.2); }
    .pp-input:focus { border-color: #3b82f6; box-shadow: 0 0 0 3px rgba(37,99,235,.12); }
    .pp-input.ok { border-color: #16a34a; }
    .pp-input[readonly] { opacity: .65; cursor: default; }

    .pp-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.1rem; }
    .pp-remember { display: flex; align-items: center; gap: .4rem; font-size: .71rem; color: rgba(255,255,255,.3); cursor: pointer; }
    .pp-remember input { width: 13px; height: 13px; accent-color: #2563eb; }
    .pp-link { font-size: .71rem; color: #3b82f6; text-decoration: none; transition: color .18s; cursor: pointer; background: none; border: none; font-family: inherit; }
    .pp-link:hover { color: #93c5fd; }

    /* CHECK ROW */
    .pp-check-row { display: flex; gap: .5rem; align-items: flex-end; }
    .pp-check-row .pp-input { flex: 1; }
    .pp-check-btn {
      padding: .72rem .9rem;
      background: #2563eb; color: #fff; border: none; border-radius: 8px;
      font-family: 'Poppins', sans-serif; font-size: .72rem; font-weight: 700;
      cursor: pointer; transition: background .18s; white-space: nowrap; flex-shrink: 0;
    }
    .pp-check-btn:hover { background: #1d4ed8; }
    .pp-check-btn:disabled { background: rgba(255,255,255,.08); color: rgba(255,255,255,.25); cursor: not-allowed; }

    .pp-un-status {
      font-size: .7rem; margin-top: .35rem;
      padding: .32rem .7rem; border-radius: 5px;
      display: none; font-weight: 500; line-height: 1.4;
    }
    .pp-un-status.found    { background: rgba(22,163,74,.1);  color: #4ade80; border: 1px solid rgba(22,163,74,.2);  display: block; }
    .pp-un-status.new-user { background: rgba(37,99,235,.1);  color: #93c5fd; border: 1px solid rgba(37,99,235,.2);  display: block; }

    /* SUBMIT BUTTON */
    .pp-submit {
      width: 100%; background: #2563eb; color: #fff;
      border: none; border-radius: 8px;
      padding: .82rem; font-family: 'Poppins', sans-serif;
      font-size: .78rem; font-weight: 700; letter-spacing: .07em;
      text-transform: uppercase; cursor: pointer;
      transition: all .2s; box-shadow: 0 4px 16px rgba(37,99,235,.3);
    }
    .pp-submit:hover { background: #1d4ed8; transform: translateY(-1px); box-shadow: 0 6px 22px rgba(37,99,235,.42); }
    .pp-submit:active { transform: translateY(0); }
    .pp-submit.secondary { background: rgba(37,99,235,.14); border: 1px solid rgba(37,99,235,.32); box-shadow: none; margin-top: .45rem; }
    .pp-submit.secondary:hover { background: rgba(37,99,235,.25); }

    /* ERROR */
    .pp-error {
      background: rgba(220,38,38,.1); border: 1px solid rgba(220,38,38,.25);
      color: #fca5a5; font-size: .72rem; padding: .6rem .9rem;
      border-radius: 7px; margin-bottom: .85rem; display: none; line-height: 1.5;
    }

    /* DIVIDER */
    .pp-divider { display: flex; align-items: center; gap: .8rem; margin: 1.1rem 0; }
    .pp-divider::before,.pp-divider::after { content:''; flex:1; height:1px; background: rgba(255,255,255,.07); }
    .pp-divider span { font-size: .63rem; color: rgba(255,255,255,.2); white-space: nowrap; }

    /* SECTION LABEL */
    .pp-section-lbl {
      font-size: .6rem; font-weight: 700; letter-spacing: .12em;
      text-transform: uppercase; color: rgba(255,255,255,.22);
      margin: 1rem 0 .8rem;
      display: flex; align-items: center; gap: .6rem;
    }
    .pp-section-lbl::after { content:''; flex:1; height:1px; background: rgba(255,255,255,.07); }

    /* STRENGTH */
    .pp-strength { display: flex; gap: 3px; margin-top: .35rem; height: 3px; }
    .pp-strength-seg { flex:1; border-radius: 2px; background: rgba(255,255,255,.08); transition: background .25s; }
    .pp-strength-seg.weak { background: #dc2626; }
    .pp-strength-seg.fair { background: #d97706; }
    .pp-strength-seg.good { background: #16a34a; }

    /* FOOTER NOTE */
    .pp-note { text-align: center; font-size: .7rem; color: rgba(255,255,255,.22); margin-top: .7rem; }
    .pp-note a { color: #3b82f6; text-decoration: none; }
    .pp-note a:hover { color: #93c5fd; }

    /* DASHBOARD REDIRECT BANNER */
    .pp-logged-in {
      background: rgba(34,197,94,.08); border: 1px solid rgba(34,197,94,.2);
      border-radius: 10px; padding: 1.1rem; margin-bottom: 1rem; text-align: center;
    }
    .pp-logged-in .pp-li-icon { font-size: 1.5rem; margin-bottom: .5rem; }
    .pp-logged-in .pp-li-name { font-size: .88rem; font-weight: 700; color: #fff; margin-bottom: .2rem; }
    .pp-logged-in .pp-li-role { font-size: .7rem; color: rgba(255,255,255,.4); margin-bottom: .9rem; }
    .pp-go-btn {
      display: block; width: 100%;
      background: #22c55e; color: #fff; border: none; border-radius: 7px;
      padding: .65rem; font-family: 'Poppins', sans-serif;
      font-size: .76rem; font-weight: 700; cursor: pointer;
      transition: background .18s; margin-bottom: .5rem;
      text-decoration: none; text-align: center;
    }
    .pp-go-btn:hover { background: #16a34a; }
    .pp-logout-link {
      font-size: .7rem; color: rgba(255,255,255,.3);
      cursor: pointer; background: none; border: none;
      font-family: inherit; transition: color .18s;
    }
    .pp-logout-link:hover { color: #f87171; }

    @media(max-width:480px){
      .portal-panel {
      position: fixed;
      top: 93px; right: 0;
      width: 420px;
      height: calc(100vh - 93px);
      background: #111318;
      border-left: 1px solid rgba(255,255,255,.09);
      border-top: 1px solid rgba(255,255,255,.06);
      z-index: 9000;
      display: flex; flex-direction: column;
      transform: translateX(100%);
      transition: transform .28s cubic-bezier(.4,0,.2,1);
      box-shadow: -24px 0 60px rgba(0,0,0,.5);
      overflow-y: auto;
    }
    }
  `;
  document.head.appendChild(style);

  /* ── HTML ── */
  const html = `
    <div class="portal-backdrop" id="pp-backdrop"></div>
    <div class="portal-panel" id="pp-panel">

      <!-- Header -->
      <div class="pp-header">
        <div class="pp-logo">
          <div class="pp-logo-icon">🌾</div>
          <div>
            <div class="pp-logo-name">Aivirtrix</div>
            <div class="pp-logo-sub">Career Portal</div>
          </div>
        </div>
        <button class="pp-close" id="pp-close" aria-label="Close">✕</button>
      </div>

      <!-- Toggle -->
      <div class="pp-toggle">
        <button class="pp-tab active" id="pp-tab-employer" onclick="PP.switchTab('employer')">
          <svg viewBox="0 0 24 24"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/></svg>
          Employer
        </button>
        <button class="pp-tab" id="pp-tab-candidate" onclick="PP.switchTab('candidate')">
          <svg viewBox="0 0 24 24"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
          Candidate
        </button>
      </div>

      <!-- Body -->
      <div class="pp-body">

        <!-- ── EMPLOYER SECTION ── -->
        <div class="pp-section visible" id="pp-emp">
          <div id="pp-emp-loggedin" style="display:none"></div>
          <div id="pp-emp-form">
            <div class="pp-title">Employer <em>Login</em></div>
            <div class="pp-sub">Sign in to manage job postings and your candidate pipeline.</div>
            <div class="pp-error" id="pp-emp-err"></div>
            <div class="pp-group">
              <label class="pp-label">Username</label>
              <input class="pp-input" id="pp-emp-user" type="text" placeholder="Enter username" autocomplete="username"/>
            </div>
            <div class="pp-group">
              <label class="pp-label">Password</label>
              <input class="pp-input" id="pp-emp-pass" type="password" placeholder="Enter password" autocomplete="current-password"/>
            </div>
            <div class="pp-row">
              <label class="pp-remember"><input type="checkbox"/> Remember me</label>
              <button class="pp-link" onclick="PP.forgotEmp()">Forgot password?</button>
            </div>
            <button class="pp-submit" onclick="PP.empLogin()">Sign In to Dashboard</button>
            <div class="pp-divider"><span>need access?</span></div>
            <div class="pp-note">Contact <a href="mailto:info@aivirtrix.com">info@aivirtrix.com</a> for credentials.</div>
          </div>
        </div>

        <!-- ── CANDIDATE SECTION ── -->
        <div class="pp-section" id="pp-cand">
          <div id="pp-cand-loggedin" style="display:none"></div>
          <div id="pp-cand-form">
            <div class="pp-title">Candidate <em>Portal</em></div>
            <div class="pp-sub" id="pp-cand-sub">Enter your username to continue.</div>

            <!-- Step 1: username check -->
            <div id="pp-step-un">
              <div class="pp-error" id="pp-err-un"></div>
              <div class="pp-group">
                <label class="pp-label">Username</label>
                <div class="pp-check-row">
                  <input class="pp-input" id="pp-cand-un" type="text" placeholder="Your username" oninput="PP.resetUN()"/>
                  <button class="pp-check-btn" id="pp-check-btn" onclick="PP.checkUN()">Check</button>
                </div>
                <div class="pp-un-status" id="pp-un-status"></div>
              </div>
              <button class="pp-submit secondary" id="pp-btn-proceed" style="display:none" onclick="PP.proceedToForm()">Continue →</button>
            </div>

            <!-- Step 2a: login -->
            <div id="pp-step-login" style="display:none">
              <div class="pp-error" id="pp-err-login"></div>
              <div class="pp-group">
                <label class="pp-label">Username</label>
                <input class="pp-input ok" id="pp-login-un" type="text" readonly/>
              </div>
              <div class="pp-group">
                <label class="pp-label">Password</label>
                <input class="pp-input" id="pp-login-pass" type="password" placeholder="Your password" autocomplete="current-password"/>
              </div>
              <div class="pp-row">
                <label class="pp-remember"><input type="checkbox"/> Remember me</label>
                <button class="pp-link" onclick="PP.backToUN()">← Change username</button>
              </div>
              <button class="pp-submit" onclick="PP.candLogin()">Sign In</button>
            </div>

            <!-- Step 2b: register -->
            <div id="pp-step-reg" style="display:none">
              <div class="pp-error" id="pp-err-reg"></div>
              <div class="pp-group">
                <label class="pp-label">Username</label>
                <input class="pp-input ok" id="pp-reg-un" type="text" readonly/>
              </div>
              <div class="pp-section-lbl">Set Password</div>
              <div class="pp-group">
                <label class="pp-label">Password *</label>
                <input class="pp-input" id="pp-reg-pass" type="password" placeholder="Create a password" oninput="PP.checkStrength()" autocomplete="new-password"/>
                <div class="pp-strength">
                  <div class="pp-strength-seg" id="pp-s1"></div><div class="pp-strength-seg" id="pp-s2"></div>
                  <div class="pp-strength-seg" id="pp-s3"></div><div class="pp-strength-seg" id="pp-s4"></div>
                </div>
              </div>
              <div class="pp-group">
                <label class="pp-label">Confirm Password *</label>
                <input class="pp-input" id="pp-reg-pass2" type="password" placeholder="Re-enter password" autocomplete="new-password"/>
              </div>
              <div class="pp-section-lbl">Email Address</div>
              <div class="pp-group">
                <label class="pp-label">Email *</label>
                <input class="pp-input" id="pp-reg-email" type="email" placeholder="you@example.com" autocomplete="email"/>
              </div>
              <div class="pp-group">
                <label class="pp-label">Confirm Email *</label>
                <input class="pp-input" id="pp-reg-email2" type="email" placeholder="Re-enter email"/>
              </div>
              <button class="pp-submit" onclick="PP.register()">Create Account &amp; Sign In</button>
              <div class="pp-note" style="margin-top:.7rem"><button class="pp-link" onclick="PP.backToUN()">← Use a different username</button></div>
            </div>
          </div>
        </div>

      </div><!-- /pp-body -->
    </div><!-- /pp-panel -->
  `;

  const wrapper = document.createElement('div');
  wrapper.innerHTML = html;
  document.body.appendChild(wrapper);

  /* ── PORTAL LOGIC ── */
  window.PP = {
    checkedUN: '',
    unExists: false,

    open(tab) {
      // Adjust panel top based on whether topbar is visible
      const panel = document.getElementById('pp-panel');
      const _navbar   = document.querySelector('nav#navbar');
      const _topbar   = document.getElementById('topbar');
      const _topbarH  = _topbar  ? _topbar.offsetHeight  : 0;
      const _navbarH  = _navbar  ? _navbar.offsetHeight  : 0;
      const _totalTop = _topbarH + _navbarH;
      panel.style.top    = _totalTop + 'px';
      panel.style.height = 'calc(100vh - ' + _totalTop + 'px)';
      panel.classList.add('open');
      document.getElementById('pp-backdrop').classList.add('open');
      document.querySelector('.portal-nav-btn')?.classList.add('open');
      document.body.style.overflow = 'hidden';
      if (tab) this.switchTab(tab);
      else this.refreshAuthState();
    },

    close() {
      document.getElementById('pp-panel').classList.remove('open');
      document.getElementById('pp-backdrop').classList.remove('open');
      document.querySelector('.portal-nav-btn')?.classList.remove('open');
      document.body.style.overflow = '';
    },

    switchTab(tab) {
      ['employer','candidate'].forEach(t => {
        document.getElementById('pp-tab-' + t).classList.toggle('active', t === tab);
        document.getElementById('pp-' + (t === 'employer' ? 'emp' : 'cand')).classList.toggle('visible', t === tab);
      });
      this.refreshAuthState();
    },

    refreshAuthState() {
      // Employer
      const empAuth = sessionStorage.getItem('vp_employer_auth') === 'true';
      const empLoggedIn = document.getElementById('pp-emp-loggedin');
      const empForm     = document.getElementById('pp-emp-form');
      if (empAuth) {
        empLoggedIn.style.display = 'block';
        empForm.style.display = 'none';
        empLoggedIn.innerHTML = `
          <div class="pp-logged-in">
            <div class="pp-li-icon">🏢</div>
            <div class="pp-li-name">Admin</div>
            <div class="pp-li-role">Employer Account · Signed In</div>
            <a class="pp-go-btn" href="${base}employer-dashboard.html">Go to Dashboard →</a>
            <button class="pp-logout-link" onclick="PP.empLogout()">Sign out</button>
          </div>`;
      } else {
        empLoggedIn.style.display = 'none';
        empForm.style.display = 'block';
      }

      // Candidate
      const cid = sessionStorage.getItem('vp_candidate_id');
      const cand = (typeof VPStore !== 'undefined' && cid) ? VPStore.Candidates.getById(cid) : null;
      const candLoggedIn = document.getElementById('pp-cand-loggedin');
      const candForm     = document.getElementById('pp-cand-form');
      if (cand) {
        candLoggedIn.style.display = 'block';
        candForm.style.display = 'none';
        candLoggedIn.innerHTML = `
          <div class="pp-logged-in">
            <div class="pp-li-icon">👤</div>
            <div class="pp-li-name">${cand.username}</div>
            <div class="pp-li-role">Candidate Account · Signed In</div>
            <a class="pp-go-btn" href="${base}candidate-dashboard.html">Go to Dashboard →</a>
            <button class="pp-logout-link" onclick="PP.candLogout()">Sign out</button>
          </div>`;
      } else {
        candLoggedIn.style.display = 'none';
        candForm.style.display = 'block';
      }
    },

    // EMPLOYER LOGIN
    empLogin() {
      const u = document.getElementById('pp-emp-user').value.trim();
      const p = document.getElementById('pp-emp-pass').value;
      const e = document.getElementById('pp-emp-err');
      if (!u || !p) { this.err(e, 'Please enter username and password.'); return; }
      if (u === 'admin' && p === 'vayuputra2026') {
        e.style.display = 'none';
        sessionStorage.setItem('vp_employer_auth', 'true');
        location.href = base + 'employer-dashboard.html';
      } else {
        this.err(e, 'Invalid username or password.');
        document.getElementById('pp-emp-pass').value = '';
      }
    },

    empLogout() {
      sessionStorage.removeItem('vp_employer_auth');
      this.refreshAuthState();
    },

    forgotEmp() {
      alert('Please contact info@aivirtrix.com to reset your employer password.');
    },

    // CANDIDATE - step 1
    checkUN() {
      if (typeof VPStore === 'undefined') { alert('VPStore not loaded.'); return; }
      const un = document.getElementById('pp-cand-un').value.trim();
      const e  = document.getElementById('pp-err-un');
      const st = document.getElementById('pp-un-status');
      if (!un) { this.err(e, 'Please enter a username.'); return; }
      e.style.display = 'none';
      this.checkedUN = un;
      this.unExists  = VPStore.Candidates.exists(un);
      if (this.unExists) {
        st.textContent = '✓ Username found — enter your password to sign in.';
        st.className = 'pp-un-status found';
      } else {
        st.textContent = '✦ New username — register below.';
        st.className = 'pp-un-status new-user';
      }
      document.getElementById('pp-btn-proceed').style.display = 'block';
      document.getElementById('pp-check-btn').disabled = true;
    },

    resetUN() {
      document.getElementById('pp-un-status').className = 'pp-un-status';
      document.getElementById('pp-un-status').textContent = '';
      document.getElementById('pp-btn-proceed').style.display = 'none';
      document.getElementById('pp-check-btn').disabled = false;
      this.checkedUN = '';
    },

    proceedToForm() {
      document.getElementById('pp-step-un').style.display = 'none';
      if (this.unExists) {
        document.getElementById('pp-step-login').style.display = 'block';
        document.getElementById('pp-login-un').value = this.checkedUN;
        document.getElementById('pp-cand-sub').textContent = 'Welcome back, ' + this.checkedUN + '!';
        setTimeout(() => document.getElementById('pp-login-pass').focus(), 50);
      } else {
        document.getElementById('pp-step-reg').style.display = 'block';
        document.getElementById('pp-reg-un').value = this.checkedUN;
        document.getElementById('pp-cand-sub').textContent = 'Create your candidate account.';
        setTimeout(() => document.getElementById('pp-reg-pass').focus(), 50);
      }
    },

    backToUN() {
      document.getElementById('pp-step-login').style.display = 'none';
      document.getElementById('pp-step-reg').style.display   = 'none';
      document.getElementById('pp-step-un').style.display    = 'block';
      document.getElementById('pp-cand-un').value = '';
      document.getElementById('pp-cand-sub').textContent = 'Enter your username to continue.';
      this.resetUN();
    },

    candLogin() {
      const pass = document.getElementById('pp-login-pass').value;
      const e    = document.getElementById('pp-err-login');
      if (!pass) { this.err(e, 'Please enter your password.'); return; }
      const r = VPStore.Candidates.login(this.checkedUN, pass);
      if (r.ok) {
        e.style.display = 'none';
        sessionStorage.setItem('vp_candidate_id', r.candidate.id);
        location.href = base + 'candidate-dashboard.html';
      } else {
        this.err(e, r.error);
        document.getElementById('pp-login-pass').value = '';
      }
    },

    register() {
      const pass   = document.getElementById('pp-reg-pass').value;
      const pass2  = document.getElementById('pp-reg-pass2').value;
      const email  = document.getElementById('pp-reg-email').value.trim();
      const email2 = document.getElementById('pp-reg-email2').value.trim();
      const e      = document.getElementById('pp-err-reg');
      if (!pass)           { this.err(e, 'Please enter a password.'); return; }
      if (pass.length < 6) { this.err(e, 'Password must be at least 6 characters.'); return; }
      if (pass !== pass2)  { this.err(e, 'Passwords do not match.'); return; }
      if (!email)          { this.err(e, 'Please enter your email.'); return; }
      if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { this.err(e, 'Please enter a valid email.'); return; }
      if (email.toLowerCase() !== email2.toLowerCase()) { this.err(e, 'Email addresses do not match.'); return; }
      const r = VPStore.Candidates.register({ username: this.checkedUN, password: pass, email });
      if (r.ok) {
        e.style.display = 'none';
        sessionStorage.setItem('vp_candidate_id', r.candidate.id);
        location.href = base + 'candidate-dashboard.html';
      } else {
        this.err(e, r.error);
      }
    },

    candLogout() {
      sessionStorage.removeItem('vp_candidate_id');
      this.refreshAuthState();
      this.backToUN();
    },

    checkStrength() {
      const p = document.getElementById('pp-reg-pass').value;
      ['pp-s1','pp-s2','pp-s3','pp-s4'].forEach(id => { document.getElementById(id).className = 'pp-strength-seg'; });
      if (!p) return;
      let score = 0;
      if (p.length >= 6) score++;
      if (p.length >= 10) score++;
      if (/[A-Z]/.test(p) && /[0-9]/.test(p)) score++;
      if (/[^A-Za-z0-9]/.test(p)) score++;
      const cls = score <= 1 ? 'weak' : score === 2 ? 'fair' : 'good';
      for (let i = 0; i < score; i++) document.getElementById('pp-s' + (i+1)).classList.add(cls);
    },

    err(el, msg) { el.textContent = msg; el.style.display = 'block'; },
  };

  // Wire close button and backdrop
  document.getElementById('pp-close').addEventListener('click', () => PP.close());
  document.getElementById('pp-backdrop').addEventListener('click', () => PP.close());

  // Keyboard: Enter key support
  document.addEventListener('keydown', ev => {
    if (ev.key === 'Escape') { PP.close(); return; }
    if (ev.key !== 'Enter') return;
    const panel = document.getElementById('pp-panel');
    if (!panel.classList.contains('open')) return;
    const empVisible = document.getElementById('pp-emp').classList.contains('visible');
    if (empVisible) { PP.empLogin(); return; }
    if (document.getElementById('pp-step-login').style.display === 'block') { PP.candLogin(); return; }
    if (document.getElementById('pp-step-reg').style.display === 'block')   { PP.register();  return; }
    if (document.getElementById('pp-btn-proceed').style.display === 'block') { PP.proceedToForm(); return; }
    PP.checkUN();
  });

})();
