package com.myAwesomeWeb.utils;

import com.github.pagehelper.PageInfo;
import lombok.Data;

import java.util.List;

@Data
public class Result {

    private Integer code;

    private String msg;

    private Object result;

    public Result(){

    }
    public Result(Integer code,String msg,Object result){
        this.code = code;
        this.msg = msg;
        this.result = result;
    }
    public Result(Integer code,String msg){
        this.code = code;
        this.msg = msg;
    }


    public static Result success(){
        return new Result(200,"请求成功",null);
    }

    public static Result success(Object result){
        return new Result(200,"请求成功",result);
    }

    public static Result error(){
        return new Result(404,"请求错误");
    }

    public static<T> Result page(List<T> list){
        PageInfo<T> pageInfo = new PageInfo<>(list);
        return new Result(200,"请求成功",pageInfo);
    }



}
