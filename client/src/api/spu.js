import fetch from 'common/fetch'
import spu from 'common/uri/spu.js'

export function getData(params) {
  return fetch({
    url: spu.getSpuData,
    method: 'POST',
    params
  })
}

export function editSpu(params) {
  return fetch({
    url: spu.editSpu,
    method: 'POST',
    params
  })
}

export function pushSpu(params) {
  return fetch({
    url: spu.pushSpu,
    method: 'POST',
    params
  })
}

export function getBrands(params) {
  return fetch({
    url: spu.getBrands,
    method: 'POST',
    params
  })
}

export function getDistributors(params) {
  return fetch({
    url: spu.getDistributors,
    method: 'POST',
    params
  })
}

export function changeStatus(params) {
  return fetch({
    url: spu.changeStatus,
    method: 'POST',
    params
  })
}

export function getDistributorMappings(params) {
  return fetch({
    url: spu.getDistributorMappings,
    method: 'POST',
    params
  })
}

export function getAllDistributors(params) {
  return fetch({
    url: spu.getAllDistributors,
    method: 'POST',
    params
  })
}

export function saveDistributorMapping(params) {
  return fetch({
    url: spu.saveDistributorMapping,
    method: 'POST',
    params
  })
}

export function createSpu(params) {
  return fetch({
    url: spu.createSpu,
    method: 'POST',
    params
  })
}

export function pushAfterChange(params) {
  return fetch({
    url: spu.pushAfterChange,
    method: 'POST',
    params
  })
}


