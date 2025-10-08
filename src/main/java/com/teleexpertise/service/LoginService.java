package com.teleexpertise.service;

import com.teleexpertise.dao.UserDAO;
import com.teleexpertise.model.User;
import com.teleexpertise.util.passwordUtil;

public class LoginService {

    public User authenticate(String email, String password) {
        User user = UserDAO.getByEmail(email);

        if (user == null) {
            return null;
        }

        if (user.getPassword() == null) {
            return null;
        }

        if (passwordUtil.verifyPassword(password, user.getPassword())) {
            return user;
        }

        return null;
    }

}
