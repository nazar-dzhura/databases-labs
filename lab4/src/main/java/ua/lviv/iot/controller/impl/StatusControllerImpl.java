package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Status;
import ua.lviv.iot.service.impl.StatusServiceImpl;

public class StatusControllerImpl extends AbstractControllerImpl<Status, Integer> {
    public StatusControllerImpl() {
        super(new StatusServiceImpl());
    }
}
