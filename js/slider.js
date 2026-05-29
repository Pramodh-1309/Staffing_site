/* ============================================================
   slider.js — Hero Slider & Testimonial Carousel
   Aivirtrix
   ============================================================ */

document.addEventListener('DOMContentLoaded', function () {

  /* ── HERO BANNER SLIDER ── */
  const slides     = document.querySelectorAll('.hero-slide');
  const dots       = document.querySelectorAll('.slide-dot');
  const prevBtn    = document.getElementById('slidePrev');
  const nextBtn    = document.getElementById('slideNext');
  let   current    = 0;
  let   autoTimer  = null;

  if (slides.length > 1) {

    function goTo(index) {
      slides[current].classList.remove('active');
      if (dots[current]) dots[current].classList.remove('active');
      current = (index + slides.length) % slides.length;
      slides[current].classList.add('active');
      if (dots[current]) dots[current].classList.add('active');
    }

    function startAuto() {
      autoTimer = setInterval(function () { goTo(current + 1); }, 5000);
    }

    function stopAuto() {
      clearInterval(autoTimer);
    }

    // Dot clicks
    dots.forEach(function (dot, i) {
      dot.addEventListener('click', function () {
        stopAuto(); goTo(i); startAuto();
      });
    });

    // Arrow clicks
    if (prevBtn) prevBtn.addEventListener('click', function () {
      stopAuto(); goTo(current - 1); startAuto();
    });
    if (nextBtn) nextBtn.addEventListener('click', function () {
      stopAuto(); goTo(current + 1); startAuto();
    });

    // Touch swipe
    let touchStartX = 0;
    const heroEl = document.getElementById('heroSlider');
    if (heroEl) {
      heroEl.addEventListener('touchstart', function (e) {
        touchStartX = e.changedTouches[0].screenX;
      }, { passive: true });

      heroEl.addEventListener('touchend', function (e) {
        const diff = touchStartX - e.changedTouches[0].screenX;
        if (Math.abs(diff) > 50) {
          stopAuto();
          goTo(diff > 0 ? current + 1 : current - 1);
          startAuto();
        }
      }, { passive: true });
    }

    // Init
    slides[0].classList.add('active');
    if (dots[0]) dots[0].classList.add('active');
    startAuto();
  }


  /* ── PRODUCT TABS ── */
  const tabBtns    = document.querySelectorAll('.tab-btn');
  const tabPanels  = document.querySelectorAll('.tab-panel');

  if (tabBtns.length > 0) {
    tabBtns.forEach(function (btn) {
      btn.addEventListener('click', function () {
        const target = btn.getAttribute('data-tab');

        tabBtns.forEach(function (b)   { b.classList.remove('active'); });
        tabPanels.forEach(function (p) { p.classList.remove('active'); });

        btn.classList.add('active');
        const panel = document.getElementById('tab-' + target);
        if (panel) panel.classList.add('active');
      });
    });

    // Init first tab
    tabBtns[0].classList.add('active');
    if (tabPanels[0]) tabPanels[0].classList.add('active');
  }


  /* ── LIGHTBOX for product images ── */
  const lightbox    = document.getElementById('lightbox');
  const lightboxImg = document.getElementById('lightboxImg');
  const lightboxClose = document.getElementById('lightboxClose');

  if (lightbox && lightboxImg) {
    document.querySelectorAll('[data-lightbox]').forEach(function (el) {
      el.addEventListener('click', function () {
        lightboxImg.src = el.getAttribute('data-lightbox');
        lightbox.style.display = 'flex';
        document.body.style.overflow = 'hidden';
      });
    });

    function closeLightbox() {
      lightbox.style.display = 'none';
      lightboxImg.src = '';
      document.body.style.overflow = '';
    }

    if (lightboxClose) lightboxClose.addEventListener('click', closeLightbox);
    lightbox.addEventListener('click', function (e) {
      if (e.target === lightbox) closeLightbox();
    });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') closeLightbox();
    });
  }

});
