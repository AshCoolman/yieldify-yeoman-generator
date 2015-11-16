# Yieldify Yeoman generator

This project is used to capture any scaffolding we do at Yieldify, and no gaurantees are being made for its completeness outside of the Yieldify context (or even within it).

_Highly opinionated, and simlple generator for the yieldify dashboard_

## Installation

Currently this isn't a proper module that you can't `npm i`, so for the time being:

1. Clone the repo onto your hard drive
2. Terminal: cd into the `generator-yiang` folder
3. Terminal:  `npm link` - (makes this folder act like a globally installed npm module)

## How it works

### Config

This components looks for configuration in its current folder's `package.json`. If it can't find any, it will fallback to the defaults contained in its own package:

```json
  "yeoman-yieldify": {
    "angular1": {
      "components": "app/src/ng1",
      "e2e": "test/e2e/ng1",
      "inbro": "test/inbro/ng1"
    },
    "angular2": {
      "components": "app/src/ng2",
      "e2e": "test/e2e/ng2",
      "inbro": "test/inbro/ng2"
    }
  }
```
### Examples

### An angular 1 service (and module) SLIGHTLY OUTDATED

In terminal cd to project root and type:

```terminal
$ yo yiang a-parent-component/a-child-component
```

You will be asked first to choose your scaffold type:

```terminal


     _-----_
    |       |    .--------------------------.
    |--(o)--|    |    Welcome to Yiang -    |
   `---------´   |  yieldifys ng generator! |
    ( _´U`_ )    '--------------------------'
    /___A___\
     |  ~  |
   __'.___.'__
 ´   `  |° ´ Y `


"yeoman-yieldify" not found in /Users/ashleycoleman/test/package.json, using defaults:

{
  "angular1": {
    "components": "app/src/ng1",
    "e2e": "test/e2e/ng1",
    "inbro": "test/inbro/ng1"
  },
  "angular2": {
    "components": "app/src/ng2",
    "e2e": "test/e2e/ng2",
    "inbro": "test/inbro/ng2"
  }
}
Module name: a-parent-component/a-child-component

? What type of scaffold:

  (1). Angular 1
  (2). Angular 2
  (3). New javascript project

  default: 1
```

Here angular 1 has been chosen by entering `1`. Now we choose which componnet to create

```terminal
? Compose build list from:

  Angular 1:

    (a)ll
    (C)ONSTANT
    (v)alue
    (d)irective
    (t)emplate
    (c)ontroller
    (s)ervice (factory)
    (p)rovider (service)
    (m)odule only

    (e)2e dom handle
    (x)xecute e2e script

    (i)nbro action


  default: s
```
We choose a _service (factory)_ component by pressing  "s", and our files are created:

```terminal
   create app/src/ng1/a-parent-component/a-child-component/a-child-component.coffee
   create app/src/ng1/a-parent-component/a-child-component/a-child-component.service.coffee
```

We now have the following folders and files:

```
.
└── app
    └── src
        └── ng1
            └── a-parent-component
                └── a-child-component
                    ├── a-child-component.coffee
                    └── a-child-component.service.coffee
```


`a-child-component.coffee` is a single module file (always created for angular 1)

```coffeescript
angular
    .module 'app.a-parent-component.a-child-component', [
        # Dependencies
    ]
```

`campaign-grid-columns.service.coffee` is a service (Factory) file

```coffeescript
aChildComponentService = ->

    # PRIVATE
    __private = {

    }

    # PUBLIC
    
    
    # INTERFACE
    {
        __private
    }

angular
    .module 'app.a-parent-component.a-child-component'
    .factory 'aChildComponentService', aChildComponentService

###*
 * aChildComponentService
 * 
 * Private functions prepended with "_" and put in"__private" for testing easy testing
###
```

## Roadmap

* New javascript project generation
* Angular 2: Generate a build system (or equivalent) and other builds files
* Angular 1: Generate a gulpfile (or equivalent) and other builds files
* Split out generators into their own repository

## Lisence

MIT
