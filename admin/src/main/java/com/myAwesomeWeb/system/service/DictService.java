package com.myAwesomeWeb.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.myAwesomeWeb.system.domain.Dict;
import com.myAwesomeWeb.system.domain.vo.DictValue;

import java.util.List;

public interface DictService extends IService<Dict> {

    List<DictValue> getDictValueList();
}
