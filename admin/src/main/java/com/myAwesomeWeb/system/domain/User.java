package com.myAwesomeWeb.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@Data
@TableName(value = "user")
public class User {

    @TableId(value = "id",type = IdType.AUTO)
    private Long id;
    private String userName;
    @JsonIgnore
    private String password;
}
