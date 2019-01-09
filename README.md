# Freya

this is a temporary readme, just to guide the developers of what is and isn't on Freya yet.

## Dependencies

- [jQuery](https://jquery.com/)
- [Material Icons](https://fonts.googleapis.com/icon?family=Material+Icons)

## Summary

- [Components](#components)
- [Lists](#lists)
- [Modal](#modal)
- [Utils](#utils)
- [Text Styles](#text-styles)

## Components

### Lists

right now we have only one list style. Maybe this will change on the future, maybe not, but let's talk about this one list here. In how to use it to be more specific. You will need only 3 classes for that:

```sh
	<ul class='list-unstyled list'>
		<li class="list__item">
			<a href="#">I'm a item of a list</a>
		</li>
	</ul>
```

another thing you can do is put a arrow icon in the end (this is not a component or different list or anything but I think is really cool)

```sh
	<ul class='list-unstyled list'>
		<li class="list__item">
			<%= link_to some_path(some_path[:id]) do %>
				<div  class="list__item">
					<%= @some_name  %>
					<i class="material-icons icon icon--right">chevron_right</i>
				</div>
			<%  end  %>
		</li>
	</ul>
```

### Modal

Create and open a modal is really simple on freya. First you have to put the modal div on the page you want it to open:

```sh
<div class="modal-overlay"></div> <!-- this is the overlay of the modal -->

<div class="modal modal--right"> <!-- the modal class and direction to open -->
	<div class="modal__body"></div> <!-- modal body, where the content should be put in -->
</div>
```

To open a modal on click, you should put this on the link you want it to open the modal:

```sh
    data-action='open-modal'
```

Example:

```sh
  <%= link_to "some link",some_path, "data-action": 'open-modal', "data-load": 'load-modal-data' %>
```

## Utils

### Text Styles

This will contain the general styles for titles, subtitles, paragraphs and etc. Right now, we have only the title and It has a really simple use:

```sh
  <h1 class="text-title">This is a title</h1>
```

By default, the _text-title_ class has a medium size space on the bottom, but you can change that with the [Space Styles](#space-styles).

If you want a little more _fancy_ title, you can put a separator on it. It's really classy.

```sh
  <h1 class="text-title text-title--separator">I'm a title and I have a beautiful separator</h1>
```
