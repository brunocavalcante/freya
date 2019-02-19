$(document).on('click', '.changelog__item', function(e) {
  e.preventDefault()
  $(this).toggleClass('changelog__item--active')
})