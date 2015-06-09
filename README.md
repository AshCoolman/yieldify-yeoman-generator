# Yi-ang
_Highly opinionated, and simlple generator for the yieldify dashboard_

## Installation

Currently this isn't a proper module that you can `npm i`, so for the time being:

1. Clone the repo onto your hard drive
2. Terminal: cd into the `generator-yiang` folder
3. Terminal:  `npm link` - (makes this folder act like a globally installed npm module)

## How it works

### Before you do anything

1. Go into yiang/packages.json
2. Add "ngSrcDir": "<root dir of angular components for project>"
    e.g. "app/src/ng-components" for dashboard

### Examples

### Just a service (and module)

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

* Generate a gulpfile (or equivalent)





# _Default readme for generators below_


# generator-yiang [![Build Status](https://secure.travis-ci.org/AshCoolman/generator-yiang.png?branch=master)](https://travis-ci.org/AshCoolman/generator-yiang)

> [Yeoman](http://yeoman.io) generator


## Getting Started

### What is Yeoman?

Trick question. It's not a thing. It's this guy:

![](http://i.imgur.com/JHaAlBJ.png)

Basically, he wears a top hat, lives in your computer, and waits for you to tell him what kind of application you wish to create.

Not every new computer comes with a Yeoman pre-installed. He lives in the [npm](https://npmjs.org) package repository. You only have to ask for him once, then he packs up and moves into your hard drive. *Make sure you clean up, he likes new and shiny things.*

```bash
npm install -g yo
```

### Yeoman Generators

Yeoman travels light. He didn't pack any generators when he moved in. You can think of a generator like a plug-in. You get to choose what type of application you wish to create, such as a Backbone application or even a Chrome extension.

To install generator-yiang from npm, run:

```bash
npm install -g generator-yiang
```

Finally, initiate the generator:

```bash
yo yiang
```

### Getting To Know Yeoman

Yeoman has a heart of gold. He's a person with feelings and opinions, but he's very easy to work with. If you think he's too opinionated, he can be easily convinced.

If you'd like to get to know Yeoman better and meet some of his friends, [Grunt](http://gruntjs.com) and [Bower](http://bower.io), check out the complete [Getting Started Guide](https://github.com/yeoman/yeoman/wiki/Getting-Started).


## License

MIT
