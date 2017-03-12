package com.lumr.bbs.dao;

import com.lumr.bbs.vo.MainBoard;
import com.lumr.bbs.vo.SonBoard;

import java.util.List;

/**
 * 子版块接口
 * Created by fsweb on 17-3-7.
 */
public interface SonBoardDao {
    List<SonBoard> get(MainBoard mainBoard);
    /**
     * 根据mid获取子版块主题
     * @param mid
     * @return
     */
    List<SonBoard> getByMainId(int mid);

    /**
     * 根据MainName获取子版块主题
     * @param name
     * @return
     */
    List<SonBoard> getByMainName(String name);

    /**
     * 重载
     * @param sonBoard 不需要定义id,只需name和mid
     * @return >0表示成功,0表示失败,-1表示数据库连接错误
     */
    int add(SonBoard sonBoard);

    /**
     * 增加新主题
     * @param name
     * @param mid
     * @return
     */
    int add(String name,int mid);

    /**
     * 同上
     * @param id
     * @param name
     * @param mid
     * @return
     */
    int add(int id,String name,int mid);
}
