package com.ssafy.happyhouse.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ssafy.happyhouse.model.dto.Fav;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Member;
import com.ssafy.happyhouse.model.dto.Notice;
import com.ssafy.happyhouse.model.dto.Store;
import com.ssafy.happyhouse.model.service.FavService;
import com.ssafy.happyhouse.model.service.FavServiceImpl;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.HouseServiceImpl;
import com.ssafy.happyhouse.model.service.MemberService;
import com.ssafy.happyhouse.model.service.MemberServiceImpl;
import com.ssafy.happyhouse.model.service.NoticeService;
import com.ssafy.happyhouse.model.service.NoticeServiceImpl;
import com.ssafy.happyhouse.model.service.StoreService;
import com.ssafy.happyhouse.model.service.StoreServiceImpl;
import com.ssafy.happyhouse.util.AlgoUtil;

@Controller
public class MainController extends HttpServlet {
	
	@Autowired
	private HouseService houseService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FavService favService;
	@Autowired
	private StoreService storeService;

	@GetMapping("/main.do")
	public void main(){}
	
	
	@GetMapping("fav/favList")
	public void searchFav(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("memberinfo");
		String id = member.getId();
		model.addAttribute("list", favService.searchFav(id));
	}
	
}
//	private void process(HttpServletRequest request, HttpServletResponse response)
//			throws Exception {
//		String root = request.getContextPath();
//
//		String path = "";
//
//		String act = request.getParameter("act");
////===============기본 관리 사용자============================
//		if ("login".equals(act)) {
//			path = login(request, response);
////=================아파트 실거래가 검색=============
//		} else if ("houselist".equals(act)) {
//			path = houseList(request,response);
//		} else if ("housedetail".equals(act)) {
//			path = houseDetail(request,response);
////=================상권정보 검색=============
//		} else if ("storelist".equals(act)) {
//			path = storeList(request,response);
//		} else if ("storedetail".equals(act)) {
//			path = storeDetail(request,response);
////=================지도=============	
//		} else {
//			path = "/views/main.jsp";
//		}
//		if(path.startsWith("redirect:")) {
//			response.sendRedirect(root+path.substring("redirect:".length()));
//			return;
//		}
//		RequestDispatcher rd = request.getRequestDispatcher(path);
//		rd.forward(request, response);
//	}
//
//
//
//	private String storeDetail(HttpServletRequest request, HttpServletResponse response) {
//		int no = Integer.parseInt(request.getParameter("no"));
//		Store store = storeService.search(no);
//		request.setAttribute("store", store);
//
//		return "/views/storedetail.jsp";
//	}
//
//	private String storeList(HttpServletRequest request, HttpServletResponse response) {
//		String page = request.getParameter("page");
//		List<Store> list = storeService.searchAll();
//		request.setAttribute("count", list.size());
//		request.setAttribute("list", list);
//		request.setAttribute("page", page);
//		
//		return "/views/storelistsearch.jsp";
//	}
//
//
//	private String houseDetail(HttpServletRequest request, HttpServletResponse response) {
//		int no = Integer.parseInt(request.getParameter("no"));
//		HouseDeal apt = houseService.search(no);
//		request.setAttribute("apt", apt);
//
//		// TODO Auto-generated method stub
//		return "/views/housedetail.jsp";
//	}
//	/** 조회 내용 표시할 table */
////	private DefaultTableModel houseModel;
//	/** model들 */
//	private boolean[] searchType = { true, true, true, true };
//	/** 검색 조건 */
//	private String key;
//	/** 검색할 단어 */
//	private String word;
//	private String houseList(HttpServletRequest request, HttpServletResponse response) {
//		HousePageBean bean = new HousePageBean();
//		bean.setSearchType(searchType);
//		key= request.getParameter("searchType");
//		word=request.getParameter("searchWord");
//		if (key != null) {
//			if (key.equals("dong")) {
//				bean.setDong(word);
//			} else if (key.equals("aptname")) {
//				bean.setAptname(word);
//			}
//		}
//		bean.setKey(key);
//		bean.setWord(word);
//		String page=request.getParameter("page");
//		int p=0;
//		if(page!=null)
//			p=Integer.parseInt(page);
//		bean.setPageNo(p);
//		List<HouseDeal> list = houseService.searchAll(bean);
//		bean.setHousePageBean();
//		list = AlgoUtil.quickSort(list);
//		request.setAttribute("list", list);
//		request.setAttribute("bean", bean);
//		
//		
//		return "/views/houselistsearch.jsp";
//	}
//
//	private String deleteFav(HttpServletRequest request, HttpServletResponse response) {
//		String id = request.getParameter("id");
//		String dong = request.getParameter("dong");
//		String city = request.getParameter("city");
//		Fav fav = new Fav();
//		fav.setId(id);
//		fav.setDong(dong);
//		fav.setCity(city);
//		
//		try {
//			favService.deleteFav(fav);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "관심지역 삭제 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		
//		return "redirect:/main.do?act=favlist";
//	}
//	
//	private String favList(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		Member member = (Member) session.getAttribute("memberinfo");
//		List<Fav> list;
//		try {
//			list = favService.searchFav(member.getId());
//			request.setAttribute("list", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "관심지역 조회 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "views/favList.jsp";
//	}
//	
//	private String favSet(HttpServletRequest request, HttpServletResponse response) {
//		String id = request.getParameter("id");
//		String local = request.getParameter("local");
//		String city = request.getParameter("city");
//		String dong = request.getParameter("dong");
//		Fav fav = new Fav();
//		fav.setId(id);
//		fav.setLocal(local);
//		fav.setCity(city);
//		fav.setDong(dong);
//		try {
//			favService.setFav(fav);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "관심지역 등록 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "redirect:/main.do?act=favlist";
//	}
//	
//	private String favSetForm(HttpServletRequest request, HttpServletResponse response) {
//		return "/views/favForm.jsp";
//	@Autowired
//	private MemberService memberService;
//	@Autowired
//	private HouseService houseService;
//	@Autowired
//	private NoticeService noticeService;
//	@Autowired
//	private FavService favService;
//	@Autowired
//	private StoreService storeService;
//
//	public void init() {
//		memberService = new MemberServiceImpl();
//		houseService = new HouseServiceImpl();
//		noticeService = new NoticeServiceImpl();
//		favService = new FavServiceImpl();
//		storeService = new StoreServiceImpl();
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		try {
//			process(request, response);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		try {
//			process(request, response);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//	private void process(HttpServletRequest request, HttpServletResponse response)
//			throws Exception {
//		String root = request.getContextPath();
//
//		String path = "";
//
//		String act = request.getParameter("act");
////===============기본 관리 사용자============================
//		if ("login".equals(act)) {
//			path = login(request, response);
//		} else if ("logout".equals(act)) {
//			path = logout(request, response);
//		} else if ("register".equals(act)) {		//회원정보 등록
//			path = register(request,response);
//		} else if ("registerform".equals(act)) {	//회원정보 등록창
//			path = registerForm(request,response);
//		} else if ("member".equals(act)) {			//회원정보 조회
//			path = memberView(request,response);
//		} else if ("updateForm".equals(act)) {		//회원정보 수정창
//			path = updateForm(request,response);
//		} else if ("update".equals(act)) {			//회원정보 수정
//			path = update(request,response);
//		} else if ("delete".equals(act)) {			//회원정보 삭제
//			path = delete(request,response);
//		} else if ("change".equals(act)) {
//			path = change(request,response);
//		} else if ("findpwdform".equals(act)) {
//			path = findPwdForm(request,response);
//		} else if ("newpwdform".equals(act)) {
//			path = newPwdForm(request,response);
//		} else if ("newpwd".equals(act)) {
//			path = newPwd(request,response);
////================공지사항=====================
//		} else if ("notice".equals(act)) {
//			path = notice(request,response);
//		} else if ("noticeSort".equals(act)) {
//			path = noticeSort(request,response);
//		} else if ("writeNoticeForm".equals(act)) {
//			path = writeNoticeForm(request,response);
//		} else if ("writeNotice".equals(act)) {
//			path = writeNotice(request,response);
//		} else if ("noticeDetail".equals(act)) {
//			path = noticeDetail(request,response);
//		} else if ("updateNoticeForm".equals(act)) {
//			path = updateNoticeForm(request,response);
//		} else if ("updateNotice".equals(act)) {
//			path = updateNotice(request,response);
//		} else if ("deleteNotice".equals(act)) {
//			path = deleteNotice(request,response);
////=================관심지역=====================
//		} else if ("favsetform".equals(act)) {
//			path = favSetForm(request,response);		
//		} else if ("favset".equals(act)) {
//			path = favSet(request,response);		
//		} else if ("favlist".equals(act)) {
//			path = favList(request,response);		
//		} else if ("deletefav".equals(act)) {
//			path = deleteFav(request,response);		
////=================아파트 실거래가 검색=============
//		} else if ("houselist".equals(act)) {
//			path = houseList(request,response);
//		} else if ("housedetail".equals(act)) {
//			path = houseDetail(request,response);
////=================상권정보 검색=============
//		} else if ("storelist".equals(act)) {
//			path = storeList(request,response);
//		} else if ("storedetail".equals(act)) {
//			path = storeDetail(request,response);
////=================지도=============	
//		} else {
//			path = "/views/main.jsp";
//		}
//		if(path.startsWith("redirect:")) {
//			response.sendRedirect(root+path.substring("redirect:".length()));
//			return;
//		}
//		RequestDispatcher rd = request.getRequestDispatcher(path);
//		rd.forward(request, response);
//	}
//
//
//
//	private String storeDetail(HttpServletRequest request, HttpServletResponse response) {
//		int no = Integer.parseInt(request.getParameter("no"));
//		Store store = storeService.search(no);
//		request.setAttribute("store", store);
//
//		return "/views/storedetail.jsp";
//	}
//
//	private String storeList(HttpServletRequest request, HttpServletResponse response) {
//		String page = request.getParameter("page");
//		List<Store> list = storeService.searchAll();
//		request.setAttribute("count", list.size());
//		request.setAttribute("list", list);
//		request.setAttribute("page", page);
//		
//		return "/views/storelistsearch.jsp";
//	}
//
//
//	private String houseDetail(HttpServletRequest request, HttpServletResponse response) {
//		int no = Integer.parseInt(request.getParameter("no"));
//		HouseDeal apt = houseService.search(no);
//		request.setAttribute("apt", apt);
//
//		// TODO Auto-generated method stub
//		return "/views/housedetail.jsp";
//	}
//	/** 조회 내용 표시할 table */
////	private DefaultTableModel houseModel;
//	/** model들 */
//	private boolean[] searchType = { true, true, true, true };
//	/** 검색 조건 */
//	private String key;
//	/** 검색할 단어 */
//	private String word;
//	private String houseList(HttpServletRequest request, HttpServletResponse response) {
//		HousePageBean bean = new HousePageBean();
//		bean.setSearchType(searchType);
//		key= request.getParameter("searchType");
//		word=request.getParameter("searchWord");
//		if (key != null) {
//			if (key.equals("dong")) {
//				bean.setDong(word);
//			} else if (key.equals("aptname")) {
//				bean.setAptname(word);
//			}
//		}
//		bean.setKey(key);
//		bean.setWord(word);
//		String page=request.getParameter("page");
//		int p=0;
//		if(page!=null)
//			p=Integer.parseInt(page);
//		bean.setPageNo(p);
//		List<HouseDeal> list = houseService.searchAll(bean);
//		bean.setHousePageBean();
//		list = AlgoUtil.quickSort(list);
//		request.setAttribute("list", list);
//		request.setAttribute("bean", bean);
//		
//		
//		return "/views/houselistsearch.jsp";
//	}
//
//	private String deleteFav(HttpServletRequest request, HttpServletResponse response) {
//		String id = request.getParameter("id");
//		String dong = request.getParameter("dong");
//		String city = request.getParameter("city");
//		Fav fav = new Fav();
//		fav.setId(id);
//		fav.setDong(dong);
//		fav.setCity(city);
//		
//		try {
//			favService.deleteFav(fav);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "관심지역 삭제 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		
//		return "redirect:/main.do?act=favlist";
//	}
//	
//	private String favList(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		Member member = (Member) session.getAttribute("memberinfo");
//		List<Fav> list;
//		try {
//			list = favService.searchFav(member.getId());
//			request.setAttribute("list", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "관심지역 조회 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "views/favList.jsp";
//	}
//	
//	private String favSet(HttpServletRequest request, HttpServletResponse response) {
//		String id = request.getParameter("id");
//		String local = request.getParameter("local");
//		String city = request.getParameter("city");
//		String dong = request.getParameter("dong");
//		Fav fav = new Fav();
//		fav.setId(id);
//		fav.setLocal(local);
//		fav.setCity(city);
//		fav.setDong(dong);
//		try {
//			favService.setFav(fav);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "관심지역 등록 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "redirect:/main.do?act=favlist";
//	}
//	
//	private String favSetForm(HttpServletRequest request, HttpServletResponse response) {
//		return "/views/favForm.jsp";
//	}
//
//	private String deleteNotice(HttpServletRequest request, HttpServletResponse response) {
//		try {
//			noticeService.deleteNoticeByIsbn(Integer.parseInt(request.getParameter("isbn")));
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "공지사항 삭제 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "redirect:/main.do?act=notice";
//	}
//
//	private String updateNotice(HttpServletRequest request, HttpServletResponse response) {
//		int isbn = Integer.parseInt(request.getParameter("isbn"));
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		Notice notice = new Notice();
//		notice.setIsbn(isbn);
//		notice.setTitle(title);
//		notice.setContent(content);
//		try {
//			noticeService.updateNotice(notice);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "공지사항 수정 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		
//		return "redirect:/main.do?act=notice";
//	}
//
//	private String updateNoticeForm(HttpServletRequest request, HttpServletResponse response) {
//		Notice notice;
//		try {
//			notice = noticeService.searchNoticeByIsbn(Integer.parseInt(request.getParameter("isbn")));
//			request.setAttribute("notice", notice);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "공지사항 수정 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "/views/noticeUpdateForm.jsp";
//	}
//
//	private String noticeDetail(HttpServletRequest request, HttpServletResponse response) {
//		Notice notice;
//		try {
//			notice = noticeService.searchNoticeByIsbn(Integer.parseInt(request.getParameter("isbn")));
//			request.setAttribute("notice", notice);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "공지사항 조회 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "/views/noticeDetail.jsp";
//	}
//
//	private String writeNotice(HttpServletRequest request, HttpServletResponse response) {
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		Notice notice = new Notice();
//		notice.setTitle(title);
//		notice.setContent(content);
//		try {
//			noticeService.insertNotice(notice);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "공지사항 등록 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		
//		return "redirect:/main.do?act=notice";
//	}
//	
//	private String writeNoticeForm(HttpServletRequest request, HttpServletResponse response) {
//		return "/views/noticeForm.jsp";
//	}
//
//	private String noticeSort(HttpServletRequest request, HttpServletResponse response) {
//		List<Notice> list;
//		try {
//			list = noticeService.listSortedByViews();
//			request.setAttribute("list", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "공지사항 조회 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "/views/noticeList.jsp";
//	}
//	
//	private String notice(HttpServletRequest request, HttpServletResponse response) {
//		List<Notice> list;
//		try {
//			list = noticeService.list();
//			request.setAttribute("list", list);
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "공지사항 조회 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "/views/noticeList.jsp";
//	}
//
//
//	private String delete(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		Member m = (Member) session.getAttribute("memberinfo");
//		System.out.println(m);
//		memberService.deleteMember(m.getId());
//		session.removeAttribute("memberinfo");
//		return "redirect:/main.do";
//	}
//
//	private String newPwd(HttpServletRequest request, HttpServletResponse response) {
//		String id = request.getParameter("id");
//		String pwd = request.getParameter("pwd");
//		String newPwd = request.getParameter("newpwd2");
//		Member member;
//		try {
//			member = memberService.login(id, pwd);
//			member.setPwd(newPwd);
//			memberService.updateMember(member);
//			request.setAttribute("memberinfo", member);
//		} catch (Exception e) {
//			request.setAttribute("msg", "비밀번호 수정 중 오류가 발생했습니다:(");
//			return "/error/error.jsp";
//		}
//		return "/views/findPwdResult.jsp";
//	}
//
//	private String newPwdForm(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		String id = request.getParameter("id");
//		String name = request.getParameter("name");
//		String phone = request.getParameter("phone");
//		try {
//			String pwd = memberService.findPwd(id,name,phone);
//			if (pwd != null) {
//				session.setAttribute("memberid", id);
//				session.setAttribute("memberpwd", pwd);
//			} else {
//				request.setAttribute("msg", "가입정보가 없거나, 아이디를 잘못 입력하셨습니다:(");
//				return "/error/error.jsp";
//			}
//			return "/views/newPwdForm.jsp";
//		} catch (Exception e) {
//			request.setAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요.");
//			return "/error/error.jsp";
//		}
//	}
//
//	private String findPwdForm(HttpServletRequest request, HttpServletResponse response) {
//		return "/views/findPwdForm.jsp";
//	}
//
//	private String change(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		Member member = incodingMember(request);
//		session.setAttribute("memberinfo", member);
//		return "/views/memberinfo.jsp";
//	}
//
//	private String updateForm(HttpServletRequest request, HttpServletResponse response) {
//		return "/views/updateForm.jsp";
//	}
//
//	private String update(HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		Member member = (Member) session.getAttribute("memberinfo");
//		
//		memberService.updateMember(member);
//		return "redirect:/main.do";
//	}
//
//	private String memberView(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		return "/views/memberinfo.jsp";
//	}
//	
//	private String registerForm(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		return "/views/registerForm.jsp";
//	}
//
//	private String register(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		
//		Member member = incodingMember(request);
//		memberService.signUp(member);
//		
//		return "redirect:/main.do";
//	}
//
//	private Member incodingMember(HttpServletRequest request) {
//		Member member = new Member();
//		member.setId(request.getParameter("id"));
//		member.setPwd(request.getParameter("pwd"));
//		member.setName(request.getParameter("name"));
//		member.setEmail(request.getParameter("email"));
//		member.setPhone(request.getParameter("phone"));
//		return member;
//	}
//
//	private String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		HttpSession session = request.getSession();
//		session.removeAttribute("memberinfo");
//		return "redirect:/main.do";
//	}
//
//	private String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		String id = request.getParameter("id");
//		String pwd = request.getParameter("pwd");
//
//		try {
//			Member member = memberService.login(id, pwd);
//			if (member != null) {
//				HttpSession session = request.getSession();
//				session.setAttribute("memberinfo", member);
//			} else {
//				request.setAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요!");
//			}
//			return "/views/main.jsp";
//		} catch (Exception e) {
//			request.setAttribute("msg", "아이디 또는 비밀번호를 확인해 주세요.");
//			return "/error/error.jsp";
//		}
//	}