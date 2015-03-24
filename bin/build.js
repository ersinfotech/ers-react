#!/usr/bin/env node

require('coffee-script/register');

var webpack = require('webpack');

var webpackConfig = require('../config/production');

webpack(webpackConfig, function (err) {
  if (err) {
    return console.error(err);
  };
  console.log('done');
});
