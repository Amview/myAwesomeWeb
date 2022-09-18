package com.myAwesomeWeb.system.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.myAwesomeWeb.system.domain.Dict;
import com.myAwesomeWeb.system.domain.vo.DictValue;
import com.myAwesomeWeb.system.mapper.DictMapper;
import com.myAwesomeWeb.system.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class DictServiceImpl extends ServiceImpl<DictMapper, Dict> implements DictService {

    @Autowired
    private DictMapper dictMapper;
    @Override
    public List<DictValue> getDictValueList() {
        List<DictValue> dictValues = new ArrayList<>();
        List<Dict> list = dictMapper.selectList(null);
        for (Dict dict : list) {
            dictValues.add(new DictValue(dict.getDictName(),String.valueOf(dict.getDictId())));
        }
        return dictValues;
    }
}
