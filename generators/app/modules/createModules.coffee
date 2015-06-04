changeCase = require 'change-case'
_ = require 'lodash'
pkg = require '../../../package.json'
{ componentsDir } = pkg

getNames = (name)-> {
        name: name
        name_pascal: changeCase.pascal name
        name_camel: changeCase.camel name
        name_dash: changeCase.param name
        module_path: componentsDir
    }

module.exports = {
    getNames: getNames
    directive: (template) -> 
        ->
            context = _.extend {}, getNames(@name)
            @template template, context.module_path + '/' + context.name_dash + '.directive.coffee', context
            return
    controller: (template) -> 
        ->
            context = _.extend {}, getNames(@name)
            @template template, context.module_path + '/' + context.name_dash + '.controller.coffee', context
            return
}