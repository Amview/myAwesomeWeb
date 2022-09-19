//引入axios
import axios from "axios"
export function request(params){
    //get请求
    if(params.params){
        return axios({
            url: params.url,
            method: params.method,
            responseType: 'json',
            params: params.params
        })
    //post请求
    }else {
        return axios({
            url: params.url,
            method: params.method,
            responseType: 'json',
            data: params.data
        })
    }
}

