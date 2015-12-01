'use strict'
path = require 'path'
require 'string.prototype.startswith'
require 'string.prototype.endswith'

_ = require('lodash')
yeoman = require('yeoman-generator')
chalk = require('chalk')
yosay = require('yosay')
containsFactory = require(__dirname+'/lib/contains-factory')

module.exports = yeoman.generators.NamedBase.extend(
  prompting: ->
    done = @async()
    @log yosay('Welcome to ' + chalk.cyan('Yiang - yieldifys ng') + ' generator!')
    settings = require(__dirname + '/load-settings/load-settings')()
    
    console.log "Module name: #{chalk.white(@name)}\n"

    prompts = [
      require "./prompt/scaffold-type"
      require "./prompt/scaffold-type-angular-1"
      require "./prompt/scaffold-type-angular-2"
      require "./prompt/scaffold-type-new"
    ]
    @prompt prompts, (props) =>
      if props.scaffoldType is '1' then props.generatorType = "angular1"
      if props.scaffoldType is '2' then props.generatorType = "angular2"
      if props.scaffoldType is '3' then props.generatorType = "newnpm"
      props.settings = settings[props.generatorType]
      @props = props
      done()

  writing:
    app: ->
      propsContains = (key) =>
        containsFactory @props, key

      initObj = { options: @props, args: [@name]}

      if @props.generatorType is "angular2"
        has = propsContains('buildTypes')
        @composeWith 'yiang:ng-2-basic'   , initObj if has 'ab'

      else if @props.generatorType is "angular1"
        has = propsContains('buildTypes')
        @composeWith 'yiang:module'       , initObj if has 'avCdcspm'
        @composeWith 'yiang:value'        , initObj if has 'av'
        @composeWith 'yiang:constant'     , initObj if has 'aC'
        @composeWith 'yiang:directive'    , initObj if has 'adt'
        @composeWith 'yiang:template'     , initObj if has 'adt'
        @composeWith 'yiang:style'        , initObj if has 'adt'
        @composeWith 'yiang:controller'   , initObj if has 'ac'
        @composeWith 'yiang:service'      , initObj if has 'as'
        @composeWith 'yiang:provider'     , initObj if has 'ap'
        @composeWith 'yiang:e2e'          , initObj if has 'ae'
        @composeWith 'yiang:inbro-action' , initObj if has 'ai'

      else if @props.generatorType is "newnpm"
        has = propsContains('newFeatures')
        console.log 'Basic...'
        console.log 'Babel...'      if has 'b'
        console.log 'Typescript...' if has 't'
        console.log 'bower...'      if has 'B'

    projectfiles: -> return
  install: ->
    # @installDependencies()
    return
)