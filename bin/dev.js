#!/usr/bin/env node

require('coffee-script/register');

var webpack = require('webpack');
var WebpackDevServer = require('webpack-dev-server');

var cwd = process.cwd();

var webpackConfig = require('../config/development');
var config = require(cwd + '/config');

var compiler = webpack(webpackConfig);
var server = new WebpackDevServer(compiler, {
  hot: true
});
server.listen(config.port);
