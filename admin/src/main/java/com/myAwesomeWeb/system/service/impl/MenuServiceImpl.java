package com.myAwesomeWeb.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.myAwesomeWeb.system.domain.Menu;
import com.myAwesomeWeb.system.domain.User;
import com.myAwesomeWeb.system.domain.vo.DictValue;
import com.myAwesomeWeb.system.mapper.MenuMapper;
import com.myAwesomeWeb.system.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public List<DictValue> getMenuDictList() {
        List<DictValue> dictValues = new ArrayList<>();
        List<Menu> menus = menuMapper.selectList(null);
        for (Menu menu : menus) {
            dictValues.add(new DictValue(menu.getMenuName(),String.valueOf(menu.getMenuId())));
        }
        return dictValues;
    }
}
