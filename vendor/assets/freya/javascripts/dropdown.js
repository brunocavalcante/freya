$(document).on('click', '.dropdown--toggable .dropdown__toggle', function(e) {
  dropdown = $(this).parents('.dropdown')
  if ($(dropdown).hasClass('open')) {
    $(dropdown).removeClass('open')
  } else {
    $('.dropdown--toggable.open').removeClass('open')
    $(dropdown).addClass('open fadeInDown')
    if ($(dropdown).hasClass('dropdown--selectable')) {
      select2 = $(dropdown).find('select').data('select2')
      if (select2) {
        select2.open()
      }
    }
  }
  
  return false
})

$.fn.bindFirst = function(name, fn) {
  var elem, handlers, i, _len;
  this.bind(name, fn);
  for (i = 0, _len = this.length; i < _len; i++) {
    elem = this[i];
    handlers = jQuery._data(elem).events[name.split('.')[0]];
    handlers.unshift(handlers.pop());
  }
};

$(document).on('click', '.dropdown--toggable.open', function(e) {
  e.stopPropagation();
})

$(window).bindFirst('click',function() {
  $('.dropdown--toggable.open').removeClass('open')
  $('#ticket-tag-editor').hide()
});
$(document).on('select2:closing', function() {
  $('.dropdown--toggable.open').removeClass('open')
});