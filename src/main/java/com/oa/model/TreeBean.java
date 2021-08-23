package com.oa.model;

import java.io.Serializable;

public class TreeBean implements Serializable {

    /*序列号*/
    private static final long serialVersionUID = 4542667966180441411L;

    /********************树的基本属性***********************/
    //节点id
    private Integer id;
    //父节点id
    private Integer pI;
    //名称
    private String name;
    //是否是父节点
    private Boolean isParent;
    //是否默认展开父节点
    private Boolean open;
    //是否默认选中
    private Boolean checked;

    //----------------------GETTER AND SETTER-----------------------------------

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpI() {
        return pI;
    }

    public void setpI(Integer pI) {
        this.pI = pI;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getIsParent() {
        return isParent;
    }

    public void setIsParent(Boolean isParent) {
        this.isParent = isParent;
    }

    public Boolean getOpen() {
        return open;
    }

    public void setOpen(Boolean open) {
        this.open = open;
    }

    @Override
    public String toString() {
        return "TreeBean{" +
                "id='" + id + '\'' +
                ", pI='" + pI + '\'' +
                ", name='" + name + '\'' +
                ", isParent=" + isParent +
                ", open=" + open +
                ", checked=" + checked +
                '}';
    }
}
