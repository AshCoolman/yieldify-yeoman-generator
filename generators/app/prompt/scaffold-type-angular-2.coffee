chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "2"
  type: 'input'
  name: 'buildTypes'
  message: """
  Compose build list from:

    #{chalk.red('Angular 2')}

      (#{chalk.cyan('b')})asic component
      (#{chalk.cyan('a')})all

    default:
  """
  default: chalk.cyan 'a'
}