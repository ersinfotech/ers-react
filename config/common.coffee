path = require 'path'

webpack = require 'webpack'
HtmlWebpackPlugin = require 'html-webpack-plugin'

cwd = process.cwd()
base = path.resolve __dirname + '/..'

config = require cwd + '/config'

module.exports =
  entry: [
    cwd + '/app/router.cjsx'
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
      test: /\.styl$/
      loader: 'style!css!stylus'
    ,
      test: /assets\//
      loader: 'file?name=[path][name].[ext]'
    ,
      test: /\.css/
      loader: 'style!css'
      exclude: [
        cwd + '/assets'
      ]
    ,
      test: /\.(jpe?g|png|gif|svg)/i
      loader: 'file'
      exclude: [
        cwd + '/assets'
      ]
    ,
      test: /\.(ttf|eot|svg|woff|woff2)/
      loader: "file"
      exclude: [
        cwd + '/assets'
      ]
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
      config: config
    new HtmlWebpackPlugin
      filename: 'login.html'
      template: cwd + '/login.html'
      title: config.title
      config: config
  ]
