/* ============================================================
   main.js — Core Interactivity for Aivirtrix
   Handles: Navbar scroll, mobile menu, scroll reveal, active link
   ============================================================ */

document.addEventListener('DOMContentLoaded', function () {

/* ── 1. STICKY NAVBAR + TOPBAR ── */
  const navbar  = document.getElementById('navbar');
  const topbar  = document.getElementById('topbar');
  const topbarH = topbar ? topbar.offsetHeight : 0;

  if (navbar) {
    window.addEventListener('scroll', function () {
      navbar.classList.toggle('scrolled', window.scrollY > 60);

      if (topbar) {
        if (window.scrollY > topbarH) {
          topbar.classList.add('hidden');
          navbar.classList.add('topbar-hidden');
        } else {
          topbar.classList.remove('hidden');
          navbar.classList.remove('topbar-hidden');
        }
      }
    });
  }


  /* ── 2. MOBILE MENU ── */
  const hamburger  = document.getElementById('hamburger');
  const mobileMenu = document.getElementById('mobileMenu');
  const closeMenu  = document.getElementById('closeMenu');

  if (hamburger && mobileMenu) {

    hamburger.addEventListener('click', function () {
      hamburger.classList.toggle('open');
      mobileMenu.classList.toggle('open');
      document.body.style.overflow = mobileMenu.classList.contains('open') ? 'hidden' : '';
    });

    if (closeMenu) {
      closeMenu.addEventListener('click', function () {
        hamburger.classList.remove('open');
        mobileMenu.classList.remove('open');
        document.body.style.overflow = '';
      });
    }

    // Close on link click
    mobileMenu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', function () {
        hamburger.classList.remove('open');
        mobileMenu.classList.remove('open');
        document.body.style.overflow = '';
      });
    });
  }


  /* ── 3. SCROLL REVEAL ── */
  const revealEls = document.querySelectorAll('.reveal');

  if (revealEls.length > 0 && 'IntersectionObserver' in window) {
    const observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
          observer.unobserve(entry.target);
        }
      });
    }, {
      threshold: 0.1,
      rootMargin: '0px 0px -60px 0px'
    });

    revealEls.forEach(function (el) {
      observer.observe(el);
    });
  } else {
    // Fallback: show all immediately
    revealEls.forEach(function (el) {
      el.classList.add('visible');
    });
  }


  /* ── 4. ACTIVE NAV LINK ── */
  const currentPath = window.location.pathname.split('/').pop();
  const navLinks = document.querySelectorAll('.nav-links a');

  navLinks.forEach(function (link) {
    const href = link.getAttribute('href').split('/').pop().split('#')[0];
    if (href === currentPath || (currentPath === '' && href === 'index.html')) {
      link.classList.add('active');
    }
  });


  /* ── 5. SMOOTH SCROLL for anchor links ── */
  document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
    anchor.addEventListener('click', function (e) {
      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        e.preventDefault();
        const navHeight = navbar ? navbar.offsetHeight : 80;
        const top = target.getBoundingClientRect().top + window.scrollY - navHeight;
        window.scrollTo({ top: top, behavior: 'smooth' });
      }
    });
  });


  /* ── 6. COUNTER ANIMATION (for stat numbers on home page) ── */
  function animateCounter(el) {
    const target = parseInt(el.getAttribute('data-target'), 10);
    if (isNaN(target)) return;
    const duration = 1800;
    const step = target / (duration / 16);
    let current = 0;

    const timer = setInterval(function () {
      current += step;
      if (current >= target) {
        current = target;
        clearInterval(timer);
      }
      el.textContent = Math.floor(current) + (el.getAttribute('data-suffix') || '');
    }, 16);
  }

  const counters = document.querySelectorAll('[data-target]');
  if (counters.length > 0 && 'IntersectionObserver' in window) {
    const counterObserver = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          animateCounter(entry.target);
          counterObserver.unobserve(entry.target);
        }
      });
    }, { threshold: 0.5 });

    counters.forEach(function (c) { counterObserver.observe(c); });
  }


  /* ── 7. BACK TO TOP BUTTON ── */
  const backBtn = document.getElementById('backToTop');
  if (backBtn) {
    window.addEventListener('scroll', function () {
      backBtn.style.opacity = window.scrollY > 400 ? '1' : '0';
      backBtn.style.pointerEvents = window.scrollY > 400 ? 'auto' : 'none';
    });
    backBtn.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

});
