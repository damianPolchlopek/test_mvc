package com.polchlopek.validation;

import com.polchlopek.entity.Person;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Id;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class PersonToValUpdate {
	
	@Id
	private Integer id;

	@NotEmpty(message="is required")
	@Size(min=1, max=15, message="max size 15 characters")
	private String nickName;

	@NotEmpty(message="is required")
	@Size(min=1, max=15, message="max size 15 characters")
	private String firstName;

	@NotEmpty(message="is required")
	@Size(min=1, max=15, message="max size 15 characters")
	private String lastName;

	@NotEmpty(message="is required")
	@Size(min=1, max=45, message="max size 45 characters")
	private String email;

//	@NotEmpty(message="is required")
//	@Size(min=1, max=45, message="max size 45 characters")
	private String password;

	@NotNull(message="is required")
	@Min(value=0, message="Wieksze od zera")
	@Max(value=999999999, message="max size 9 numbers")
	private Integer phone;

	private boolean enabled;
	
	public PersonToValUpdate(Person thePerson) {
		this.id = thePerson.getId();
		this.firstName = thePerson.getFirstName();
		this.lastName = thePerson.getLastName();
		this.nickName = thePerson.getNickName();
		this.email = thePerson.getEmail();
		this.password = thePerson.getPassword();
		this.phone = thePerson.getPhone();
		this.enabled = thePerson.getEnabled();
	}
	
	public PersonToValUpdate() {
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPhone() {
		return phone;
	}

	public void setPhone(Integer phone) {
		this.phone = phone;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String toString() {
		return "Person [id=" + id + ", lastName=" + lastName +
				", email =" + email + ", password= " + password + "]";
	}

}
