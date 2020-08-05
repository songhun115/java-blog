package com.sbs.java.blog.Exception;

public class SQLErrorException extends RuntimeException {
	public SQLErrorException(String message) {
		super(message);
	}
}
