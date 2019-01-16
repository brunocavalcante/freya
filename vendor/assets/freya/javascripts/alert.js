$(document).on('turbolinks:load ready', function() {
  setTimeout(function () {
    console.log('hei')
    $('.alert.alert--app.alert--success').fadeOut('fast')
  }, 3000);
})