package ua.lviv.iot.dao.impl;

import ua.lviv.iot.model.User;

public class UserDaoImpl extends AbstractDaoImpl<User, Integer> {

    public UserDaoImpl() {
        super(User.class);
    }
}