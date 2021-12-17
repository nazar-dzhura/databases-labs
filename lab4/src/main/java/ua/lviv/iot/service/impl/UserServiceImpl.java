package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.UserDaoImpl;
import ua.lviv.iot.model.User;

public class UserServiceImpl extends AbstractServiceImpl<User, Integer> {
    public UserServiceImpl() {
        super(new UserDaoImpl());
    }
}
