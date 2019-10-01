package com.auction.store.good.service;


import com.auction.store.good.dao.GoodDao;
import com.auction.store.good.entity.Good;
import com.auction.store.good.entity.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

/**
 * @author User
 * @date 2019/9/28
 * @description
 */
@Service
public class GoodService {

    @Autowired
    private GoodDao goodDao;

    /**
     * 生成模拟数据
     * @param users
     * @return
     */
    public Response<List<Good>> insertMock(List<Good> users) {
        try{
            return Response.success(goodDao.saveAll(users));
        }catch (Exception e) {
            return Response.failed(e.getMessage());
        }
    }

    /**
     * 查询商品
     * @return
     */
    public Response<Good> select (Good user) {
        try{
            Example<Good> example = Example.of(user);
            Optional<Good> opt =  goodDao.findOne(example);
            return Response.success(opt.get());
        }catch (Exception e) {
            return Response.failed(e.getMessage());
        }
    }

    /**
     * 添加商品
     * @param user
     * @return
     */
    public Response<Good> insert (Good user) {
        try{
            return Response.success(goodDao.save(user));
        }catch (Exception e) {
            return Response.failed(e.getMessage());
        }
    }

}
