'use strict'
path = require 'path'
existsSync = require( 'utils-fs-exists' ).sync
require 'string.prototype.startswith'
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

        default:
      """
      default: chalk.cyan 'a'
    } ]
    @prompt prompts, (props) =>
      props.settings = settings["angular1"]
      @props = props
      # To access props later use this.props.someOption;
      done()
      return
    return
  writing:
    app: ->
      has = (types) => types.split('').reduce ((prev, type) => prev or _(@props?.buildTypes).contains type), false
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