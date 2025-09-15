package com.sist.main;

public class MainClass {

	public static void main(String[] args) {

		try {
			try {
				for(int i = 0; i<=10; i++) {
					int r = (int)(Math.random()*3);
					System.out.println(i/r);
				}
			}catch(Exception ex) {}
			
		}
		catch(Exception ex) {}
		
	}

}
