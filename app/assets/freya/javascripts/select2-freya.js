$(document).on('turbolinks:load formDisplayed displayTicketModal', function() {
  $('select:not(.selectized)').select2({width: '100%'})
})

$(document).on('turbolinks:before-cache', function() {
  $('.select2-hidden-accessible').select2('destroy')
})

$(document).on('change', 'select', function() {
  form = $(this).parents('form')[0]
  if (form && form.ClientSideValidations) {
    $(this).isValid(form.ClientSideValidations.settings.validators)
  }
})