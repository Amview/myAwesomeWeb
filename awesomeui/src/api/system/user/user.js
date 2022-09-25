import {request} from "@/utils/request";

export function getUserList(params){
    return request({
        url: '/system/user/list',
        method: 'get',
        params: params
    })
}

export function addUser(data){
    return request({
        url: '/system/user/add',
        method: 'post',
        data: data
    })
}
