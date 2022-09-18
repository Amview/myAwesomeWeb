package com.myAwesomeWeb.system.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("menu")
public class Menu {

    @TableId(value = "menu_id",type = IdType.AUTO)
    private Long menuId;
    private String menuName;
    private String menuPath;
    private String menuPermission;
    private Long menuPid;
    private Long menuOrder;
    private String menuType;
    private Long menuTypeValue;
    private String componentPath;
}
