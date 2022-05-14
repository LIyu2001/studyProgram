package com.example.myshop_2_1323ly.controller;

import com.example.myshop_2_1323ly.entity.Computer;
import com.example.myshop_2_1323ly.repository.ComputerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/com")
public class ComputerHandler {
    @Autowired
    private ComputerRepository computerRepository;

    @GetMapping("/findAll")
    public List<Computer> findAll(){
        return computerRepository.findAll();
    }

}
