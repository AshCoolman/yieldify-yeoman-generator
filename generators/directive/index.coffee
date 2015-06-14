util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
chalk = require 'chalk'
changeCase = require 'change-case'
createModules = require '../createModules.coffee'

OnepageGenerator = yeoman.generators.NamedBase.extend {
  createDirectiveFiles: createModules.directive()
}
module.exports = OnepageGenerator