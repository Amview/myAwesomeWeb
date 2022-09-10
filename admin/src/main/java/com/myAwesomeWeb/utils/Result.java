package com.myAwesomeWeb.utils;

import lombok.Data;

@Data
public class Result {

    private Integer code;

    private String msg;

    private Object data;

    public Result(){

    }
    public Result(Integer code,String msg,Object data){
        this.code = code;
        this.msg = msg;
        this.data = data;
    }
    public Result(Integer code,String msg){
        this.code = code;
        this.msg = msg;
    }


    public static Result success(){
        return new Result(200,"请求成功",null);
    }

    public static Result success(Object data){
        return new Result(200,"请求成功",data);
    }

    public static Result error(){
        return new Result(404,"请求错误");
    }



}
