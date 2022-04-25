package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Notice;

public interface NoticeDao {

	List<Notice> searchNotice();

	Notice searchNoticeByIsbn(int isbn);

	void deleteNotice(int isbn);

	void insertNotice(Notice notice);

	void updateNotice(Notice notice);

	List<Notice> searchSortedByViews();

}
