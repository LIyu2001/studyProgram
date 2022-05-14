package com.example.myshop_2_1323ly.controller;

import com.example.myshop_2_1323ly.entity.Cart;
import com.example.myshop_2_1323ly.repository.CarRepositiory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/car")
public class CarHandler {
    @Autowired
    private CarRepositiory carRepositiory;
    @GetMapping("/findAll")
    public List<Cart> findAll(){
        return carRepositiory.findAll();
    }


}
