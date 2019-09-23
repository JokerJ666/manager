import axios from 'axios'
import {Message} from 'element-ui'
export default function fetch(options) {

  return new Promise((resolve, reject) => {
    //创建一个axios实例
    const instance = axios.create({
      //设置默认根地址
      baseURL: '/',
      //设置请求超时设置
      timeout: 10000,
      //设置请求时的header
      headers: {
        'Content-Type': options.contentType == undefined ? 'application/json' : options.contentType,
      },
      method: options.method || 'GET',
      //async: options.async || true
    })
    instance(options)
      .then((data) => {
        resolve(data);
      })
      .catch((error) => {
        reject(error)
      })
  })
}
