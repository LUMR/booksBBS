package com.lumr.bbs.vo;

import com.lumr.bbs.dao.BaseDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 * Created by fsweb on 17-3-7.
 */
public class Reply {
    private int id;
    private String content;
    private Date createDate;
    private Date alterDate;
    private User user;
    private Topic topic;

    public Reply() {
    }

    public Reply(String content, User user, Topic topic) {
        this.content = content;
        this.user = user;
        this.topic = topic;
        this.createDate = new Date();
        this.alterDate = new Date();
    }

    public Reply(String content, Date createDate, Date alterDate, User user, Topic topic) {
        this.content = content;
        this.createDate = createDate;
        this.alterDate = alterDate;
        this.user = user;
        this.topic = topic;
    }

    public Reply(int id, String content, Date createDate, Date alterDate, User user, Topic topic) {
        this.id = id;
        this.content = content;
        this.createDate = createDate;
        this.alterDate = alterDate;
        this.user = user;
        this.topic = topic;
    }

    @Override
    public String toString() {
        return "回复人:" + user.getName() +
                "\n{'" + content + '\'' +
                "}\n createDate=" + createDate +
                ", alterDate=" + alterDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getAlterDate() {
        return alterDate;
    }

    public void setAlterDate(Date alterDate) {
        this.alterDate = alterDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser() {
        BaseDao baseDao = new BaseDao();
        Connection conn = baseDao.getConn();
        String sql = "select * from user where id = "+user.getId();
        try {
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(sql);
            if (result.next()){
                user.setName(result.getString("name"));
                user.setRegDate(result.getDate("regDate"));
                user.setGender(result.getString("gender"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            baseDao.closeAll();
        }
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }
}
