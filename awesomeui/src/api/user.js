import {request} from "@/utils/request";

export function getUserList(params){
    return request({
        url: '/system/user/list',
        method: 'get',
        params: params
    })
}
