
import {request} from "@/utils/request";

export function getSysMenu(params){
    return request({
        url: '/system/menu/sysMenu',
        method: 'get',
        params: params
    })
}

export function getMenuList(params){
    return request({
        url: '/system/menu/list',
        method: 'get',
        params: params
    })
}

export function addMenu(data){
    return request({
        url: '/system/menu/add',
        method: 'post',
        data: data
    })
}

export function deleteMenuById(id){
    return request({
        url: '/system/menu/deleteById',
        method: 'get',
        params: {
            id: id
        }
    })
}

export function getById(params){
    return request({
        url: '/system/menu/getById',
        method: 'get',
        params: params
    })
}

export function updateSysMenu(data){
    return request({
        url: '/system/menu/update',
        method: 'post',
        data: data
    })
}

