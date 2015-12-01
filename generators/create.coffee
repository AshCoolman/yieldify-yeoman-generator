# These are used to extend `NamedBase`
changeCase = require 'change-case'
_ = require 'lodash'

getCfg = (type, fileLoc, componentDir) ->
    if type is 'ng1' then return getCfgNg1 fileLoc, componentDir
    if type is 'ng2' then return getCfgNg2 fileLoc, componentDir

getCfgNg1 = (fileLoc, componentDir) ->
    bits      = fileLoc.split '/'
    module    = bits.join '.'
    component = bits.pop()
    {
        nameDash   : component
        namePascal : changeCase.pascal component
        nameCamel  : changeCase.camel component
        module     : module
        rootLoc    : process.cwd()
        fileLoc    : [process.cwd(), componentDir, fileLoc, component].join('/')
        moduleLoc  : './' + fileLoc + '/' + component
    }

getCfgNg2 = (fileLoc, componentDir)-> 
    bits      = fileLoc.split '/'
    component = bits.pop()
    fileLoc   = bits.join('/') or '/'
    {   
        nameDash   : component
        namePascal : changeCase.pascal component
        nameCamel  : changeCase.camel component
        fileLoc    : [process.cwd(), componentDir, fileLoc, component].join('/')
        moduleLoc  : './' + fileLoc + '/' + component
    }

tmpl = (context, templateName, configType, moduleDir) ->
    { template, name } = context
    config = getCfg configType, name, moduleDir
    config.options = context.options
    [ input, output ] = [ '_xx-xx' + templateName, config.fileLoc + templateName ]
    template.bind(context) input, output, config

module.exports =
    # Angular 1 old
    module:      -> -> tmpl @, '.coffee'            , 'ng1', @options.settings.components
    constant:    -> -> tmpl @, '.constant.coffee'   , 'ng1', @options.settings.components 
    value:       -> -> tmpl @, '.value.coffee'      , 'ng1', @options.settings.components
    directive:   -> -> tmpl @, '.directive.coffee'  , 'ng1', @options.settings.components
    template:    -> -> tmpl @, '.template.jade'     , 'ng1', @options.settings.components
    style:       -> -> tmpl @, '.style.styl'        , 'ng1', @options.settings.components
    controller:  -> -> tmpl @, '.controller.coffee' , 'ng1', @options.settings.components
    service:     -> -> tmpl @, '.service.coffee'    , 'ng1', @options.settings.components
    provider:    -> -> tmpl @, '.provider.coffee'   , 'ng1', @options.settings.components
    e2e:         -> -> tmpl @, '.e2e.dom.coffee'    , 'ng1', @options.settings.e2e
    inbroAction: -> -> tmpl @, '.action.coffee'     , 'ng1', @options.settings.inbro
    # Angular 1
    ng1Basic:    -> -> tmpl @, '.ts'                , 'ng2', @options.settings.components
    # Angular 2
    ng2Basic:    -> -> tmpl @, '.ts'                , 'ng2', @options.settings.components