_ = require 'lodash'

module.exports = (obj, prop) =>
  (needles) =>
    hay = obj?[prop]
    needles = needles.split('')
    inHayReducer = (prev, curr) =>
      prev or _(hay).contains curr
    return needles.reduce(inHayReducer, false)