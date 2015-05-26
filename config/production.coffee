webpack = require 'webpack'

merge = require '../helpers/merge'
common = require './common'

process.env.NODE_ENV = 'production'

module.exports = merge common,
  plugins: [
    new webpack.optimize.UglifyJsPlugin
  ]
