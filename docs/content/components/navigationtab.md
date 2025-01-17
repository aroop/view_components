---
title: NavigationTab
status: Alpha
source: https://github.com/primer/view_components/tree/main/app/components/primer/tab_component.rb
storybook: https://primer.style/view-components/stories/?path=/story/primer-navigation-tab-component
---

import Example from '../../src/@primer/gatsby-theme-doctocat/components/example'

<!-- Warning: AUTO-GENERATED file, do not edit. Add code comments to your Ruby instead <3 -->

This component is part of navigation components such as `Primer::TabNavComponent`
and `Primer::UnderlineNavComponent` and should not be used by itself.

## Examples

### Default

<Example src="  <a aria-current='page'>          <span>Selected</span>    </a>  <a>          <span>Not selected</span>    </a>" />

```erb
<%= render(Primer::Navigation::TabComponent.new(selected: true)) do |c| %>
  <% c.text { "Selected" } %>
<% end %>
<%= render(Primer::Navigation::TabComponent.new) do |c| %>
  <% c.text { "Not selected" } %>
<% end %>
```

### With icons and counters

<Example src="  <a>    <svg aria-hidden='true' viewBox='0 0 16 16' version='1.1' height='16' width='16' class='octicon octicon-star'><path fill-rule='evenodd' d='M8 .25a.75.75 0 01.673.418l1.882 3.815 4.21.612a.75.75 0 01.416 1.279l-3.046 2.97.719 4.192a.75.75 0 01-1.088.791L8 12.347l-3.766 1.98a.75.75 0 01-1.088-.79l.72-4.194L.818 6.374a.75.75 0 01.416-1.28l4.21-.611L7.327.668A.75.75 0 018 .25zm0 2.445L6.615 5.5a.75.75 0 01-.564.41l-3.097.45 2.24 2.184a.75.75 0 01.216.664l-.528 3.084 2.769-1.456a.75.75 0 01.698 0l2.77 1.456-.53-3.084a.75.75 0 01.216-.664l2.24-2.183-3.096-.45a.75.75 0 01-.564-.41L8 2.694v.001z'></path></svg>      <span>Tab</span>    </a>  <a>    <svg aria-hidden='true' viewBox='0 0 16 16' version='1.1' height='16' width='16' class='octicon octicon-star'><path fill-rule='evenodd' d='M8 .25a.75.75 0 01.673.418l1.882 3.815 4.21.612a.75.75 0 01.416 1.279l-3.046 2.97.719 4.192a.75.75 0 01-1.088.791L8 12.347l-3.766 1.98a.75.75 0 01-1.088-.79l.72-4.194L.818 6.374a.75.75 0 01.416-1.28l4.21-.611L7.327.668A.75.75 0 018 .25zm0 2.445L6.615 5.5a.75.75 0 01-.564.41l-3.097.45 2.24 2.184a.75.75 0 01.216.664l-.528 3.084 2.769-1.456a.75.75 0 01.698 0l2.77 1.456-.53-3.084a.75.75 0 01.216-.664l2.24-2.183-3.096-.45a.75.75 0 01-.564-.41L8 2.694v.001z'></path></svg>      <span>Tab</span>    <span title='10' class='Counter'>10</span></a>  <a>          <span>Tab</span>    <span title='10' class='Counter'>10</span></a>" />

```erb
<%= render(Primer::Navigation::TabComponent.new) do |c| %>
  <% c.icon(:star) %>
  <% c.text { "Tab" } %>
<% end %>
<%= render(Primer::Navigation::TabComponent.new) do |c| %>
  <% c.icon(:star) %>
  <% c.text { "Tab" } %>
  <% c.counter(count: 10) %>
<% end %>
<%= render(Primer::Navigation::TabComponent.new) do |c| %>
  <% c.text { "Tab" } %>
  <% c.counter(count: 10) %>
<% end %>
```

### Inside a list

<Example src="<li class='d-flex'>  <a>          <span>Tab</span>    </a></li>" />

```erb
<%= render(Primer::Navigation::TabComponent.new(list: true)) do |c| %>
  <% c.text { "Tab" } %>
<% end %>
```

### With custom HTML

<Example src="  <a>            <div>    This is my <strong>custom HTML</strong>  </div>    </a>" />

```erb
<%= render(Primer::Navigation::TabComponent.new) do %>
  <div>
    This is my <strong>custom HTML</strong>
  </div>
<% end %>
```

## Arguments

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `list` | `Boolean` | `false` | Whether the Tab is an item in a `<ul>` list. |
| `selected` | `Boolean` | `false` | Whether the Tab is selected or not. |
| `with_panel` | `Boolean` | `false` | Whether the Tab has an associated panel. |
| `icon_classes` | `Boolean` | `""` | Classes that must always be applied to icons. |
| `wrapper_arguments` | `Hash` | `{}` | [System arguments](/system-arguments) to be used in the `<li>` wrapper when the tab is an item in a list. |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

## Slots

### `Panel`

Panel controlled by the Tab. This will not render anything in the tab itself.
It will provide a accessor for the Tab's parent to call and render the panel
content in the appropriate place.
Refer to `UnderlineNavComponent` and `TabNavComponent` implementations for examples.

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `system_arguments` | `Hash` | N/A | [System arguments](/system-arguments) |

### `Icon`

Icon to be rendered in the Tab left.

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `kwargs` | `Hash` | N/A | The same arguments as [Octicon](/components/octicon). |

### `Text`

The Tab's text.

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `kwargs` | `Hash` | N/A | The same arguments as [Text](/components/text). |

### `Counter`

Counter to be rendered in the Tab right.

| Name | Type | Default | Description |
| :- | :- | :- | :- |
| `kwargs` | `Hash` | N/A | The same arguments as [Counter](/components/counter). |
