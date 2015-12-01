chalk = require 'chalk'
module.exports = {
  when: (res) -> res.scaffoldType is "1"
  type: 'input'
  name: 'angular1Old.choice'
  message: """
  NEXT CHOICE: Angular 1 #{chalk.red('Obsolete')}
  - Designed before ng2
  - Included only for legacey Yieldify projects
  --------------------
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
}