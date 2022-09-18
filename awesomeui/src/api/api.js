export default{
    system_menu: {
        'getMenuList': {
            url: '/system/menu/list',
            method: 'get'
        },
        'addMenu':{
            url: '/system/menu/add',
            method: 'post'
        },
        'deleteMenuById': {
            url: '/system/menu/deleteById',
            method: 'get'
        },
        'getById': {
            url: '/system/menu/getById',
            method: 'get'
        },
        'getSysMenu': {
            url: '/system/menu/sysMenu',
            method: 'get'
        },
        'updateSysMenu': {
            url: '/system/menu/update',
            method: 'post'
        }
    },
    system_dict: {
        'getByDictType': {
            url: '/system/dict/getByType',
            method: 'get',
        },
        'getMenuDictList': {
            url: '/system/dict/menuDictList',
            method: 'get'
        }
    }

}
