package com.example.myshop_2_1323ly.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class Phone {
    @Id
    private Integer id;
    private String name;
    private float price;
    private String img;
}
