package com.myAwesomeWeb.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "dict")
public class Dict {
    @TableId(value = "dict_id",type = IdType.AUTO)
    private Long dictId;
    private String dictName;
    private String dictType;
    private Integer dictValue;
}
