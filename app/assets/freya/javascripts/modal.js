$(document).on('click', "[data-action='open-modal']", function(e) {
  e.preventDefault();
  $('.modal-overlay').addClass('modal-overlay--visible');
  $('.modal').addClass('modal--open');
});

$(document).on('click', '.modal-overlay', function() {
  closeModals()
});

function closeModals() {
  $('.modal').removeClass('modal--open');
  $('.modal-overlay').removeClass('modal-overlay--visible');
}

