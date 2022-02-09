package com.wingchi.util;

import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;

public class MarkDownUtil {
    public static String markdownToHtml(String markdown){
        Parser parser = Parser.builder().build() ;
        Node node = parser.parse(markdown) ;
        HtmlRenderer render = HtmlRenderer.builder().build() ;
        return render.render(node) ;
    }
}
