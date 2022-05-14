package com.example.myshop_2_1323ly.repository;

import com.example.myshop_2_1323ly.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CarRepositiory extends JpaRepository<Cart,Integer> {
}
