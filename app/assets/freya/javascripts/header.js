$(document).on('click', '.header__menu-toggle', function(e) {
  e.preventDefault()
  $('body').toggleClass('overflow-hidden');
  $("#menu").toggleClass('nav--open');
})