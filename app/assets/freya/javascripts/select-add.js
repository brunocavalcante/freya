$(document).on('ready turbolinks:load', function() {
  $('.embedded-form form').each(function(i, form) {
    $(form).attr('data-remote', true)
    $(form).on('ajax:success', function(event, data) {
      $(this).trigger('reset')
      var resourceName = $(this).data('resource')
      closeModals()
    }).on('ajax:error', function(event, data) {
      $(this).parent().html(data.responseText)
    })
  })
})

// Get the right link to open modal
$(document).on('click', '.select-add__toggle', function(e) {
  e.preventDefault()
  klass = $(this).data('target')
  $('._' + klass + '.modal').addClass('modal--open')
  $('._' + klass + '.modal-overlay').addClass('modal-overlay--visible')
})