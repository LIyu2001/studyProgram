package com.example.myshop_2_1323ly.repository;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class ComputerRepositoryTest {
    @Autowired
    private ComputerRepository computerRepository;
    @Test
    void findAll(){
        System.out.println(computerRepository.findAll());
    }

}