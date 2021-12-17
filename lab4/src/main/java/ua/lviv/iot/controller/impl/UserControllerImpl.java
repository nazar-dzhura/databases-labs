package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.User;
import ua.lviv.iot.service.impl.UserServiceImpl;

public class UserControllerImpl extends AbstractControllerImpl<User, Integer> {
    public UserControllerImpl() {
        super(new UserServiceImpl());
    }
}
