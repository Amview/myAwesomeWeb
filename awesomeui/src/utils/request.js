//引入axios
import axios from "axios"

export function request(baseUrl,params){
    if (baseUrl.method === 'post'){
        return axios({
            url: baseUrl.url,
            method: baseUrl.method,
            responseType: 'json',
            data: params
        })
    }else {
        return axios({
            url: baseUrl.url,
            method: baseUrl.method,
            responseType: 'json',
            params: params
        })
    }
}

