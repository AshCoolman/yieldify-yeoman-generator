chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "n"
  type: 'input'
  name: 'newNpm.choice'
  message: """
  NEXT CHOICE: Create a npmjs package:
  -----------------------
    (#{chalk.cyan('b')})abel
    (#{chalk.cyan('t')})ypescript
    (#{chalk.cyan('c')})offee

    (#{chalk.cyan('B')})ower

  default:
  """
  default: chalk.cyan 't'
}