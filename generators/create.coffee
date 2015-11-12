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

module.exports = {
    getNames: getNames
    module: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.coffee', context.components + '/' + context.file_loc + '/' + context.name_dash + '.coffee', context
            return
    constant: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.constant.coffee', context.components + '/' + context.file_loc + '/' + context.name_dash + '.constant.coffee', context
            return

    value: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.value.coffee', context.components + '/' + context.file_loc + '/' + context.name_dash + '.value.coffee', context
            return
    directive: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.directive.coffee', context.components + '/' + context.file_loc + '/' + context.name_dash + '.directive.coffee', context
            return
    template: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.template.jade', context.components + '/' + context.file_loc + '/' + context.name_dash + '.template.jade', context
            return
    style: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.style.styl', context.components + '/' + context.file_loc + '/' + context.name_dash + '.style.styl', context
            return
    controller: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.controller.coffee', context.components + '/' + context.file_loc + '/' + context.name_dash + '.controller.coffee', context
            return
    service: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.service.coffee', context.components + '/' + context.file_loc + '/' + context.name_dash + '.service.coffee', context
            return
    provider: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.provider.coffee', context.components + '/' + context.file_loc + '/' + context.name_dash + '.provider.coffee', context
            return
    e2e: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.e2e.dom.coffee', context.e2e + '/' + context.file_loc + '/' + context.name_dash + '.e2e.dom.coffee', context
            return
    inbroAction: -> 
        ->
            context = _.extend {}, getNames(@name), @options.settings
            @template '_xx-xx.action.coffee', context.inbro + '/' + context.file_loc + '/' + context.name_dash + '.action.coffee', context
            return

}