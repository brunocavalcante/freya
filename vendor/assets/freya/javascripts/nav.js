$(document).on('click', '.nav__item--submenu > a', function(e) {
  e.preventDefault()

  $(this).parent().toggleClass('open')
})