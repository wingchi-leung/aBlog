package com.wingchi.controller;

import com.wingchi.bean.Article;
import com.wingchi.mapper.ArticleMapper;
import com.wingchi.util.MarkDownUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    ArticleMapper articleMapper ;

    @GetMapping("/{id}")
    public String getArticleById(@PathVariable("id")String id,Model model) {

        Article article = articleMapper.getPostById(Integer.parseInt(id)) ;
        article.setHtmlContent(MarkDownUtil.markdownToHtml(article.getMdContent()) );
        model.addAttribute("article",article);
        return "blog";
    }
}
