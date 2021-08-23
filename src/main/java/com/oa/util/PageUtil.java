package com.oa.util;

import java.util.ArrayList;
import java.util.List;

import com.oa.model.OaRole;
import org.apache.poi.ss.formula.functions.T;

public class PageUtil {
	private int code=0;
    private String msg;
    private int count; //总条数
    private List<OaRole> data = new ArrayList<OaRole>();
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
	public List<OaRole> getData() {
		return data;
	}
	public void setData(List<OaRole> data) {
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
