package com.lumr.bbs.service.impl;

import com.lumr.bbs.dao.impl.UserDaoImpl;
import com.lumr.bbs.service.UserService;
import com.lumr.bbs.vo.User;

/**
 * Created by fsweb on 17-3-8.
 */
public class UserServiceImpl implements UserService {
    @Override
    public int register(User user) {
        UserDaoImpl userDao = new UserDaoImpl();
        int isExist = userDao.isExist(user);
        switch (isExist){
            case 0:
                if (userDao.save(user)>0) {
                    System.out.println("注册成功.");
                    return 1;
                }
                return -1;
            case 1:
                System.out.println("用户已存在.");
                return 0;
            case -1:
                System.out.println("数据库连接错误,请稍后重试");
                return -1;
        }
        return -1;
    }

    @Override
    public int login(User user) {
        UserDaoImpl userDao = new UserDaoImpl();
        int login = userDao.login(user);
        switch (login){
            case 1:
                System.out.println("登录成功");
                break;
            case 0:
                System.out.println("没有此用户");
                break;
            case -2:
                System.out.println("密码错误");
                break;
            case -1:
                System.out.println("数据库连接错误,请稍后重试");
                break;
        }
        return login;
    }

    @Override
    public void update(User user) {
        UserDaoImpl userDao = new UserDaoImpl();
        int update = userDao.updateHead(user);
        switch (update){
            case 1:
                System.out.println("更新成功");
                break;
            case 0:
                System.out.println("更新失败");
                break;
            case -1:
                System.out.println("数据库连接失败");
                break;
        }
    }

}
