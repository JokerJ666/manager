var merge = require('webpack-merge')
var prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  sso_url: '"https://sso-t.yaochufa.com/sso"',
//sn_supplier_dev本地开发，sn_supplier_dev开发机器appkey
  appKey: '"sn_supplier_dev"'

})
