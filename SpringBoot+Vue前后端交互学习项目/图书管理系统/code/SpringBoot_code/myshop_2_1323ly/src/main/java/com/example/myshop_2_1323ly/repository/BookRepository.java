package com.example.myshop_2_1323ly.repository;

import com.example.myshop_2_1323ly.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book,Integer> {
}
