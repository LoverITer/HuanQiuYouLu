package com.servlet.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import com.servlet.core.Action;

/**
 * 去注册界面
 * @author Administrator
 *
 */
@WebServlet(urlPatterns = {"/signup"})
public class SignUpServlet extends Action {


	private static final long serialVersionUID = 7323608067801205145L;

	@Override
	public void index(Mapping map) throws ServletException, IOException {
		map.forward("WEB-INF/pages/signup.jsp");
	}

}
