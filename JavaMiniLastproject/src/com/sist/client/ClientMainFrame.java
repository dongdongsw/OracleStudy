package com.sist.client;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class ClientMainFrame extends JFrame implements ActionListener{
	
	MenuForm menu = new MenuForm();
	//has - a => 포함 클래스
	ControllerPanel cp = new ControllerPanel();
	Login login = new Login();
	Join join = new Join();
	
	public ClientMainFrame() {
//		add("North",menu); 	// 자동으로 상단에 배치하겠다는 뜻
		setLayout(null); 	// 직접 배치하겠다는 뜻
		menu.setBounds(110, 15, 1000, 50);
		cp.setBounds(10, 70, 1255, 690);
		add(menu);
		add(cp);
		setSize(1280, 800);
//		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		menu.b1.addActionListener(this);
		menu.b5.addActionListener(this);
		menu.b6.addActionListener(this);
		
		login.b1.addActionListener(this);	//로그인
		login.b2.addActionListener(this);	//회원가입
		login.b3.addActionListener(this);	//취소
		
		join.b1.addActionListener(this);	//회원가입
		join.b2.addActionListener(this); 	// 취소

	}
	
	public static void main(String[] args) {
		
		try {
			UIManager.setLookAndFeel("com.jtattoo.plaf.hifi.HiFiLookAndFeel");
		}catch(Exception e) {}
		new ClientMainFrame(); //생성자 호출
			//ㄴ ClientMainFrame c = new ClientMainFrame(); 무조건 이렇게 하는게 아님
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==menu.b1) {
			
			cp.card.show(cp, "HF");
		}
		else if(e.getSource()==menu.b5){
			
			cp.card.show(cp, "CF");

		}
		else if(e.getSource()==menu.b6){
			
			cp.card.show(cp, "BF");

		}
		else if(e.getSource()==login.b2){
			
			login.setVisible(false);
			join.setVisible(true);
		}
		else if(e.getSource()==login.b3){
			
			dispose();
			System.exit(0);

		}
		else if(e.getSource()==join.b1){

		}
		else if(e.getSource()==join.b2){
			
			login.setVisible(true);
			join.setVisible(false);
		}	
		
		
		
				
	}

}
