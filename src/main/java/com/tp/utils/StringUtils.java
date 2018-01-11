package com.tp.utils;

public class StringUtils {

	public String[] splitByChar(String src, char schar, int count) {
		String[] res = new String[count];
		char[] csrc = src.toCharArray();
		int nowc = 0;
		int nows = 0;
		boolean isend = false;
		int strlen = src.length();
		for (int i = 0; i < strlen; i++) {
			isend = i == strlen - 1;
			if (csrc[i] == schar || isend) {
				if (isend)
					res[nows++] = src.substring(nowc);
				else
					res[nows++] = src.substring(nowc, i);
				nowc = i + 1;
				if (nows >= count)
					break;
			}
		}
		return res;

	}

}
