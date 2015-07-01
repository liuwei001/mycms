package com.klht.common.persistence.generic;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.klht.common.utils.Reflections;
import com.klht.common.utils.StringUtils;

/**
 * 数据Entity类
 * @author zhen.xie
 * @version 2015-05-01
 */
public abstract class ETreeEntity<T, E> extends EDataEntity<T, E> {

	private static final long serialVersionUID = 1L;

	protected T parent;	// 父级编号
	protected String parentIds; // 所有父级编号
	protected String name; 	// 机构名称
	protected Integer sort;		// 排序
	
	public ETreeEntity() {
		super();
		this.sort = 30;
	}
	
	public ETreeEntity(E id) {
		super(id);
	}
	
	/**
	 * 父对象，只能通过子类实现，父类实现mybatis无法读取
	 * @return
	 */
	@JsonBackReference
	@NotNull
	public abstract T getParent();

	/**
	 * 父对象，只能通过子类实现，父类实现mybatis无法读取
	 * @return
	 */
	public abstract void setParent(T parent);

	@Length(min=1, max=2000)
	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	@Length(min=1, max=100)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	public E getParentId() {
		E id = null;
		if (parent != null){
			id = (E)Reflections.getFieldValue(parent, "id");
		}
		return (E) ((id != null && StringUtils.isNotBlank(id.toString())) ? id : "0");
	}
	
}
