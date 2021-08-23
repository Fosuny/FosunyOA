package com.oa.util;

import com.oa.model.LogMessage;

import java.util.ArrayList;
import java.util.List;

public class LogPageUtil {
	private int code=0;
    private String msg;
    private int count; //总条数
    private List<LogMessage> data = new ArrayList<LogMessage>();
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
	public List<LogMessage> getData() {
		return data;
	}
	public void setData(List<LogMessage> data) {
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
