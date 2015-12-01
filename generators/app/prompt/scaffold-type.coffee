chalk = require 'chalk'
ra = chalk.red('*')
module.exports = {
  type: 'input'
  name: 'scaffoldType'
  message: """
  What do you want to scaffold today:
  --------------------
    (#{chalk.cyan('1')}) Angular 1: pre-ng2, coffeescript
    (#{chalk.cyan('2')}) Angular 1: post-ng2
    (#{chalk.cyan('3')}) Angular 2
    (#{chalk.cyan('4')}) Angular implementations

  Coming soon:
    (#{chalk.gray('n')})pm package

  default:
  """
  default: chalk.cyan '1'
}