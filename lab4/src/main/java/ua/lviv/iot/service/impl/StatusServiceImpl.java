package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.StatusDaoImpl;
import ua.lviv.iot.model.Status;

public class StatusServiceImpl extends AbstractServiceImpl<Status, Integer> {
    public StatusServiceImpl() {
        super(new StatusDaoImpl());
    }
}
