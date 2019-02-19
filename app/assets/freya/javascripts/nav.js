$(document).on('click', '.nav__item--submenu > a', function(e) {
  e.preventDefault()

  $(this).parent().toggleClass('open')
})

$(document).on('turbolinks:before-cache', function() {
  console.log('hei')
  $('.nav__item--submenu.open').removeClass('open')
})