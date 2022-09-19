import {request} from "@/utils/request";

export function getByDictType(dictType){
    return request({
        url: '/system/dict/getByType',
        method: 'get',
        params: {
            dictType: dictType
        }
    })
}

export function getMenuDictList(params){
    return request({
        url: '/system/dict/menuDictList',
        method: 'get',
        params: params
    })
}
