package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.GroupDaoImpl;
import ua.lviv.iot.model.Group;

public class GroupServiceImpl extends AbstractServiceImpl<Group, Integer> {
    public GroupServiceImpl() {
        super(new GroupDaoImpl());
    }
}
