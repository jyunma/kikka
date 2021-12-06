package com.obn.kidscafe;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@ComponentScan(basePackages = {"com.obn.*"})
public class KidsacafeApplication {

	public static void main(String[] args) {
		SpringApplication.run(KidsacafeApplication.class, args);
		System.out.println("시작해봅니다");
	}

}
