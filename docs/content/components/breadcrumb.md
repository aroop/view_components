---
title: Breadcrumb
status: Beta
source: https://github.com/primer/view_components/tree/main/app/components/primer/breadcrumb_component.rb
storybook: https://primer.style/view-components/stories/?path=/story/primer-breadcrumb-component
---

import Example from '../../src/@primer/gatsby-theme-doctocat/components/example'

<!-- Warning: AUTO-GENERATED file, do not edit. Add code comments to your Ruby instead <3 -->

Use `Breadcrumb` to display page hierarchy within a section of the site. All of the items in the breadcrumb "trail" are links except for the final item, which is a plain string indicating the current page.

## Examples

### Basic

<Example src="<nav aria-label='Breadcrumb'>  <ol>      <li class='breadcrumb-item'><a href='/'>Home</a></li>      <li class='breadcrumb-item'><a href='/about'>About</a></li>      <li aria-current='page' class='breadcrumb-item'>Team</li>  </ol></nav>" />

```erb
<%= render(Primer::BreadcrumbComponent.new) do |component| %>
  <% component.item(href: "/") do %>Home<% end %>
  <% component.item(href: "/about") do %>About<% end %>
  <% component.item(selected: true) do %>Team<% end %>
<% end %>
```

## Arguments

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

## Slots

### `Items`

_Note: if both `href` and `selected: true` are passed in, `href` will be ignored and the item will not be rendered as a link._

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `href` | `String` | N/A | The URL to link to. |
| `selected` | `Boolean` | N/A | Whether or not the item is selected and not rendered as a link. |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |
