# Banana example

This is just a really quick and simple plugin I whipped up to showcase some of banana's functionality

The following screenshots are of the plugin ui:

Home page:

![homepage](./assets/img/home.png)

Install page:

![install](./assets/img/install.png)

View thing page:

![view](./assets/img/view.png)

## Install

To install with lazy.nvim, just use:

```lua
{
    "CWood-sdf/banana-example",
    dependencies = { "CWood-sdf/banana.nvim" },
    opts = {}
}
```

Then run it with the command: `InstallThings`

## Banana Features

The main features it shows are:

- Flex rendering (the topbar is controlled with display:flex and flex-grow:1)
- loadNmlTo (currently the system is a bit clunky and will probably be actually designed in banana 0.2)
- api separation (see note below)
- components with banana (the banana/installer/\_plugin_el.nml file is a reusable component)

In my opinion, it is _MUCH_ more obvious what each page of the ui is going to look like than in a regular neovim plugin.

## On api separation

In my opinion, all the best neovim plugins that manage some sort of state should have three api components:

1. A good lua api
2. A good command api
3. An easy way to manipulate data in a ui

A good command api should probably follow a good lua api because the command api will just be calling into the lua api. Banana does its best to separate the api code that can very easily be overly integrated with the ui code; this separation is very easy to do with abanana because the nml scripts must be at least partially separated from the actual api code.
