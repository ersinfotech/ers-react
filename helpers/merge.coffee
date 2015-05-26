_ = require 'lodash'

module.exports = (source, target) ->
  joinArrays = (a, b) ->
    if _.isArray(a) and _.isArray(b)
      return a.concat b
    if _.isPlainObject(a) and _.isPlainObject(b)
      return _.merge a, b, joinArrays
    a

  _.merge target, source, joinArrays
