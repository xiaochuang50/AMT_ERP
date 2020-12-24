package com.wulin.test;

import com.wulin.bean.SystemUser;
import com.wulin.dao.SystemUserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    SystemUserMapper systemUserMapper;

    @Test
    public void testSystemUserMapper(){
        SystemUser rootUser = systemUserMapper.findSystemUserByName("root");
        System.out.println(rootUser);
    }

}
