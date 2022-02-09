package com.wingchi.mapper;

import com.wingchi.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserMapper {
    public User getUserByName(@Param("username") String username ) ;
    public String getAuthorNameById(Long id) ;

}
