package com.myAwesomeWeb.system.domain.vo;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import com.myAwesomeWeb.system.domain.Menu;
import lombok.Data;

import java.util.List;

@Data
public class MenuVo extends Menu {

    /**
     * 雪花算法精读丢失问题
     * 将Long转换为String
     */
    @JsonSerialize(using = ToStringSerializer.class)
    private Long menuId;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long menuPid;

    /**
     * 菜单类型名称
     */
    private String menuTypeName;

    List<MenuVo> children;
}
