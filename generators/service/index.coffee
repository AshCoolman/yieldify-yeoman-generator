util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
chalk = require 'chalk'
changeCase = require 'change-case'
createModules = require '../app/modules/createModules.coffee'

OnepageGenerator = yeoman.generators.NamedBase.extend {
  createServiceFiles: createModules.service '_xx-xx.service.coffee'
}
module.exports = OnepageGenerator