package com.lumr.bbs.service;

import com.lumr.bbs.vo.User;

/**
 * Created by fsweb on 17-3-8.
 */
public interface UserService {
    void register(User user);
    void login(User user);
    void update(User user);
}
