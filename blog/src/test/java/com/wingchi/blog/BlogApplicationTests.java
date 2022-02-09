package com.wingchi.blog;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@MapperScan("com.wingchi.mapper")
class BlogApplicationTests {

	@Test
	void contextLoads() {
	}

}
