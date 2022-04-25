package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Env;
import com.ssafy.happyhouse.model.dto.HouseInfoDTO;
import com.ssafy.happyhouse.model.dto.School;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
import com.ssafy.happyhouse.model.dto.Store;
import com.ssafy.happyhouse.model.service.FSelectBoxService;
import com.ssafy.happyhouse.model.service.FSelectBoxServiceImpl;

//@WebServlet("/FSelectBoxController")
@RestController
public class FSelectBoxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	private FSelectBoxService service;

	@GetMapping("/selectSido")
	public JSONArray selectSido(){
		System.out.println("selectSido 호출됨");
		JSONArray arr = new JSONArray();
		try {
		List<SidoCodeDTO> list = service.selectSido();
		for(SidoCodeDTO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("sido_code", dto.getSido_code());
			obj.put("sido_name", dto.getSido_name());
			arr.add(obj);
		}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/selectGugun")
	public JSONArray selectGugun(HttpServletRequest request){
		System.out.println("selectGugun 호출됨");
		JSONArray arr = new JSONArray();
		try {
		List<SidoCodeDTO> list = service.selectGugun(request.getParameter("sido"));
		for(SidoCodeDTO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("gugun_code", dto.getGugun_code());
			obj.put("gugun_name", dto.getGugun_name());
			arr.add(obj);
		}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/selectDong")
	public JSONArray selectDong(HttpServletRequest request){
		System.out.println("selectDong 호출됨");
		JSONArray arr = new JSONArray();
		try {
		List<HouseInfoDTO> list = service.selectDong(request.getParameter("gugun"));
		for(HouseInfoDTO dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("code", dto.getCode());
			obj.put("dong", dto.getDong());
			arr.add(obj);
		}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/selectApt")
	public List<HouseInfoDTO> selectApt(HttpServletRequest request){ // ajax 연동 시 json 형식이 아닌 객체로 넘겨줘도 된다
		System.out.println("selectApt 호출됨");
		try {
			List<HouseInfoDTO> list = service.selectApt(request.getParameter("dong"));
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/selectEnv")
	public List<Env> selectEnv(HttpServletRequest request){
		System.out.println("selectEnv 호출됨");
		try {
			List<Env> list = service.selectEnv(request.getParameter("dong"));
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/selectStore")
	public List<Store> selectStore(HttpServletRequest request){
		System.out.println("selectStore 호출됨");
		try {
			List<Store> list = service.selectStore(request.getParameter("dong"));
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/selectSchool")
	public List<School> selectSchool(HttpServletRequest request){
		System.out.println("selectSchool 호출됨");
		try {
			List<School> list = service.selectSchool(request.getParameter("dong"));
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public void init() throws ServletException {
		super.init();
		service = new FSelectBoxServiceImpl();
	}

	public FSelectBoxController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		if(command.equals("sido")) {
			PrintWriter out = response.getWriter();
			List<SidoCodeDTO> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectSido();
				for(SidoCodeDTO dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("sido_code", dto.getSido_code());
					obj.put("sido_name", dto.getSido_name());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//sido
		else if(command.equals("gugun")) {
			String sido = request.getParameter("sido");
			PrintWriter out = response.getWriter();
			List<SidoCodeDTO> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectGugun(sido);
				for(SidoCodeDTO dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("gugun_code", dto.getGugun_code());
					obj.put("gugun_name", dto.getGugun_name());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//gugun
		else if(command.equals("dong")) {
			String gugun = request.getParameter("gugun");
			PrintWriter out = response.getWriter();
			List<HouseInfoDTO> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectDong(gugun);
				for(HouseInfoDTO dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("code", dto.getCode());
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//dong
		else if(command.equals("apt")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<HouseInfoDTO> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectApt(dong);
				for(HouseInfoDTO dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("dong", dto.getDong());
					obj.put("AptName", dto.getAptName());
					obj.put("code", dto.getCode());
					obj.put("jibun", dto.getJibun());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//dong
	}//process

}
