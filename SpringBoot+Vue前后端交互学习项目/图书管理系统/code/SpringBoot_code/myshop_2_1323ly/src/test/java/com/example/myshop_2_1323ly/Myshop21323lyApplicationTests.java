package com.example.myshop_2_1323ly;

import com.example.myshop_2_1323ly.entity.Book;
import com.example.myshop_2_1323ly.repository.BookRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class Myshop21323lyApplicationTests {
    @Autowired
    private BookRepository bookRepository;
    @Test
    void save() {
        Book book = new Book();
        book.setName("java红宝书");
        book.setAuthor("张三");
        Book book1 = bookRepository.save(book);
        System.out.println(book1);
    }

    @Test
    void findById(){
        Book book = bookRepository.findById(1).get();
        System.out.println(book);
    }

}
