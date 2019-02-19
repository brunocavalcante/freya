$(document).on('turbolinks:load ready', function() {
  setTimeout(function () {
    $('.alert.alert--app.alert--success').fadeOut('fast')
  }, 3000);
})