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
    module: (template) -> 
        ->
            context = _.extend {}, getNames(@name)
            @template template, ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.coffee', context
            return
    directive: (template) -> 
        ->
            context = _.extend {}, getNames(@name)
            @template template, ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.directive.coffee', context
            return
    controller: (template) -> 
        ->
            context = _.extend {}, getNames(@name)
            @template template, ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.controller.coffee', context
            return
    service: (template) -> 
        ->
            context = _.extend {}, getNames(@name)
            @template template, ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.service.coffee', context
            return
    value: (template) -> 
        ->
            context = _.extend {}, getNames(@name)
            @template template, ngSrcDir + '/' + context.file_loc + '/' + context.name_dash + '.value.coffee', context
            return
}