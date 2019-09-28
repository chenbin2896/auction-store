package com.auction.store.auctionstoreaccount;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableEurekaClient
@RestController
public class AuctionStoreAccountApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuctionStoreAccountApplication.class, args);
    }

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Value("${spring.datasource.username}")
    private String url;

    @RequestMapping("/test")
    public String demo () {
        jdbcTemplate.query("select * from t_user ",new BeanPropertyRowMapper<>(String.class));
        return url;
    }
}
