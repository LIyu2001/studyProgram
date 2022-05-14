package com.example.myshop_2_1323ly.controller;

import com.example.myshop_2_1323ly.entity.Phone;
import com.example.myshop_2_1323ly.repository.PhoneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/phone")
public class PhoneHandler {
    @Autowired
    private PhoneRepository phoneRepository;
    @GetMapping("/findAll")
    public List<Phone> findAll(){
        return phoneRepository.findAll();
    }
}
