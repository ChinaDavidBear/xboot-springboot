import Cookies from 'js-cookie';
import {logout} from "../../api/index";
import {} from "../../router/router";

const user = {
    state: {},
    mutations: {
        logout (state, vm) {
            logout({}).then(res=>{
              if(!res.success){
                Cookies.remove('userInfo');
                Cookies.remove('access');
                // 清空打开的页面等数据
                localStorage.clear();
              }
            })

        }
    }
};

export default user;
