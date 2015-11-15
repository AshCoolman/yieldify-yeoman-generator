module.exports = () ->
  existsSync = require( 'utils-fs-exists' ).sync
  if existsSync process.cwd()+'/package.json'
    return require(process.cwd()+'/package.json')?['yeoman-yieldify']  
  defaults = require('../../../package.json')['yeoman-yieldify']
  console.log '\n"yeoman-yieldify" not found in '+process.cwd()+'/package.json, using defaults:\n'
  console.log JSON.stringify(defaults, null, 2)
  return defaults