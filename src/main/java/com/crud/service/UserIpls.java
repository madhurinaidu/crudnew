package com.crud.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Example;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.crud.entity.Users;
import com.crud.reposetery.UsersRepositery;
@Service
public class UserIpls  {
	@Autowired
	UsersRepositery repo;

	public List<Users> getAllToDoItems() {
		ArrayList<Users> todoList = new ArrayList<>();
		repo.findAll().forEach(todo -> todoList.add(todo));
		
		return todoList;
	}
	
	public Users getToDoItemById(Long id) {
		return repo.findById(id).get();
	}
	
	public boolean updateStatus(Long id) {
		Users todo = getToDoItemById(id);
		todo.setStatus("Completed");
		
		return saveOrUpdateToDoItem(todo);
	}
	
	public boolean saveOrUpdateToDoItem(Users todo) {
		Users updatedObj = repo.save(todo);
		
		if (getToDoItemById(updatedObj.getId()) != null) {
			return true;
		}
		
		return false;
	}
	
	public boolean deleteToDoItem(Long id) {
		repo.deleteById(id);
		
		if (repo.findById(id).isEmpty()) {
			return true;
		}
		
		return false;
	}
	
}
