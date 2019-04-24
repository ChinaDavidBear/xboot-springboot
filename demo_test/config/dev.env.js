'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  BASE_API:'"/api"',
  ADMIN_PATH:'"http://127.0.0.1:8080/admin"'
})
