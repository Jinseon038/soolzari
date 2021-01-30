package com.soolzari.shop.common;

import java.io.File;

public class FileNameOverlap {
	public String rename(String path, String filename) {
		// aclass.txt -> aclass(1).txt
		// 파일명 시작부터 마지막 . 바로 앞까지
		String fileFrontName = filename.substring(0,filename.lastIndexOf('.'));
		// 마지막 . 부터 끝까지
		String fileExtention = filename.substring(filename.lastIndexOf('.'));
		StringBuilder sb = new StringBuilder();
		int num = 0; //파일명 중복 시 붙일 숫자
		while(true) {
			sb.append(fileFrontName);
			if(num != 0) {
				sb.append("("+num+")");
			}
			sb.append(fileExtention);
			File checkFile = new File(path+sb.toString());
			if(!checkFile.exists()) {
				break;
			}
			num++;
		}
		return sb.toString();
	}
}
