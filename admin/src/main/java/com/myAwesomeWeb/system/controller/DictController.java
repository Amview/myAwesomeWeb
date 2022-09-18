package com.myAwesomeWeb.system.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.myAwesomeWeb.system.domain.Dict;
import com.myAwesomeWeb.system.domain.vo.DictValue;
import com.myAwesomeWeb.system.service.DictService;
import com.myAwesomeWeb.system.service.MenuService;
import com.myAwesomeWeb.system.service.UserService;
import com.myAwesomeWeb.utils.Result;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@RestController
@RequestMapping("/system/dict")
public class DictController {
    @Resource
    private DictService dictService;

    @Resource
    private UserService userService;

    @Resource
    private MenuService menuService;

    @GetMapping("/list")
    public Result list(){
        return Result.success();
    }
    @GetMapping("/get")
    public Result getById(Long id){
        Dict dict = dictService.getById(id);
        return Result.success(dict);
    }
    @GetMapping("/getByType")
    public Result getByType(String dictType) {
        LambdaQueryWrapper<Dict> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Dict::getDictType, dictType);

        List<Dict> list = dictService.list(queryWrapper);
        List<DictValue> dictValues = new ArrayList<>();
        Iterator<Dict> iterator = list.iterator();
        while (iterator.hasNext()){
            Dict next = iterator.next();
            dictValues.add(new DictValue(next.getDictName(),String.valueOf(next.getDictValue())));
        }

        return Result.success(dictValues);
    }

    @GetMapping("/userDictList")
    public Result userDictList(){
        List<DictValue> userDictList = userService.getUserDictList();
        return Result.success(userDictList);

    }

    @GetMapping("/menuDictList")
    public Result menuDictList(){
        List<DictValue> menuDictList = menuService.getMenuDictList();
        return Result.success(menuDictList);
    }

}
