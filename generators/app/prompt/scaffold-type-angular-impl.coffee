chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "4"
  type: 'input'
  name: 'angularImp.choice'
  message: """
  NEXT CHOICE: Angular implementations
  - Common systems of componenets.
  - Docs to follow soon
  -----------------------
    (#{chalk.cyan('1')}). "major" with redux in angular 1 #{chalk.red('*')}

  default:
  """
  default: chalk.cyan '1'
}