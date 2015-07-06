util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
chalk = require 'chalk'
changeCase = require 'change-case'
create = require '../create.coffee'

OnepageGenerator = yeoman.generators.NamedBase.extend {
  createProviderFiles: create.provider()
}
module.exports = OnepageGenerator