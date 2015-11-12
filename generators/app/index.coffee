'use strict'
path = require 'path'
existsSync = require( 'utils-fs-exists' ).sync
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
    settings = null 
    if existsSync '/package.json'
      settings = require(process.cwd()+'/package.json')?['yeoman-yieldify']
      console.log 'Using project package.json :)'
    if not settings
      settings = require('../../package.json')['yeoman-yieldify']
      console.log '"yeoman-yieldify" not found in package.json, using defaults:'+JSON.stringify(settings, null, 2)

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
        props.settings = settings["angular2"]
      else
        props.settings = settings["angular1"]
      @props = props

      # To access props later use this.props.someOption;
      done()
      return
    return
  writing:
    app: ->
      has = (types) => types.split('').reduce ((prev, type) => prev or _(@props?.buildTypes).contains type), false

      if @props.buildTypes.startsWith '2'
        console.log 'Is angular 2'
        console.log 'Basic component' if has 'ab'
        @composeWith 'yiang:ng-2-basic', { options: @props , args: [@name]} if has 'ab'
      else
        @composeWith 'yiang:module'       , { options: { } , args: [@name]} if has 'avCdcspm'
        @composeWith 'yiang:value'        , { options: { } , args: [@name]} if has 'av'
        @composeWith 'yiang:constant'     , { options: { } , args: [@name]} if has 'aC'
        @composeWith 'yiang:directive'    , { options: { } , args: [@name]} if has 'adt'
        @composeWith 'yiang:template'     , { options: { } , args: [@name]} if has 'adt'
        @composeWith 'yiang:style'        , { options: { } , args: [@name]} if has 'adt'
        @composeWith 'yiang:controller'   , { options: { } , args: [@name]} if has 'ac'
        @composeWith 'yiang:service'      , { options: { } , args: [@name]} if has 'as'
        @composeWith 'yiang:provider'     , { options: { } , args: [@name]} if has 'ap'
        @composeWith 'yiang:e2e'          , { options: { } , args: [@name]} if has 'ae'
        @composeWith 'yiang:inbro-action' , { options: { } , args: [@name]} if has 'ai'
      return
    projectfiles: ->
      return
  install: ->
    # @installDependencies()
    return
)