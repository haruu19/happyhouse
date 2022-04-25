package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.News;


public interface NewsService {
	public List<News> retrieveNews();
}
