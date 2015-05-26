path = require 'path'

webpack = require 'webpack'

merge = require '../helpers/merge'
common = require './common'

base = path.resolve __dirname + '/..'

process.env.NODE_ENV = 'development'

module.exports = merge common,
  devtool: 'eval'
  debug: true
  entry: [
    base + '/node_modules/webpack/hot/dev-server.js'
  ]
  plugins: [
    new webpack.HotModuleReplacementPlugin
  ]
