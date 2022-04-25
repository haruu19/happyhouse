package com.ssafy.happyhouse.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.News;

@Service
public class NewsServiceImpl implements NewsService{
	private static String HOUSE_NEWS_URL = "https://search.naver.com/search.naver?sm=tab_hty.top&where=news&query=%EC%95%84%ED%8C%8C%ED%8A%B8+%EB%A7%A4%EB%A7%A4&oquery=%EC%95%84%ED%8C%8C%ED%8A%B8&tqi=UXePlwprvxZsskiyQedssssssB0-158194";

	@Override
	@PostConstruct
	public List<News> retrieveNews() {
		List<News> list = new ArrayList<>();
		Document doc;
		try {
			doc = Jsoup.connect(HOUSE_NEWS_URL).get();
			Elements contents = doc.select(".type01 ._sp_each_title");
//			System.out.println(contents.toString());
			for(Element content : contents) { 
				News news = new News();
				news.setTitle(content.text());
				news.setRef(content.attr("href"));
				System.out.println(news.toString());
				list.add(news);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

}
