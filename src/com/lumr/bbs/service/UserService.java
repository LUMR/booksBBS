package com.lumr.bbs.service;

import com.lumr.bbs.vo.User;

/**
 * 用户服务
 * Created by fsweb on 17-3-8.
 */
public interface UserService {
    /**
     * 注册
     * @return 1注册成功，0用户已存在，-1数据库错误
     */
    int register(User user);
    int login(User user);
    void update(User user);
}
