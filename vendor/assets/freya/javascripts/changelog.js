$(document).on('click', '.changelog__item', function(e) {
  e.preventDefault()

  $(this).find('.changelog__details').toggleClass('hide')
})