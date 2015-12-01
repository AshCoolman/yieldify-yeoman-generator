module.exports = () ->
  existsSync = require( 'utils-fs-exists' ).sync
  if existsSync process.cwd()+'/package.json'
    defaults = require(process.cwd()+'/package.json')?['yeoman-yieldify']
    if defaults
        return defaults
  defaults = require('../../../package.json')['yeoman-yieldify']
  return defaults