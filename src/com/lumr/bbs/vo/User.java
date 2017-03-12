package com.lumr.bbs.vo;

import java.util.Date;

/**
 * Created by fsweb on 17-3-6.
 *@author lumr
 */
public class User {
    private int id;
    private String name;
    private String password;
    private String gender;
    private String head;
    private Date regDate;

    public User() {
    }

    /**
     * 查询时的构造器
     * @param id
     */
    public User(int id) {
        this.id = id;
    }

    /**
     * 登录构造器
     * @param name
     * @param password
     */
    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    /**
     * 注册构造器
     * @param name 名字
     * @param password 密码
     * @param gender 性别
     */
    public User(String name, String password, String gender, String head) {
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.head = head;
        this.regDate = new Date();
    }

    @Override
    public String toString() {
        return "用户{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", regDate=" + regDate +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }
}
