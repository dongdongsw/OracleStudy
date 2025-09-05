package com.sist.vo;

import java.util.*;
import lombok.Data;

@Data
public class EmpVO {


		private int empno, sal, comm, deptno, mgr;
		private String ename, job;
		private Date hiredate;
}
