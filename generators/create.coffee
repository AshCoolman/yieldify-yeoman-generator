# These are used to extend `NamedBase`

changeCase = require 'change-case'
_ = require 'lodash'

getNames = (fullName)-> 
    fileLoc = fullName
    bits = fullName.split '/'
    module = bits.join '.'
    rootLoc = bits.map(-> '..').join('/') or './'
    component = bits.pop()
    {
        name_dash: component
        name_pascal: changeCase.pascal component
        name_camel: changeCase.camel component
        module: module
        file_loc: fileLoc
        root_loc: rootLoc
    }

getNamesNg2 = (fullName, componentDir)-> 
    bits = fullName.split '/'
    component = bits.pop()
    fileLoc = bits.join('/') or '/'
    {
        name_dash: component
        name_pascal: changeCase.pascal component
        name_camel: changeCase.camel component
        fileLoc: componentDir + '/' + fileLoc + '/' + component
        moduleLoc: './' + fileLoc + '/' + component
    }

module.exports = {
    getNames: getNames
    getNamesNg2: getNamesNg2
    module: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            console.log 'process.cwd()', process.cwd()
            @template '_xx-xx.coffee', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.coffee', context
            return
    constant: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.constant.coffee', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.constant.coffee', context
            return

    value: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.value.coffee', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.value.coffee', context
            return
    directive: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.directive.coffee', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.directive.coffee', context
            return
    template: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.template.jade', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.template.jade', context
            return
    style: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.style.styl', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.style.styl', context
            return
    controller: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.controller.coffee', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.controller.coffee', context
            return
    service: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.service.coffee', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.service.coffee', context
            return
    provider: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.provider.coffee', process.cwd()+context.components + '/' + context.file_loc + '/' + context.name_dash + '.provider.coffee', context
            return
    e2e: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.e2e.dom.coffee', process.cwd()+context.e2e + '/' + context.file_loc + '/' + context.name_dash + '.e2e.dom.coffee', context
            return
    inbroAction: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.action.coffee', process.cwd()+context.inbro + '/' + context.file_loc + '/' + context.name_dash + '.action.coffee', context
            return

    ng2Basic: (options) -> 
        ->  
            context = _.extend {}, getNamesNg2(@name, @options.settings.components), @options.settings
            @template '_xx-xx.ts', process.cwd() + context.fileLoc + '.ts', context
            return
}