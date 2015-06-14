util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
chalk = require 'chalk'
changeCase = require 'change-case'
createModules = require '../createModules.coffee'

OnepageGenerator = yeoman.generators.NamedBase.extend {
  createServiceFiles: createModules.service()
}
module.exports = OnepageGenerator