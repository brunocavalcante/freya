# Freya

this is a temporary readme, just to guide the developers of what is and isn't on Freya yet.

## Dependencies

- [jQuery](https://jquery.com/)
- [Material Icons](https://fonts.googleapis.com/icon?family=Material+Icons)

## Summary

- [Components](#components)
  -- [Lists](#lists)
  -- [Modal](#modal)
- [Utils](#utils)
  -- [Space Styles](#space-styles)

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

### Space Styles

Sometimes you just need some space. And no one has time to be creating classes just because you want that div to be a little bit far away from the others divs. You know, these divs these days, you can not trust it to be so close to YOUR div. Anyway, jokes aside, we got you covered ;)

We have some default spaces, so you can just pick what you want on your need. This sizes are:

- small: 10px
- medium: 20px
- big: 60px

To use it you just need to put the class space + size + side. A little example, since that can be a little confusing:

```sh
  <h1 class="space__medium--left">This put a medium size space on the left side of this element</h1>
```

But if I want to put a space in both sides of a element? If I want to put it on ALL sides of the element? Oh, don't worry, we thought about that too

```sh
	<div class="space__medium--vertical">I'm putting a medium size space on the top and bottom of this div</div>
	<div class="space__small">I'm putting a small size space on ALL sides of this div</div>
```
