package com.example.anesi.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.anesi.model.Product;

import com.example.anesi.model.Category;



@Mapper
public interface ProductMapper {
	// Store서비스에 상품기본정보 가져오는 매퍼
	List<Product> selectProduct(HashMap<String, Object> map);
	

	// 카테고리 검색
	List<Category> selectCategoryList();
}