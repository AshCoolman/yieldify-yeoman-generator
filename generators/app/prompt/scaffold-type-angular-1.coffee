chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "2"
  type: 'input'
  name: 'angular1.choice'
  message: """  
  NEXT CHOICE: Angular 1
  - Designed for easy migration to Angular 2.
  --------------------
    (#{chalk.cyan('b')})asic

  default:
  """
  default: chalk.cyan 'b'
}