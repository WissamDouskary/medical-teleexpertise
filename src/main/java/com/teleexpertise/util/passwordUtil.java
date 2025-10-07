package com.teleexpertise.util;


import org.mindrot.jbcrypt.BCrypt;

public class passwordUtil {
    public static String hashPassword(String password){
        String salt = BCrypt.gensalt(12);
        return BCrypt.hashpw(password, salt);
    }

    public static boolean verifyPassword(String password, String storedHashedPassword){
        if (storedHashedPassword == null || !storedHashedPassword.startsWith("$2a$") && !storedHashedPassword.startsWith("$2b$")) {
            throw new IllegalArgumentException("Invalid stored bcrypt hash");
        }
        return BCrypt.checkpw(password, storedHashedPassword);
    }
}
