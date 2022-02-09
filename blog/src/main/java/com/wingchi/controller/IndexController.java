package com.wingchi.controller;


import com.wingchi.bean.Article;
import com.wingchi.bean.Tag;
import com.wingchi.bean.User;
import com.wingchi.mapper.ArticleMapper;
import com.wingchi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
public class IndexController {
    @Autowired
    ArticleMapper articleMapper ;
    @Autowired
    UserMapper userMapper ;

    @ModelAttribute(name="id")
    public Integer getCurrentUserId(Model model){
        Integer id = ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
        return id ;
    }


    @GetMapping(value={"/","/index"})
    public String index( Model model ){
        Map<String, Object> map = model.asMap();
        Integer id = (Integer)map.get("id");
        List<Article> articleList = articleMapper.GetAuthorAllPost(id);
        model.addAttribute("articles",articleList) ;
        model.addAttribute("total",articleList.size());
        return "index";
    }

    @GetMapping("/tag")
    public  String tags(Model model) {
        Integer id = (Integer) model.asMap().get("id") ;
        List<Tag> tagList = articleMapper.getTagsByAuthorId(id) ;
        model.addAttribute("tags",tagList) ;
        return "tags" ;
    }

    @GetMapping("/category")
    public String categroy(){

        return "category" ;
    }


    @GetMapping("/about")
    public String aboutMe(){
        return "about";
    }





    @GetMapping(value="testE")
    public  String get(){
        return "testEditor" ;
    }
}
