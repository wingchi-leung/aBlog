package com.wingchi.mapper;

import com.wingchi.bean.Article;
import com.wingchi.bean.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ArticleMapper {
    public List<Article> GetAuthorAllPost(Integer id );
    public Article  getPostById(Integer id) ;
    public List<Tag> getTagsByAuthorId(Integer id) ;
}
