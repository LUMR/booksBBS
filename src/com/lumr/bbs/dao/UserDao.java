package com.lumr.bbs.dao;

import com.lumr.bbs.vo.User;

/**
 * 用户接口
 * Created by fsweb on 17-3-6.
 */
public interface UserDao {
    /**
     * 登陆验证密码
     * @param user 用户信息
     * @return 1表示密码正确，0表示没有此用户,-1表示密码错误，-2表示连接错误
     */
    int login(User user);

    /**
     * 注册用户
     * @param user
     * @return >0保存成功,-1数据库连接错误
     */
    int save(User user);

    /**
     * 更新用户的名字,密码,性别
     * @param user
     * @return 1更新成功,0.更新失败,-1数据库错误
     */
    int update(User user);

    /**
     * 判断用户是否存在
     * @return 1.存在 0.不存在 -1.数据库错误
     */
    int isExist(User uset);
}
