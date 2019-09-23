import fetch from 'common/fetch'
import sku from 'common/uri/sku.js'

export function getData(params) {
  return fetch({
    url: sku.getSkuData,
    method: 'POST',
    params
  })
}


export function editSku(params) {
  return fetch({
    url: sku.editSku,
    method: 'POST',
    params
  })
}

export function pushSku(params) {
  return fetch({
    url: sku.pushSku,
    method: 'POST',
    params
  })
}

export function changeStatus(params) {
  return fetch({
    url: sku.changeStatus,
    method: 'POST',
    params
  })
}

export function getSkuCommonMappings(params) {
  return fetch({
    url: sku.getSkuCommonMappings,
    method: 'POST',
    params
  })
}

export function saveCommonMapping(params) {
  return fetch({
    url: sku.saveCommonMapping,
    method: 'POST',
    params
  })
}

export function getSkuSubsidiaries(params) {
  return fetch({
    url: sku.getSkuSubsidiaries,
    method: 'POST',
    params
  })
}

export function getAllProviders(params) {
  return fetch({
    url: sku.getProviders,
    method: 'POST',
    params
  })
}

export function saveSubsidiary(params) {
  return fetch({
    url: sku.saveSkuSubsidiary,
    method: 'POST',
    params
  })
}

export function createSku(params) {
  return fetch({
    url : sku.createSku,
    method: 'POST',
    params
  })
}

export function pushAfterChange(params) {
  return fetch({
    url : sku.pushAfterChange,
    method: 'POST',
    params
  })
}
