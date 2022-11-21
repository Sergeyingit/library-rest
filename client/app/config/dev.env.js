'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  SERVER_AUTH: '"http://localhost:8082"',
  SERVER_RESOURCE: '"http://localhost:8081"'
})
