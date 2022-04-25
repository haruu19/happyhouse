package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.NoticeDao;
import com.ssafy.happyhouse.model.dao.NoticeDaoImpl;
import com.ssafy.happyhouse.model.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;

	@Override
	public List<Notice> list(){
		return dao.searchNotice();
	}

	@Override
	public Notice searchNoticeByIsbn(int isbn){
		return dao.searchNoticeByIsbn(isbn);
	}

	@Override
	public void deleteNoticeByIsbn(int isbn){
		dao.deleteNotice(isbn);
	}

	@Override
	public void insertNotice(Notice notice){
		dao.insertNotice(notice);
	}

	@Override
	public void updateNotice(Notice notice){
		dao.updateNotice(notice);
	}

	@Override
	public List<Notice> listSortedByViews(){
		return dao.searchSortedByViews();
	}

}
