chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "y"
  type: 'input'
  name: 'yieldify.choice'
  message: """
  Compose build list from:

    #{chalk.red('Docs to follow soon:')}

      (#{chalk.cyan('1')}) "major" with redux in angular 1.

    default:
  """
  default: chalk.cyan '1'
}