import fetch from 'common/fetch'
import packet from 'common/uri/packet.js'

export function getHotelList(params) {
  return fetch({
    url: packet.getHotelList,
    method: 'POST',
    params
  })
}

export function searchData(params) {
  return fetch({
    url: packet.searchData,
    method: 'POST',
    params
  })
}

export function editData(params) {
  return fetch({
    url: packet.editData,
    method: 'POST',
    params
  })
}

export function createProduct(params) {
  return fetch({
    url: packet.createProduct,
    method: 'POST',
    params
  })
}

export function refuse(params) {
  return fetch({
    url: packet.refuse,
    method: 'POST',
    params
  })
}

export function createLink(params) {
  return fetch({
    url: packet.createLink,
    method: 'POST',
    params
  })
}

export function getDetails(params) {
  return fetch({
    url: packet.getDetails,
    method: 'POST',
    params
  })
}

export  function getUserInfo(params) {
  return fetch({
    url: packet.getUserInfo,
    method: 'POST',
    params
  })
}
