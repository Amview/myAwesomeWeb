package com.myAwesomeWeb.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.myAwesomeWeb.system.domain.Menu;
import com.myAwesomeWeb.system.domain.vo.DictValue;

import java.util.List;

public interface MenuService extends IService<Menu> {

    List<DictValue> getMenuDictList();
}
