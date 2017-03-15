package com.lumr.bbs.vo;

import com.lumr.bbs.dao.BaseDao;
import com.lumr.bbs.dao.ReplyDao;
import com.lumr.bbs.dao.impl.ReplyDaoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

/**
 * Created by fsweb on 17-3-7.
 */
public class Topic {
    private int id;
    private String title;
    private String content;
    private Date createDate;
    private SonBoard sonBoard;
    private User user;

    public Topic() {
        id = 0;
        title = "无";
        content = "无";
        createDate = new Date();
        sonBoard = new SonBoard();
        user = new User();
    }

    public Topic(int id) {
        this.id = id;
    }

    public Topic(int id, String title, String content, Date createDate, SonBoard sonBoard, User user) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createDate = createDate;
        this.sonBoard = sonBoard;
        this.user = user;
    }

    public Topic(String title, String content, Date createDate, SonBoard sonBoard, User user) {
        this.title = title;
        this.content = content;
        this.createDate = createDate;
        this.sonBoard = sonBoard;
        this.user = user;
    }

    public List<Reply> getReply(){
        ReplyDao replyDao = new ReplyDaoImpl();
        return replyDao.getAll(this);
    }

    @Override
    public String toString() {
        return "帖子{" +
                "id:" + id +
                ", title='" + title + '\'' +
                "\t\t" + createDate +
                ", \t" + user.getName() +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public SonBoard getSonBoard() {
        return sonBoard;
    }

    public void setSonBoard(SonBoard sonBoard) {
        this.sonBoard = sonBoard;
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
                user.setHead(result.getString("head"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            baseDao.closeAll();
        }
    }
}
