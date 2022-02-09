package com.wingchi.bean;

import lombok.Data;

import java.sql.Timestamp;
import java.util.List;

@Data
public class Article {
    Integer id ;
    String title;
    String htmlContent;
    String mdContent;
    String authorName;
    String columnName ;
    Integer pv ; // 阅读量
    Integer authorId;
    Integer commentNum ;
    Integer columnId;
    String summary ;  //摘要
    Integer state ; // 0为草稿，1为已发表，2为已删除
    Timestamp publishTime;
    Timestamp lastModify;
    List<Tag> tagList;


}
