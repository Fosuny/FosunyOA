package com.oa.util;

import com.oa.model.OaAuthority;
import com.oa.model.OaRole;

import java.util.ArrayList;
import java.util.List;

public class AuthorityUtil {
	private int code=0;
    private String msg;
    private int count; //总条数
    private List<OaAuthority> data = new ArrayList<OaAuthority>();
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<OaAuthority> getData() {
		return data;
	}
	public void setData(List<OaAuthority> data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "PageUtil{" +
				"code=" + code +
				", msg='" + msg + '\'' +
				", count=" + count +
				", data=" + data +
				'}';
	}
}
