'use strict'
path = require 'path'
require 'string.prototype.startswith'
require 'string.prototype.endswith'

_ = require('lodash')
yeoman = require('yeoman-generator')
chalk = require('chalk')
yosay = require('yosay')
module.exports = yeoman.generators.NamedBase.extend(
  prompting: ->
    done = @async()

    # Use project's package.json, else fallback to this module's
    settings = require(__dirname + '/load-settings/load-settings')()

    # Have Yeoman greet the user.
    @log yosay('Welcome to ' + chalk.cyan('Yiang - yieldifys ng') + ' generator!')
    console.log "\nModule name: "+ chalk.white @name
    console.log "\n"
    prompts = [ {
      type: 'input'
      name: 'buildTypes'
      message: """
      Compose build list from:

        #{chalk.red('Angular 1')}:

          (#{chalk.cyan('a')})ll
          (#{chalk.cyan('C')})ONSTANT
          (#{chalk.cyan('v')})alue
          (#{chalk.cyan('d')})irective
          (#{chalk.cyan('t')})emplate
          (#{chalk.cyan('c')})ontroller
          (#{chalk.cyan('s')})ervice (factory)
          (#{chalk.cyan('p')})rovider (service)
          (#{chalk.cyan('m')})odule only

          (#{chalk.cyan('e')})2e dom handle
          (#{chalk.cyan('x')})xecute e2e script

          (#{chalk.cyan('i')})nbro action

        #{chalk.red('Angular 2')}

          PREFIX: "#{chalk.cyan('2')}"--

          (#{chalk.cyan('b')})asic component
          (#{chalk.cyan('a')})all

        default:
      """
      default: chalk.cyan 'a'
    } ]
    @prompt prompts, (props) =>

      if props.buildTypes.startsWith '2'
        props.generatorType = "angular2"
      else
        props.generatorType = "angular1"
      props.settings = settings[props.generatorType]
      @props = props

      # To access props later use this.props.someOption;
      done()
      return
    return
  writing:
    app: ->
      has = (types) => types.split('').reduce ((prev, type) => prev or _(@props?.buildTypes).contains type), false
      initObj = { options: @props, args: [@name]}

      if @props.generatorType is "angular2"
        @composeWith 'yiang:ng-2-basic'   , initObj if has 'ab'

      else if @props.generatorType is "angular1"
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
      return
    projectfiles: ->
      return
  install: ->
    # @installDependencies()
    return
)