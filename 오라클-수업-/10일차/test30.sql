-- 3Àå ~ 4Àå => Çü½Ä / ¼ø¼­

/*
	PL/SQL/Á¤±Ô½Ä (REGEXP_LIKE, REGEXP_COUNT, REGEXP_REPALCE,
		REGEXP_STRSUB, REGEXP_INSTR)
	=> ±×·ì ÇÔ¼ö : GROUPING /  CUBE / ROLLUP
	=> µ¥ÀÌÅÍº£ÀÌ½º ¼³°è (Á¤±ÔÈ­) / Æ®·£Àè¼Ç »ç¿ë¹ý
	
	1. 3Àå
		=> SELECT => µ¥ÀÌÅÍ °Ë»ö => ÇÁ·ÎÁ§Æ®(80%)
		Çü½Ä,¼ø¼­)
		-----------------------------------------------------
		SELECT (DISTINCT|*) *| column_list(¿¬»êÀÚ(»ê¼ú),ÇÔ¼ö)
		FROM table_name | view_name | SELECT ~ 
		-----------------------------------------------------
		[
			WHERE Á¶°Ç¹®(ºñ±³ ¿¬»êÀÚ, ³í¸® ¿¬»êÀÚ, BETWEEN ~ AND
						IN, LIKE, NOT, NULL(IS NULL, IS NOT NULL)
			GROUP BY ±×·ì ÄÃ·³ | ÇÔ¼ö => ±×·ìº° Áý°è
					------------------ ÄÃ·³ °°ÀÌ µ¿ÀÏ
			HAVING ±×·ì Á¶°Ç => GROUP BY°¡ ÀÖ´Â °æ¿ì¿¡¸¸ »ç¿ëÀÌ °¡´É
			
			ORDER BY Á¤·ÄÇÑ ÄÃ·³ | ÇÔ¼ö (ASC | DESC)
										--- »ý·« °¡´É
			=> µ¥ÀÌÅÍ°¡ ¸¹Àº °æ¿ì´Â Á¤·Ä½Ã¿¡ INDEX
				INDEX_ASC(), INDEX_DESC()
		]
		1) ¿¬»êÀÚ(ROW ´ÜÀ§) => ÇÑÁÙ¾¿ µû·Î °è»ê
		
			»ê¼ú¿¬»êÀÚ : +, -, *, / => MOD() : %
				¤¤ ROW´ÜÀ§ Åë°è => Á¦°øÇÏ´Â ÇÔ¼ö°¡ ¾ø´Ù
				
			ºñ±³ ¿¬»êÀÚ : =, <>, <, >, <=, >=
			
			³í¸® ¿¬»êÀÚ : AND(¹üÀ§, ±â°£ Æ÷ÇÔ), OR(¹üÀ§, ±â°£À» ¹þ¾î³­ °æ¿ì)
											   | ´ÙÁß °Ë»ö
											   
			BETWEEN ~ AND : AND ´ë½Å »ç¿ë => °ªÀÌ Æ÷ÇÔ
				=> ÆäÀÌÂ¡ ±â¹ý, Ã¼Å©ÀÎ, ¿¹¾à ±â°£...
				
			IN : OR ¿©·¯°³ÀÎ °æ¿ì => MyBatis =>forEach
				=> µ¿Àû Äõ¸®
			
			NOT : ºÎÁ¤ => NOT IN, NOT LIKE, NOT BETWEEN
				=> !´Â »ç¿ëÇÏÁö ¾Ê´Â´Ù
				
			NULL : °ªÀÌ ¾ø´Â »óÅÂ
				=> NullPointerException : ¿À·ù ¹ß»ý
				=> null·Î ¿¬»êÃ³¸® => °á°ú °ª(null)
				=> IS NULL, IS NOT NULL
				WHERE ename = null => NULL
				WHERE ename IS NULL => (o)
				=> image°¡ ¾ø´Â °æ¿ì
			
			LIKE : % => ¹®ÀÚ Á¦ÇÑÀÌ ¾øÀ½
					_ => ¹®ÀÚ ÇÑ±ÛÀÚ
					startsWith : ¹®ÀÚ%  ===============> 	^¹®ÀÚ
					endsWith : %¹®ÀÚ		===============>	¹®ÀÚ$
					contains : %¹®ÀÚ%	===============>	¹®ÀÚ
						Á¤±Ô½Ä
							¹üÀ§ : [°¡-ÆR], [A-Za-z], [0-9]
					=> REGEXP_LIKE(ÄÃ·³, Á¤±Ô½Ä)
					
		2) ³»Àå ÇÔ¼ö
			= ´ÜÀÏÇà ÇÔ¼ö : ROW´ÜÀ§ Ã³¸®(ÇÑÁÙ¾¿Ã³¸®)
				¹®ÀÚ ÇÔ¼ö
					SUBSTR => ¹®ÀÚ ÀÚ¸£±â
								SUBSTR(ÄÃ·³¸í, ½ÃÀÛ À§Ä¡, ¸î±ÛÀÚ)
											  --------- 1¹øºÎÅÍ
					
					INSTR => ¹®ÀÚÀÇ À§Ä¡
							INSTR(ÄÃ·³¸í, Ã£´Â ¹®ÀÚ, ½ÃÀÛ À§Ä¡, ¸î¹øÂ°)
					
					LENGTH => ¹®ÀÚÀÇ °¹¼ö
							LENGTH(ÄÃ·³¸í) : ºñ¹Ð¹øÈ£
					
					RPAD => ±ÛÀÚ °¹¼ö°¡ ¸ðÀÚ¶ó´Â °æ¿ì(ÁöÁ¤µÈ ¹®ÀÚ Ãâ·Â)
							ad****
							RPAD(ÄÃ·³¸í,¹®ÀÚ °¹¼ö)
										LENGTH
							=> ¾ÆÀÌµð Ã£±â / ´ñ±Û
					REPLACE => ¹®ÀÚ º¯°æ => &, |, "
							=> À¥¿¡¼­ Ã¤ÆÃ(Ã¤ÆÃ¹®ÀÚ ÀúÀå)
							=> URL => &´Â ¿äÃ»°ª ±¸ºÐ
							=> http://localhost/food_detail.jsp?fno=1&page=3
																------------
															GET / POST / PUT / DELETE
															RESTFul
												GET  : SELECT
												POST : INSERT
												PUT : UPDATE
												DELETE : DELETE
												-----------------
							REPLACE(ÄÃ·³¸çÀ¸ º¯°æ´ë»ó¹®ÀÚ, º¯°æÇÒ ¹®ÀÚ)
										
						=> ³ª¸ÓÁö ÇÔ¼ö : TRIM(), INITCAP, UPPER, LOWER
							=> ÀÚ¹ÙÀÇ StringÀ»·Î Ã³¸®
							
				¼ýÀÚ ÇÔ¼ö
					=> 	MOD : ³ª¸ÓÁö => %
						MOD(¼ýÀÚ1, ¼ýÀÚ2) => ¼ýÀÚ1%¼ýÀÚ2
					=> ROUND : ¹Ý¿Ã¸² = Æò±Õ
					=> CEIL : ¿Ã¸² = ÃÑÆäÀÌÁö ±¸ÇÏ±â
						TRUNC ¹ö¸²
						TRUNC(123.567,2) => .56
				
				³¯Â¥ ÇÔ¼ö
					=> SYSDATE : ½Ã½ºÅÛ ½Ã°£, ³¯Â¥
							»ê¼ú ¿¬»êÀÚ¸¦ ÀÌ¿ëÇØ¼­ Àü³¯...
				
					=> MONTHS_BETWEEN : ±â°£ÀÇ °³¿ù¼ö
						MONTHS_BETWEEN(ÇöÀç³¯Â¥, ÀÌÀü ³¯Â¥)
				
				±âÅ¸ ÇÔ¼ö
					=> 	NVL : NULLÀÏ °æ¿ì ´Ù¸¥ °ªÀ¸·Î º¯°æ
						NVL(ÄÃ·³, ´ëÃ¼°ª)
							  |		|
							  ------- µ¥ÀÌÅÍÇüÀÌ µ¿ÀÏ
						NVL(ename,0) => ¿À·ù
						NVL(address,'') => "(NULL),' '(Space)
						
				º¯È¯ ÇÔ¼ö => ³¯Â¥, ¼ýÀÚ => ¹®ÀÚ¿­ º¯È¯
					TO_CHAR(¼ýÀÚ, 'ÆÐÅÏ')
						TO_CHAR(1234567, '99,999,999') 1,234,567
					TO_CHAR(³¯Â¥, 'ÆÐÅÏ')
							YYYY / RRRR = ³âµµ
							MM => ¿ù
							DD => ÀÏ
							HH / HH24 => ½Ã°£
							MI => ºÐ
							SS => ÃÊ
							DY => ¿äÀÏ
						=> ³¯Â¥ + ½Ã°£ = °øÁö»çÇ× / ´ñ±Û
						=> ³¯Â¥ (ÀÚ¹Ù)
						=> ½Ã°£ (ÀÚ¹Ù¿¡¼­ Ã³¸®°¡ ¾î·Æ´Ù) => 12:00
						
			= Áý°è ÇÔ¼ö : COLUMN´ÜÀ§ Ã³¸®
				COUNT : rowÀÇ °¹¼ö
					=> ·Î±×ÀÎ / ¾ÆÀÌµð Ã¼Å© / ÀüÈ­¹øÈ£ Ã¼Å©
						COUNT(*) / COUNT(ÄÃ·³)
						--------	----------NULL°ª Á¦¿Ü
						null°ª Æ÷ÇÔ
				MAX / MIN
				---- ÀÚµ¿ Áõ°¡ ¹øÈ£ ÀÌ¿ë => SEQUENCE 
				
				SUM / AVG
				---- ÃÑÇÕ/ Æò±Õ
				=> GROUPING / CUBE / ROLLUP
				
			GROUP BY°¡ ¾ø´Â °æ¿ì => 
				´ÜÀÏÇà, Áý°èÇÔ¼ö´Â °°ÀÌ »ç¿ëÇÒ ¼ö ¾ø´Ù
		
		3) Á¶ÀÎ / ¼­ºêÄõ¸® => ÇÁ·ÎÁ§Æ®(¹Ýµå½Ã SQLDeveloper)
			ÀÚ¹Ù => "" (LIKE ¹®Àå¸¸ º¯°æ) '%A%'
				=> ¿À¶óÅ¬ : '%'||?||'%'
				=> MYSQL : CONCAT('%',?,'%') => MariaDB
		
			Å×ÀÌºíÀÌ 2°³ ÀÌ»ó¿¡¼­ µ¥ÀÌÅÍ ÃßÃâ
				= INNER JOIN (±³ÁýÇÕ)
					= EQUI_JOIN (=)
					= NON_EQUI_JOIN (= ¿Ü¿¡ ´Ù¸¥ ¿¬»êÀÚ : ³í¸® ¿¬»êÀÚ, BETWEEN)
					Çü½Ä)
						¿À¶óÅ¬ Á¶ÀÎ
							SELECT A.col, B.col
							FROM A, B
							WHERE A.col = B.col
							
						Ç¥ÁØ Á¶ÀÎ(ASHI JOIN) => MySQL MSSQL
							SELECT A.col, B.col
							FROM A JOIN B
							WHERE A.col = B.col
					=======> SELECT A.col
							 FROM A
							 INTERSECT    
							 SLEECT B.col
							 FROM B
							
				= OUTER JOIN (±³ÁýÇÕ ¿Ü ´Ù¸¥ µ¥ÀÌÅÍ)
					= LEFT OUTER JOIN
						¿À¶óÅ¬ Á¶ÀÎ
							SELECT A.col, B.col
							FROM A, B
							WHERE A.col = B.col(+)
							
						Ç¥ÁØ Á¶ÀÎ(ASHI JOIN) => MySQL MSSQL
							SELECT A.col, B.col
							FROM A LEFT OUTER JOIN B
							WHERE A.col = B.col
					=======> A INTERSECT  B AND A MINUS B	
							
							
					= RIGHT OUTER JOIN
						¿À¶óÅ¬ Á¶ÀÎ
							SELECT A.col, B.col
							FROM A, B
							WHERE A.col(+) = B.col
							
						Ç¥ÁØ Á¶ÀÎ(ASHI JOIN) => MySQL MSSQL
							SELECT A.col, B.col
							FROM A RIGHT OUTER JOIN B
							WHERE A.col = B.col	
					=======> A INTERSECT  B AND B MINUS A
				UNION / UNION ALL / INTERSECT / MINUS
				ÁýÇÕ ¿¬»êÀÚ
				A 1,2,3,4,5
				B 4,5,6,7,8
				A UNION B 		==> 1,2,3,4,5,6,7,8
				A UNION ALL B 	==> 1,2,3,4,5,4,5,6,7,8
				A INTERSECT B 	==> 4,5
				A MINUS B 		==> 1,2,3
				B MINUS A		==> 6,7,8
							
			SQL ¹®Àå 2°³ ÀÌ»ó ÅëÇÕÇÏ´Â °úÁ¤ : ¼­ºê Äõ¸®
				¼­ºê Äõ¸®
					= ´ÜÀÏÇà ¼­ºê Äõ¸® (ÄÃ·³ 1°³, °á°ú °ª 1°³)
						¤¤ ÁÖ·Î »ç¿ëÇÏ´Â ¿¬»êÀÚ : ºñ±³ ¿¬»êÀÚ
							SELECT * 
							FROM table_name
							WHERE ÄÃ·³ ¿¬»êÀÚ(SELECT ~) 
											------- °á°ú °ª 1°³ , Å×ÀÌºí ´Ù¸¥ °æ¿ìµµ ÀÖ´Ù
										|
									ºñ±³ ¿¬»êÀÚ
									
					= ´ÙÁßÇà ¼­ºê Äõ¸® (ÄÃ·³ 1°³ , °á°ú °ª ¿©·¯°³
						¤¤ IN : ÀüÃ¼ ´ëÀÓ
						
						¤¤ ANY / ALL => MAX,MIN
							SELECT * 
							FROM table_name
							WHERE ÄÃ·³ ¿¬»êÀÚ(SELECT ~) 
											------- °á°ú °ª ¿©·¯ÁÙ
											| IN => °á°ú °ª ÀüÃ¼ ´ëÀÔ
											| ANY(SOME)
												> ANY(10,20,30) => MIN(10)
												< ANY(10,20,30) => MAX(30)
											| ALL	
												> ALL(10,20,30) => MAX(30)
												< ALL(10,20,30) => MIN(10)
												
					= ´ÙÁß ÄÃ·³ ¼­ºê Äõ¸® (ÄÃ·³ ¿©·¯°³, °á°ú °ª 1°³)
						ÁýÇÕ ¿¬»ê »ç¿ë½Ã ÁÖ·Î »ç¿ë (»ç¿ëºóµµ°¡ °ÅÀÇ ¾ø´Ù)
				----------------------------WHERE 
				½ºÄ®¶ó ¼­ºê Äõ¸® : ÄÃ·³ ´ë½Å »ç¿ë
								---------- ¹Ýµå½Ã °á°ú °ªÀº 1°³ 
					SELECT ÄÃ·³,(SELECT ~)
								--------- °á°ú °ªÀÌ 1°³, ´Ù¸¥ Å×ÀÌºí¿¡¼­ ÃßÃâ
					FROM table_name
						=> Á¶ÀÎ ´ë½Å »ç¿ë / ¹®ÀåÀÌ ¸¹ÀÌ ±ä °æ¿ì
						
						=> ÀÌ¹Ì SQL¹®ÀåÀÌ Á¦ÀÛÀÌ µÈ °æ¿ì 
							= ´Ù¸¥ Å×ÀÌºí¿¡¼­ Ãß°¡ÀûÀ¸·Î µ¥ÀÌÅÍ ÃßÃâ
							= À¯Áöº¸¼ö
							
						=> FUNCTIONÀ» ¸¸µé¾î¼­ Ã³¸®ÇÒ °æ¿ìµµ ÀÖ´Ù
						
				ÀÎ¶óÀÎºä : Å×ÀÌºí ´ë½Å »ç¿ë (º¸¾È)
					SELECT *
					FROM (SELECT ~)
						=> TOP-N : 1¹øºÎÅÍ
				
		4Àå 
			=> CREATE / DROP / TRUNCATE / RENAME / ALTER
			=> DML(INSERT, UPDATE, DELETE)
		
			DML : µ¥ÀÌÅÍ Á¶ÀÛ => À¥ °³¹ßÀÚ => CRUD
				1) µ¥ÀÌÅÍ ÀúÀå : INSERT
					= ÀüÃ¼ µ¥ÀÌÅÍ ÀúÀå
						INSERT INTO table_name VALUES(°ª, °ª...)
													---------------
													¸ðµç ÄÃ·³ °ª ¼³Á¤
													¼ø¼­
													¹®ÀÚ => "
													³¯Â¥ => ¿À´Ã ³¯Â¥°¡ ¾Æ´Ñ °æ¿ì
														'YY/MM/DD'
														SYSDATE
														
						ps.setString(1,vo.getName()) => ÀÚµ¿À¸·Î 'È«±æµ¿'
						¿À¶óÅ¬¿¡¼­´Â ÀúÀå : COMMIT 
						ÀÚ¹Ù¿¡¼­´Â ÀÚµ¿À¸·Î COMMITÀÌ µÈ´Ù (autocommit())
						=>  INSERT / INSERT / INSERT / INSERT / INSERT ...
						
						=>  conn.setAutoCommit(false)
							INSERT / INSERT / INSERT / INSERT / INSERT
							conn.commit()
							
					=  ¿øÇÏ´Â µ¥ÀÌÅÍ¸¸ ÀúÀå = NULL°ª Çã¿ë, DEFAULT ¼³Á¤
							INSERT INTO table_name(ÄÃ·³, ÄÃ·³,ÄÃ·³ ...)
							VALUES(°ª, °ª, °ª...)
		
				2) µ¥ÀÌÅÍ ¼öÁ¤ : UPDATE
					UPDATE table_name
					SET ÄÃ·³ = °ª, ÄÃ·³ = °ª....
						ÄÃ·³ - SYSDATE
					[WHERE Á¶°Ç] => ¾ø´Â °æ¿ì¿¡´Â ÀüÃ¼ º¯°æ
				3) µ¥ÀÌÅÍ »èÁ¦ : DELETE
					DELETE FROM table_name
					[WHERE Á¶°Ç] 
				------------------------------------------
				COMMIT ¼öÇà => ROLLBACKÀÌ ¾ÈµÈ´Ù
			---------------------------------------------------
			DDL : Á¤ÀÇ ¾ð¾î
				TABLE : ÀúÀå °ø°£
				VIEW : °¡»óÅ×ÀÌºí
				SEQUENCE : ÀÚµ¿ Áõ°¡ ¹øÈ£
				SYNONYM : Å×ÀÌºí º°Äª
				FUNCTION / PROCEDURE / TRIGGER
				-------------------------------- ¿À¶óÅ¬ : OBJECT
				TABLE
					1. µ¥ÀÌÅÍÇü
						=> ¹®ÀÚ => ÇÑ±Û (ÇÑ±ÛÀÚ´ç 3byte)
							CHAR(1~2000byte) : °íÁ¤ ¹ÙÀÌÆ® (±ÛÀÚ¼ö°¡ °°À» °æ¿ì)
							VARCHAR(1~4000byte) : °¡º¯ ¹ÙÀÌÆ®(±ÛÀÚ¼ö¿¡ µû¶ó ¸Þ¸ð¸®°¡ ´Þ¶óÁø´Ù)
							CLOB : 4±â°¡(°¡º¯)
						=> ¼ýÀÚ => NUMBER : Á¤¼ö/ ½Ç¼ö NUMBER(8,2)
									 NUMBER(2,1)
						=> ³¯Â¥ => DATE, TIMESTAMP
								  ----- ±âº»
								  
					2. Á¤ÇüÈ­µÈ µ¥ÀÌÅÍ => vlfdygks epdlxjaks cjaqn
						=> NOSQL (¸ù°í µðºñ, ElasticSearch)
						=> Á¦¾à Á¶°Ç
							= ÀÌ»óÇö»ó ¹æÁö(¼öÁ¤, »èÁ¦)
								= Áßº¹ÀÌ ¾ø´Â µ¥ÀÌÅÍ ÀúÀå = ±âº»Å° (±¸ºÐÀÚ)
									: ¹«°á¼º => PRIMARY KEY
								= ¿ÜºÎ µ¥ÀÌÅÍ ÂüÁ¶ = ¿Ü·¡Å°, ÂüÁ¶Å°
									: ÂüÁ¶ ¹«°á¼º => FOREGIN KEY
								= NOT NULL  : °ªÀÌ ¹Ýµå½Ã Á¸Àç
								= UNIQUE : Áßº¹ÀÌ ¾ø´Â °ª(NULL Çã¿ë)
									=> PRIMARY KEY ´ëÃ¼°ª
								= CHECK : ÁöÁ¤µÈ °ª¸¸ ÀúÀå
								= PRIMARY KEY : NOT NULL + UNIQUE
									=> Å×ÀÌºí¿¡ ¹Ýµå½Ã ÇÑ°³ ÀÌ»óÀ» ¼³Á¤ = ±âº»Å°
							
								=FOREIGN KEY : ´Ù¸¥ Å×ÀÌºíÀÇ µ¥ÀÌÅÍ ÂüÁ¶
						Å×ÀÌºí			
							1) µ¥ÀÌÅÍ ÃßÃâ
							2) µ¥ÀÌÅÍÇü ¼³Á¤
							3) Á¦¾àÁ¶°Ç
						-------------------------
						Çü½Ä)
							Å×ÀÌºí¸í
								1) ÇÑ±Û / ¾ËÆÄºª => ´ë¼Ò¹®ÀÚ ±¸ºÐÀÌ ¾ø´Ù
									½ÇÁ¦·Î ¿À¶óÅ¬¿¡ ÀúÀå(´ë¹®ÀÚ·Î ÀúÀå)
									user_tables : PRIMARY KEY(Áßº¹ÀÌ µÇ¸é ¾ÈµÈ´Ù)
								2) ±ÛÀÚ¼ö´Â 30±ÛÀÚ(byte) (10±ÛÀÚ)
								3) Å°¿öµå´Â »ç¿ë ±ÝÁö (SELECT, INSERT ...)
								4) ¼ýÀÚ »ç¿ëÀÌ °¡´É(´Ü µÚ¿¡ »ç¿ë)
								5) Æ¯¼ö¹®ÀÚ (_) => 5~10ÀÚ
								
								CREATE TABLE table_name(
									ÄÃ·³¸í µ¥ÀÌÅÍÇü [Á¦¾àÁ¶°Ç]
													--------- ¿©·¯°³ Àû¿ëÀÌ °¡´É
													------ DEFAULT / NOT NULL
															-------	---------
															   1		2
									ÄÃ·³¸í µ¥ÀÌÅÍÇü [Á¦¾àÁ¶°Ç]
									ÄÃ·³¸í µ¥ÀÌÅÍÇü [Á¦¾àÁ¶°Ç]
									[Á¦¾àÁ¶°Ç],
									[Á¦¾àÁ¶°Ç]
								);
								Á¦¾àÁ¶°ÇÀº ¾à½Ä / Á¤½Ä
								CREATE TABLE table_name(
									id VARCHAR2(20) PRIMARY KEY,
									name VARCHAR2(50) NOT NULL
									...
								);
								
								=> Á¦¾àÁ¶°ÇÀ» Á¦¾îÇÏ±â ¾î·Æ´Ù
								
								=> Á¦¾àÁ¶°ÇÀÇ ÀÌ¸§ ºÎ¿©
									ÇÑ°³ÀÇ Å×ÀÌºí¿¡ ÀúÀå
									---------------user_constraints : Áßº¹ ¾øÀÌ ¼³Á¤
									table¸í_ÄÃ·³_nn, _pk...
								=> 	CONSTRAINT table¸í_ÄÃ·³_nn NOT NULL
									CONSTRAINT table¸í_ÄÃ·³_pk PRIMARY KEY(ÄÃ·³)
									CONSTRAINT table¸í_ÄÃ·³_ck CHECK(ÄÃ·³ IN(","))
									CONSTRAINT table¸í_ÄÃ·³_uk UNIQUE(ÄÃ·³)
									CONSTRAINT table¸í_ÄÃ·³_fk FOREIGN KEY(ÄÃ·³)
									REPERENCES ÂüÁ¶ Å×ÀÌºí (ÄÃ·³)
									
								=> FOREIGN KEY
									¸ÕÀú ÂüÁ¶ Å×ÀÌºí »ý¼º => ³ªÁß¿¡ ÂüÁ¶ ÇÏ°í ÀÖ´Â Å×ÀÌºí 
									»èÁ¦½Ã¿¡´Â ¹Ý´ë·Î
						--------------------------------------------------------------
						= Á¦¾î : ALTER = º¯°æ
							= ÄÃ·³Ãß°¡
							ALTER TABLE talbe_name ADD likecount NUMBER DEFAULT 0
												ÄÃ·³¸í µ¥ÀÌÅÍÇü [Á¦¾ßÁ¶°Ç|DEFAULT]
							
							= ÄÃ·³ »èÁ¦
								ALTER TABLE table_name DROP COULMN ÄÃ·³¸í
							= ÄÃ·³ ¼öÁ¤
								ALTER TABLE table_name MODIFY ÄÃ·³¸í µ¥ÀÌÅÍÇü
																	--------
							= ÄÃ·³¸í º¯°æ
								ALTER TABLE table_name 
								RENAME COULMN old_name TO new_name
							= ALTER ÁÖ·Î µ¥ÀÌÅÍ°¡ ÀÔ·ÂÀÌ ÀÖ´Â °æ¿ì¿¡ ÁÖ·Î »ç¿ë
							= À¯Áö º¸¼ö	
							
						= Å×ÀÌºí »èÁ¦
							DROP TABLE table_name : ¿ÏÀü »èÁ¦
						= µ¥ÀÌÅÍ¸¸ »èÁ¦
							TRUNCATE TABLE table_name : Å×ÀÌºíÀº À¯Áö, µ¥ÀÌÅÍ¸¸ »èÁ¦
						= RENAME 
							RENAME  old_name TO new_name
					---------------------------------------------------------------
					3) 	SEQUENCE : ÀÚµ¿ Áõ°¡ ¹øÈ£
						CREATE SEQUENCE table¸í_ÄÃ·³¸í_seq
							START WITH => ½ÃÀÛ ¹øÈ£
							INCREMENT  BY => Áõ°¡
							NOCACHE	=> ¹Ì¸®ÀúÀåÇÏ´Â °ÍÀÌ ¾øÀÌ »ç¿ë
							NOCYCLE => ¸¶Áö¸·ÀÌ¸é ´Ù½Ã Ã³À½ºÎÅÍ ½ÃÀÛÇÒ °ÍÀÎÁö
						ÃÊ±âÈ­ => DROPÈÄ »ç¿ë
						»èÁ¦ : DROP SEQUENCE seq¸í
						
					4) VIEW : 	º¸¾ÈÀÌ ÇÊ¿ä, SQL ¹®ÀåÀÌ ±ä°æ¿ì
								Àç»ç¿ë
								= ±âÁ¸ÀÇ Å×ÀÌºíÀ» ÂüÁ¶ÇØ¼­ ¸¸µç °¡»ó Å×ÀÌºí
						1. Á¾·ù
							´Ü¼øºä : Å×ÀÌºí ÇÑ°³ ÂüÁ¶
								DMLÀÌ °¡´É
								------------- ºä¸¸ º¯°æµÇ´Â °ÍÀÌ ¾Æ´Ï¶ó
												ÂüÁ¶ÇÏ´Â Å×ÀÌºí º¯°æ
								=> Å×ÀÌºí ¿©·¯°³ ÂüÁ¶(JOIN, SUBQUERY)
								
							º¹ÇÕºä : Å×ÀÌºí ¿©·¯°³ ÂüÁ¶(JOIN, SUBQUERY)
								=> SQL ¹®ÀåÀ» ´Ü¼øÈ­ => ÀúÀåÈÄ¿¡ Àç»ç¿ë
								
							ÀÎ¶óÀÎºä : Å×ÀÌºí ´ë½Å SELECT »ç¿ë
								=> user_view¿¡ ÀúÀå : SQL¹®Àå¸¸ ÀúÀåµÈ´Ù
						2. Çü½Ä
							CREATE VIEW view_name
							AS
								SELECT ~~ (ÀúÀåÇÒ ¹®Àå)
								-------------JOIN / SUBQUERY / GROUP BY...
						3. ¼öÁ¤
							CREATE OR REPLACE VIEW view_name
							AS	
								SELECT~
						4. »èÁ¦
							DROP VIEW view_name
							
						5. ¸¹Àº VIEW¸¦ »ý¼ºÇÏ¸é ºñ¿ëÀÌ ¸¹ÀÌ µé¾î°£´Ù
						
					5)INDEX : °Ë»ö°ú °ü·Ã (ÃÖÀûÈ­)
						Çü½Ä)
							CREATE INDEX index¸í ON table¸í(ÄÃ·³¸í (ASC | DESC))
							CREATE INDEX index¸í ON table¸í(ÄÃ·³¸í,ÄÃ·³¸í)
							=> °Ë»ö / Á¤·Ä
								INDEX_ASC() / INDEX_DESC()
							ÀÚÁÖ »ç¿ëÇÏ´Â °Ë»ö¾î°¡ ÀÖ´Â °æ¿ì
								=> µ¥ÀÌÅÍ ÀûÀº °æ¿ì¿¡´Â »ç¿ëÇÏÁö ¾Ê´Â´Ù
								=> µ¥ÀÌÅÍ°¡ ¸¹Àº °æ¿ì
							JOIN¿¡¼­ »ç¿ëÇÏ´Â ÄÃ·³ÀÌ ÀÖ´Â °æ¿ì
							NULL°ªÀÌ ¸¹ÀÌ Æ÷ÇÔÇÏ´Â ÄÃ·³À» ÀÌ¿ë
							INSERT / UPDATE / DELETE°¡ ¸¹Àº °æ¿ì¿¡´Â ¼Óµµ ÀúÇÏ
								=> REBUILD¸¦ »ç¿ëÇØ¼­ Ã³¸®
								
						»èÁ¦) 
								DROP INDEX index¸í
						rownum(222page)
							=> ¿À¶óÅ¬ Áö¿øÇÏ´Â °¡»ó ÄÃ·³(SQL¹®Àå¿¡¼­¸¸ »ç¿ë)
							=> row¸¶´Ù ¹øÈ£¸¦ ÀÔ·Â
							=> ¹øÈ£°¡ Áßº¹ÀÌ ¾ø´Ù
							=> SQL¹®ÀåÀ¸·Î ROWNUMÀÇ °ªÀ» º¯°æ = ÀÎ¶óÀÎºä
							=> ¸î°³ / ÆäÀÌÁö »ç¿ë
							=> top-N : À§¿¡¼­ºÎÅÍ ¸î°³
								----- ÁßÃ¸ ¼­ºê·ïÅ°
							
							
					
							
							
*/
/*
select * from menupan_food
ORDER BY fno ASC;
*/

-- select /*+ INDEX_ASC(menupan_food mf_fno_pk)*/ * from menupan_food;
-- REGEXP_LIKE => LIKE ´ë½Å
-- ÀÌ¸§Áß¿¡ 'ÇÑ'ÀÚ¸¦ Æ÷ÇÔÇÏ´Â ¾÷Ã¼¸í Ãâ·Â
/*
SELECT name
FROM menupan_food
WHERE name LIKE '%ÇÑ%';
*/
/*
SELECT name
FROM menupan_food
WHERE REGEXP_LIKE(name, 'ÇÑ');
*/
/*
SELECT name
FROM menupan_food
WHERE name LIKE 'ÇÑ%';
*/
/*
SELECT name
FROM menupan_food
WHERE REGEXP_LIKE(name, '^ÇÑ');
*/
/*
SELECT name
FROM menupan_food
WHERE name LIKE '%Á¡ ';

SELECT name
FROM menupan_food
WHERE REGEXP_LIKE(name, 'Á¡ $');
*/








