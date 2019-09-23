import fetch from 'common/fetch'
import manager from 'common/uri/operateManager.js'

export function getCompanyInfo(params) {
  return fetch({
    url: manager.getCompanyInfo,
    method: 'POST',
    params
  })
}

export function getBrandInfo(params) {
  return fetch({
    url: manager.getBrandInfo,
    method: 'POST',
    params
  })
}

export function getAuditInfo(params) {
  return fetch({
    url: manager.getAuditInfo,
    method: 'POST',
    params
  })
}

export function getProviders(params) {
  return fetch({
    url: manager.getProviders,
    method: 'POST',
    params
  })
}

export function editPaySetting(params) {
  return fetch({
    url: manager.editPaySetting,
    method: 'POST',
    params
  })
}

export function editBdSetting(params) {
  return fetch({
    url: manager.editBdSetting,
    method: 'POST',
    params
  })
}

export function audit(params) {
  return fetch({
    url: manager.audit,
    method: 'POST',
    params
  })
}

export function getOpenAccounts(params) {
  return fetch({
    url: manager.getOpenAccounts,
    method: 'POST',
    params
  })
}

export  function getBusinessTypeOptions(params) {
  return fetch({
    url: manager.getBusinessTypeOptions,
    method: 'POST',
    params
  })
}

export function getContractInfo(params) {
  return fetch({
    url: manager.getContractInfo,
    method: 'POST',
    params
  })
}

export function getOperateRecord(params) {
  return fetch({
    url: manager.getOperateRecord,
    method: 'POST',
    params
  })
}

export function editOthers(params) {
  return fetch({
    url: manager.editOthers,
    method: 'POST',
    params
  })
}

export function editContact(params) {
  return fetch({
    url: manager.editContact,
    method: 'POST',
    params
  })
}

export function pushAudit(params) {
  return fetch({
    url: manager.pushAudit,
    method: 'POST',
    params
  })
}

export function getUserList(params) {
  return fetch({
    url: manager.getUserList,
    method: 'POST',
    params
  })
}

