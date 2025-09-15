package com.sist.client;


import com.sist.commons.ImageChange;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.net.URL;
import java.util.List;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.*;

public class HomeForm extends JPanel implements ActionListener{
	
	ControllerPanel cp;
	JPanel pan = new JPanel();
	JLabel[] imgs = new JLabel[12];
	JLabel pageLa = new JLabel("0 page / 0 pages",JLabel.CENTER);
	JButton b1,b2;
	FoodDAO dao = new FoodDAO();
	
	int curpage = 1;
	int totalpage=0;
	
	JTable table;
	DefaultTableModel model;
	
	public HomeForm(ControllerPanel cp) {
		this.cp = cp;
		setLayout(null);
		pan.setLayout(new GridLayout(3,4,5,5));
		pan.setBounds(30,15,700,500);
		add(pan);
		
		b1 = new JButton("이전");
		b2 = new JButton("다음");
		
		JPanel p = new JPanel();
		p.add(b1); p.add(pageLa); p.add(b2);
		p.setBounds(30,525,700,35);
		add(p);
		
		b1.addActionListener(this);
		b2.addActionListener(this);
		
		String[] col = {"", "업체명","지역"};
		Object[][] row = new Object[0][3];
		model = new DefaultTableModel(row,col){

			//편집 방지
			@Override
			public boolean isCellEditable(int row, int column) {

				return false;
			}

			// 이미지 출력
			@Override
			public Class<?> getColumnClass(int columnIndex) {

				return getValueAt(0, columnIndex).getClass();
			}
			
			
		};
		table = new JTable(model);
		table.getTableHeader().setReorderingAllowed(false);
		table.setRowHeight(35);
		JScrollPane js = new JScrollPane(table);
		for(int i = 0; i<col.length; i++) {
			TableColumn column = table.getColumnModel().getColumn(i);
			if(i==0) {
				column.setPreferredWidth(100);
			}
			else if(i == 1) {
				column.setPreferredWidth(150);
				
			}
			else if(i == 2) {
				column.setPreferredWidth(100);
				
			}
			
		}
		js.setBounds(740,15,230,500);
		add(js);
		print();
	}
	
	public void init() {
		for(int i = 0; i<imgs.length; i++) {
			imgs[i] = new JLabel();
			
		}
		pan.removeAll();
		pan.validate();
	}
	
	public void print() {
		totalpage = dao.foodTotalPage();
		List<FoodVO> list = dao.foodListData(curpage);
		for(int i = 0; i <list.size(); i++) {
			FoodVO vo = list.get(i);
			try {
				URL url = new URL(vo.getPoster());
				Image image = ImageChange.getImage(new ImageIcon(url), 170,180);
				imgs[i] = new JLabel(new ImageIcon(image));
				imgs[i].setToolTipText(vo.getFno()+"."+vo.getName());
				pan.add(imgs[i]);
			} catch (Exception ex) {
				ex.printStackTrace();
			
			
			}
			pageLa.setText(curpage + " page / "+totalpage + " pages");
		}
		
		for(int i = model.getRowCount()-1; i>=0; i--) {
			model.removeRow(i);
		}
		List<FoodVO> tlist = dao.foodTop10();
		for(FoodVO vo : tlist) {
			try {
				URL url = new URL(vo.getPoster());
				Image image = ImageChange.getImage(new ImageIcon(url), 170,180);
				System.out.println(tlist);
				Object[] data = {
						new ImageIcon(image),
						vo.getName(),
						vo.getAddress()
				};
				model.addRow(data);
			}
			catch(Exception ex) {
;				ex.printStackTrace();
			}
		}
	}
	@Override
	public void actionPerformed(ActionEvent e) {

		if(e.getSource() == b1) {
			if(curpage > 1) {
				curpage--;
				init();
				print();
			}
		}
		if(e.getSource() == b2) {
			if(curpage < totalpage) {
				curpage++;
				init();
				print();
			}
		}
		
	}

}
