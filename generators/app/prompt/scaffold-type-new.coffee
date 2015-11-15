chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "3"
  type: 'input'
  name: 'newFeatures'
  message: """
  Compose build list from:

    #{chalk.red('New javascript project')}

      (#{chalk.cyan('b')})abel
      (#{chalk.cyan('t')})ypescript
      (#{chalk.cyan('c')})offee

      (#{chalk.cyan('B')})ower

    default:
  """
  default: chalk.cyan 't'
}