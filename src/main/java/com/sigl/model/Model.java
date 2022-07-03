package com.sigl.model;

import java.util.ArrayList;
import java.util.List;

import com.sigl.entities.Menu;

public class Model {
	List<Menu> menus;

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> list) {
		this.menus = list;
	}

	public Model(List<Menu> menus) {
		super();
		this.menus = menus;
	}

	public Model() {
		super();
		menus=new ArrayList<Menu>();
	}
	
	
}
