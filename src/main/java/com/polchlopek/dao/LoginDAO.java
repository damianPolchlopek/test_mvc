package com.polchlopek.dao;

import com.polchlopek.entity.Login;
import com.polchlopek.entity.Person;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface LoginDAO {
	
	public List<Login> getLogins();

	public void addPerson(Person tmpPerson);
	
}
