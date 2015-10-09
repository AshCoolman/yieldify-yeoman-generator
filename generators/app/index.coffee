'use strict'
_ = require('lodash')
yeoman = require('yeoman-generator')
chalk = require('chalk')
yosay = require('yosay')
module.exports = yeoman.generators.NamedBase.extend(
  prompting: ->
    done = @async()
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