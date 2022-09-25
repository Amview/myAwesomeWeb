package com.myAwesomeWeb.system.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.myAwesomeWeb.system.domain.Dict;
import com.myAwesomeWeb.system.domain.Menu;
import com.myAwesomeWeb.system.domain.vo.MenuVo;
import com.myAwesomeWeb.system.service.DictService;
import com.myAwesomeWeb.system.service.MenuService;
import com.myAwesomeWeb.utils.Result;
import com.myAwesomeWeb.utils.bean.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/system/menu")
public class MenuController extends BaseController{
    @Resource
    private MenuService menuService;
    @Resource
    private DictService dictService;

    @GetMapping("/list")
    public Result list(){
        startPage();
        List<Menu> list =  menuService.list();
//        List<MenuVo> menuVos = new ArrayList<>();
//        MenuVo menuVo = null;
//        for (Menu menu : list) {
//            menuVo = new MenuVo();
//            BeanUtils.copyBeanProp(menuVo,menu);
//
//            Dict dict = dictService.getOne(new LambdaQueryWrapper<Dict>() {{
//                and(i -> i.eq(Dict::getDictType, menu.getMenuType()).eq(Dict::getDictValue, menu.getMenuTypeValue()));
//            }});
//            menuVo.setMenuTypeName(dict.getDictName());
//            menuVos.add(menuVo);
//        }
        return Result.page(list);
    }

    @GetMapping("/sysMenu")
    public Result sysMenu() throws Exception {
        startPage();
        List<MenuVo> menuVoList = BeanUtils.copyBeanPropList2List(menuService.list(), MenuVo.class);
        List<MenuVo> mainMenuList = new ArrayList<>();
        for (MenuVo menuVo : menuVoList) {
            if(menuVo.getMenuPid() == 0){
                mainMenuList.add(menuVo);
            }
        }
        menuVoList.removeAll(mainMenuList);
        for (MenuVo menuVo : mainMenuList) {
            menuVo.setChildren(getMenuChildren(menuVo.getMenuId(),menuVoList));

        }

        return Result.page(mainMenuList);

    }
    public List<MenuVo> getMenuChildren(Long menuId,List<MenuVo> menuVoList){
        List<MenuVo> childrenMenuList = new ArrayList<>();
        for (MenuVo menuVo : menuVoList) {
            if(menuVo.getMenuPid().equals(menuId)){
                childrenMenuList.add(menuVo);
            }
        }
        for (MenuVo menuVo : childrenMenuList) {
            menuVo.setChildren(getMenuChildren(menuVo.getMenuId(),menuVoList));
        }
        return childrenMenuList;
    }

    @PostMapping("/add")
    public Result add(@RequestBody Menu menu){
        boolean save = menuService.save(menu);
        return Result.success(save);

    }
    @GetMapping("/getById")
    public Result getById(Long id){
        Menu menu = menuService.getById(id);
        return Result.success(menu);
    }
    @GetMapping ("/deleteById")
    public Result deleteById(Long id){
        boolean b = menuService.removeById(id);
        return Result.success(b);
    }
    @PostMapping("/update")
    public Result updateMenu(@RequestBody Menu menu){
        boolean b = menuService.updateById(menu);
        return Result.success(b);
    }
}
