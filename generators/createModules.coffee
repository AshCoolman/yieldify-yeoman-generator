changeCase = require 'change-case'
_ = require 'lodash'
{ ngSrcDir } = require '../package.json'

getNames = (fullName)-> 
    fileLoc = fullName
    bits = fullName.split '/'
    module = bits.join '.'
    component = bits.pop()
    {
        name_dash: component
        name_pascal: changeCase.pascal component
        name_camel: changeCase.camel component
        module: module
        file_loc: fileLoc
    }

module.exports = {
    getNames: getNames
    module: -> 
        ->
            context = _.extend {}, getNames(@name)
            @template '_xx-xx.coffee', ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.coffee', context
            return
    directive: -> 
        ->
            context = _.extend {}, getNames(@name)
            @template '_xx-xx.directive.coffee', ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.directive.coffee', context
            return
    controller: -> 
        ->
            context = _.extend {}, getNames(@name)
            @template '_xx-xx.controller.coffee', ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.controller.coffee', context
            return
    service: -> 
        ->
            context = _.extend {}, getNames(@name)
            @template '_xx-xx.service.coffee', ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.service.coffee', context
            return
    value: -> 
        ->
            context = _.extend {}, getNames(@name)
            @template '_xx-xx.value.coffee', ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.value.coffee', context
            return
            return
}