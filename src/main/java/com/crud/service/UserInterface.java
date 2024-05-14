package com.crud.service;

import java.util.List;

import javax.swing.JList;

import com.crud.entity.Users;

public interface UserInterface {
public Users SaveUsers(Users users);
public Users UpdateUsers(Users users);
public void DeleteUsers(Users users);
public Users FindbyId(Users users);
}
