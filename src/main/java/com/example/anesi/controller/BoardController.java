package com.example.anesi.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.anesi.model.Board;
import com.example.anesi.service.BoardService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@Autowired 
	HttpSession session;
	
	// 커뮤니티 메인
	@RequestMapping("/community/main.do") 
    public String boardmain(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/community";
    }
	
	// 게시글 보기
	@RequestMapping("/community/view.do") 
    public String boardview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/community_view";
    }
	
	// 게시글 리스트
	@RequestMapping(value = "/community/boardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardService.boardAll(map); 
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	// 인기글 리스트
	@RequestMapping(value = "/community/bestBoardList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String bestBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> bList = boardService.boardBest(map);
		resultMap.put("bList", bList);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/community/boardView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Board info = boardService.selectBoardView(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
}