# Auto called from composeWith 
util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
chalk = require 'chalk'
changeCase = require 'change-case'
create = require '../create.coffee'

OnepageGenerator = yeoman.generators.NamedBase.extend {
    createNg2BasicFiles: create.ng2Basic()
}
module.exports = OnepageGenerator