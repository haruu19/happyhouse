package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Notice;

public interface NoticeService {

	List<Notice> list();

	Notice searchNoticeByIsbn(int isbn);

	void deleteNoticeByIsbn(int isbn);

	void insertNotice(Notice notice);

	void updateNotice(Notice notice);

	List<Notice> listSortedByViews();

}
