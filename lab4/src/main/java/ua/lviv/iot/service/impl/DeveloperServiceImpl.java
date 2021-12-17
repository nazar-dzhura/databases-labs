package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.DeveloperDaoImpl;
import ua.lviv.iot.model.Developer;

public class DeveloperServiceImpl extends AbstractServiceImpl<Developer, Integer> {
    public DeveloperServiceImpl() {
        super(new DeveloperDaoImpl());
    }
}
