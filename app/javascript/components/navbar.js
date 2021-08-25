const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.transparent');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight /2) {
        navbar.classList.remove('transparent');
      } else {
        navbar.classList.add('transparent');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
