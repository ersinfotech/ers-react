#
# webpack配置
#

path = require 'path'

webpack = require 'webpack'
HtmlWebpackPlugin = require 'html-webpack-plugin'

cwd = process.cwd()
base = path.resolve __dirname + '/..'

config = require cwd + '/config'

process.env.NODE_ENV = 'development'

module.exports =
  devtool: 'eval'
  debug: true
  entry: [
    cwd + '/app/router.cjsx'
    base + '/node_modules/webpack/hot/dev-server.js'
  ]
  output:
    path: cwd + '/build'
    filename: '[hash].js'
  resolve:
    root: [
      cwd + '/app'
      cwd + '/bower_components'
      cwd + '/node_modules'
      cwd
    ]
    extensions: ['', '.js', '.cjsx', '.coffee']
  resolveLoader:
    root: base + '/node_modules'
  module:
    loaders: [
      test: /\.coffee$/
      loader: 'coffee'
    ,
      test: /\.cjsx$/
      loader: 'coffee!cjsx'
    ,
      test: /\.css$/
      loader: 'style!css'
    ,
      test: /\.(jpe?g|png|gif|svg)$/i
      loader: 'file'
    ,
      test: /\.(ttf|eot|svg|woff|woff2)(\?v=[0-9]\.[0-9]\.[0-9])?$/
      loader: "file"
    ,
      test: /\.styl$/
      loader: 'style!css!stylus'
    ]
  plugins: [
    new webpack.NoErrorsPlugin
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "package.json", ["main"]
    )
    new webpack.ResolverPlugin(
      new webpack.ResolverPlugin.DirectoryDescriptionFilePlugin "bower.json", ["main"]
    )
    new HtmlWebpackPlugin
      template: cwd + '/index.html'
      title: config.title
    new webpack.HotModuleReplacementPlugin
  ]
