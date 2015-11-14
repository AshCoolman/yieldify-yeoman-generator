# Yieldify yeoman generator

Used to capture any scaffolding we do at Yieldify, and no gaurantees are being made for its completeness outside of the Yieldify context (or even within it).

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
  },
```
### Examples

### An angular 1 service (and module) SLIGHTLY OUTDATED

In terminal cd to project root and type:

```terminal
$ yo yiang tables/campaign-grid-columns
```

This should appear:

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


Module name: tables/campaign-grid-columns


[?] Compose build list from:
  (a)ll
  (d)irective
  (c)ontroller
  (s)service (factory)

  default: a
```

Here select "s", and you can see the files that are created

```terminal
   create app/src/ng-components/tables/campaign-grid-columns/campaign-grid-columns.coffee
   create app/src/ng-components/tables/campaign-grid-columns/campaign-grid-columns.service.coffee
```


`campaign-grid-columns.coffee` is a single module file (always created)

```coffeescript
angular
    .module 'app.tables.campaign-grid-columns', [
    # Dependencies
    ]
```

`campaign-grid-columns.service.coffee` is a service (Factory) file

```coffeescript
CampaignGridColumnsService = ->

    # PRIVATE
    __private = {

    }

    # PUBLIC
    
    
    # INTERFACE
    {
        __private
    }

angular
    .module 'app.tables.campaign-grid-columns'
    .factory 'campaignGridColumnsService', CampaignGridColumnsService

###*
 * campaignGridColumnsService
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
