package com.auction.store.good.controller;

import com.alibaba.fastjson.JSONObject;
import com.auction.store.good.entity.Good;
import com.auction.store.good.entity.Response;
import com.auction.store.good.service.GoodService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author User
 * @date 2019/9/28
 * @description
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("/v1/good")
public class GoodController {

    @Autowired
    private GoodService goodService;

    private static final Map<String ,String > map = new HashMap<>();


    @ApiOperation("批量生成模拟数据")
    @GetMapping("insert/mock")
    public Response<List<Good>> insertMock () {
        List<Good> goods = new ArrayList<>();
        for (int i =0; i < 10; i++) {
            Good user = new Good();

        }
        return goodService.insertMock(goods);
    }




}
