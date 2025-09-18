package com.sist.client;

import javax.swing.*;
import java.awt.*;

public class ControllerPanel extends JPanel{

	HomeForm hf;
	
	ChatForm cf = new ChatForm();
	BoardList bf = new BoardList();
	FoodFind ff;
	FoodDetail fd;
	CardLayout card = new CardLayout();
	GenieMusic gm;
	public ControllerPanel() {
		
		hf = new HomeForm(this);
		ff = new FoodFind(this);
		fd = new FoodDetail(this);
		gm = new GenieMusic(this);
		
		setLayout(card);
		

		add("HF",hf);
		add("FD",fd);
		add("CF",cf);
		add("BF",bf);
		add("FF",ff);
		add("GM", gm);

	}
}
