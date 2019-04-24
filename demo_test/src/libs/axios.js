import axios from 'axios';
import { getStore, setStore } from './storage';
import { router } from '../router/index';
import { Message } from 'iview';
import Cookies from 'js-cookie';
// 统一请求路径前缀
// 超时设定
var instance=axios.create({
  baseURL:process.env.BASE_API,
  withCredentials:true,
  timeout:5000000,
  transformResponse:function(data){
    return data;
  }
});

instance.interceptors.request.use(config => {
  return config;
}, err => {
  Message.error('请求超时');
  return Promise.resolve(err);
});

// http response 拦截器
instance.interceptors.response.use(response => {
  let data = response.data;
  if(typeof data ==='string'){
    data=JSON.parse(data);
  }
  // 根据返回的code值来做不同的处理(和后端约定)
  switch (data.code) {
    case 401:
      // 未登录 清除已登录状态
      Message.error(data.message);
      Cookies.set('userInfo', '');
      setStore('accessToken', '');
      router.push('/login');
      break;
    case 403:
      // 没有权限
      if (data.message !== null) {
        router.push('/403');
      } else {
        Message.error("未知错误");
      }
      break;
    case 500:
      // 错误
      if (data.message !== null) {
        Message.error(data.message);
      } else {
        Message.error("未知错误");
      }
      break;
    default:
      return data;
  }
  console.log(data)
  return data;
}, (err) => {
  // 返回状态码不为200时候的错误处理
  Message.error(err.toString());
  return Promise.resolve(err);
});
export default instance;

