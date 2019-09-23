import fetch from 'common/fetch'
import message from 'common/uri/message.js'

export function getMessageNoticeList(params) {
  return fetch({
    url: message.getMessageNoticeList,
    method: 'POST',
    params
  })
}

export function getMessageNoticeSend(params) {
  return fetch({
    url: message.getMessageNoticeSend,
    method: 'POST',
    params
  })
}

export function getMessageNoticeCancel(params) {
  return fetch({
    url: message.getMessageNoticeCancel,
    method: 'POST',
    params
  })
}

export function getMessageNoticeInfo(params) {
  return fetch({
    url: message.getMessageNoticeInfo,
    method: 'POST',
    params
  })
}

export function messageNoticeModify(params, data) {
  return fetch({
    url: message.messageNoticeModify,
    method: 'POST',
    contentType: 'application/x-www-form-urlencoded',
    params,
    data
  })
}

export function messageNoticeDelete(params) {
  return fetch({
    url: message.messageNoticeDelete,
    method: 'POST',
    params
  })
}

export function getMessageTemplateList(params) {
  return fetch({
    url: message.getMessageTemplateList,
    method: 'POST',
    params
  })
}

export function messageTemplateSetStatus(params) {
  return fetch({
    url: message.messageTemplateSetStatus,
    method: 'POST',
    params
  })
}

export function getMessageTemplateInfo(params) {
  return fetch({
    url: message.getMessageTemplateInfo,
    method: 'POST',
    params
  })
}

export function messageTemplateModify(params, data) {
  return fetch({
    url: message.messageTemplateModify,
    method: 'POST',
    contentType: 'application/x-www-form-urlencoded',
    params,
    data
  })
}

export function messageTemplateParams(params) {
  return fetch({
    url: message.messageTemplateParams,
    method: 'POST',
    params
  })
}
