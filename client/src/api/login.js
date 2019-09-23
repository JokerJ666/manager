import fetch from 'common/fetch'
import {login} from 'common/uri'
export function loginMethod(data) {
  return fetch({
    url: login.loginApi,
    method: 'post',
    data
  })
}
export function getUserInfo(data) {
  return fetch({
    url: login.getUserInfo,
    method: 'post',
    data
  })
}
export function loginOut(params) {
  return fetch({
    url: login.loginOut,
    method: 'get',
    //async: false,
    params
  })
}
