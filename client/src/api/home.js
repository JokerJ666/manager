import fetch from 'common/fetch'
import home from 'common/uri/home.js'


export function loginTest() {
  return fetch({
    url: home.loginTest,
    method: 'post',
  })
}


