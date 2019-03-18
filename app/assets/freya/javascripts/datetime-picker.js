$(document).on('turbolinks:load', function() {
  $('input[type=datetime-local]').flatpickr({
    enableTime: true
  })
})