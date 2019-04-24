// 统一请求路径前缀在libs/axios.js中修改
import ajax from '@/libs/axios';
import { getStore, setStore } from '../libs/storage';


// 文件上传接口
export const uploadFile = process.env.BASE_API+"/common/upload/uploadFile"
// 验证码渲染图片接口
export const drawCodeImage = process.env.ADMIN_PATH+"/common/captcha/draw/"



// 登陆
export function login(params){
  return ajax({
    method: 'post',
    url: "/login",
    params: params
  });
}
export function logout(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: "/logout",
    params: params,
    headers:{
      'accessToken': accessToken
    }
  });
}
export function getMenuList(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url: "/menu/getMenuList",
    params: params,
    headers:{
      'accessToken': accessToken
    }
  });
}
// 获取用户登录信息
export function userInfo(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url: "/user/info",
    params: params,
    headers:{
      'accessToken': accessToken
    }
  });
}
//注册
export function register(params){
  return ajax({
    method: 'post',
    url: "/user/register",
    params: params
  });
}
// 初始化验证码
export function initCaptcha(params){
  return ajax({
    method: 'get',
    url: "/common/captcha/init",
    params: params
  });
}
// 发送短信验证码
export function sendSms(mobile, params){
  return ajax({
    method: 'get',
    url: `/common/captcha/sendSms/${mobile}`,
    params: params
  });
}
// 短信验证码登录
export function smsLogin(mobile, params){
  return ajax({
    method: 'post',
    url: '/user/smsLogin',
    params: params
  });
}
// IP天气信息
export function ipInfo(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url: '/common/ip/info',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 个人中心编辑
export function userInfoEdit(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: '/user/edit',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 个人中心修改密码
export function changePass(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: '/user/modifyPass',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 解锁
export function unlock(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: '/user/unlock',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 获取用户数据 多条件
export function getUserListData(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url: '/user/getUserList',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 获取全部用户数据
export function getAllUserData(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url: '/user/getAll',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 添加用户
export function addUser(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: '/user/admin/add',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 编辑用户
export function editUser(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: '/user/admin/edit',
    data: params,
    headers: {
      'accessToken': accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 启用用户
export function enableUser(id, params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: `/user/admin/enable/${id}`,
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 禁用用户
export function disableUser(id, params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url: `/user/admin/disable/${id}`,
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 删除用户
export function deleteUser(id, params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url: `/user/delByIds/${id}`,
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}


// 获取一级部门
export function initDepartment(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url: '/office/getByParentId/0',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 加载部门子级数据
export function loadDepartment(id, params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:`/office/getByParentId/${id}`,
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 添加部门
export function addDepartment(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/office/add',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 编辑部门
export function editDepartment(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/office/edit',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 删除部门
export function deleteDepartment(ids,params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url:`/office/delByIds/${ids}`,
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 搜索部门
export function searchDepartment(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/office/search',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}


// 获取全部角色数据
export function getAlLRoleList(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/role/getAllList',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 分页获取角色数据
export function getRoleList(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/role/getAllByPage',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 添加角色
export function addRole(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/role/save',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 编辑角色
export function editRole(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/role/edit',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 设为或取消注册角色
export function setDefaultRole(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/role/setDefault',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 分配角色权限
export function editRolePerm(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/role/editRolePerm',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 分配角色数据权限
export function editRoleDep(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/role/editRoleDep',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 删除角色
export function deleteRole(ids,params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url:`/role/delAllByIds/${ids}`,
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}

// 获取全部字典
export function findDictList(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/dict/findDictList',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 添加字典
export function addDict(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/dict/add',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 编辑字典
export function editDict(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/dict/edit',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 删除字典
export function deleteDict(ids){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url:`/dict/delByIds/${ids}`,
    headers:{
      'accessToken':accessToken,
    }
  });
}

/**
 * 根据类型查询字典
 * @param params
 */
export function findDictByType(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/dict/findDictByType',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
export function enableDict(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/dict/enableDict',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 通过类型获取字典数据

// 获取全部权限数据
export function getAllMenuList(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/menu/getAllList',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 添加权限
export function addMenu(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/menu/add',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 编辑权限
export function editMenu(params){
  console.log(params)
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/menu/edit',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 删除权限
export function deleteMenu(ids,params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url:`/menu/delByIds/${ids}`,
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 搜索权限
export function searchMenu(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url:'/menu/search',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}


// 分页获取日志数据
export function getLogListData(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/log/getAllByPage',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 删除日志
export function deleteLog(ids){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url:`/log/delByIds/${ids}`,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 清空日志
export function deleteAllLog(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'delete',
    url:'/log/delAll',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
export function getMessageListData(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'get',
    url:'/message/getAllByPage',
    params: params,
    headers:{
      'accessToken':accessToken
    }
  });
}
// 添加消息
export function addMessage(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/message/add',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
// 编辑消息
export function editMessage(params){
  let accessToken=getStore("accessToken");
  return ajax({
    method: 'post',
    url:'/message/edit',
    data: params,
    headers:{
      'accessToken':accessToken,
      'Content-Type':'application/json;charset=UTF-8'
    }
  });
}
