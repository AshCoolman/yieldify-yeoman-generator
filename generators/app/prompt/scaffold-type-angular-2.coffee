chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "3"
  type: 'input'
  name: 'angular2.choice'
  message: """
  NEXT CHOICE: Angular 2 components:
  --------------------
    (#{chalk.cyan('b')})asic component

  default:
  """
  default: chalk.cyan 'b'
}