package com.crud.reposetery;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.crud.entity.Users;

@Repository
public interface UsersRepositery extends JpaRepository<Users,Long>{

}
