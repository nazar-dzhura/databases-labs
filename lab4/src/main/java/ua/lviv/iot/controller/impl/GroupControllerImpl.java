package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Group;
import ua.lviv.iot.service.impl.GroupServiceImpl;

public class GroupControllerImpl extends AbstractControllerImpl<Group, Integer> {
    public GroupControllerImpl() {
        super(new GroupServiceImpl());
    }
}
