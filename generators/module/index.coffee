# This extends `NamedBase` to use with `composeWith`
util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
chalk = require 'chalk'
changeCase = require 'change-case'
create = require '../create.coffee'

OnepageGenerator = yeoman.generators.NamedBase.extend {
  createModuleFiles: create.module()
}
module.exports = OnepageGenerator