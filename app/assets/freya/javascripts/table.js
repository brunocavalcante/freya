$(document).on('click', '.table--singleaction td', function(e) {
  if (e.target.tagName.toLowerCase() != 'a') {
    console.log('Looking a link...')
    window.location = $(this).parent().find('a').attr('href')
  } else {
    console.log('Clicked on a link.')
  }
})