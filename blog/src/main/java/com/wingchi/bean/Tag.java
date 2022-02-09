package com.wingchi.bean;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class Tag {
    String name;
    Integer id ;
    Timestamp createTime;
    Integer authorId;
}
