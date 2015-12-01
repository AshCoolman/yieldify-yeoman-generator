chalk = require 'chalk'

module.exports = {
  type: 'input'
  name: 'scaffoldType'
  message: """
  What type of scaffold:

    (#{chalk.cyan('1')}). Angular 1
    (#{chalk.cyan('2')}). Angular 2
    (#{chalk.cyan('n')})pm package #{chalk.red('Not done')}

    default:
  """
  default: chalk.cyan '1'
}