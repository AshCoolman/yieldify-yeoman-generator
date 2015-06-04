util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
chalk = require 'chalk'
changeCase = require 'change-case'
createModules = require '../app/modules/createModules.coffee'

OnepageGenerator = yeoman.generators.NamedBase.extend {
  createControllerFiles: createModules.controller '_xx-xx.controller.coffee'
}
module.exports = OnepageGenerator