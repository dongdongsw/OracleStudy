package com.sist.main;

import com.sist.dao.StudentDAO;
import com.sist.vo.StudentVO;

public class MainClass {

	public static void main(String[] args) {

		
		StudentVO vo =new StudentVO();
		
		vo.setName("춘향이");
		vo.setKor(90);
		vo.setEng(90);
		vo.setMath(90);
		
		StudentDAO dao = StudentDAO.newInstance();
		dao.stdInsert(vo);
		System.out.println("저장 완료");
		
	}

}
