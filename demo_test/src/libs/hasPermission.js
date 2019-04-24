const hasPermission = {
    install (Vue, options) {
        Vue.directive('has', {
            bind (el, binding, vnode) {
                let permTypes = vnode.context.$route.meta.permTypes;
                if (!permTypes.includes(binding.value)) {
                    el.style.display='none'
                }
            }
        });
    }
};

export default hasPermission;
