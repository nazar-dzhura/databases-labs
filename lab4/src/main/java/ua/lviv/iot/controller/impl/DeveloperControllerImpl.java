package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Developer;
import ua.lviv.iot.service.impl.DeveloperServiceImpl;

public class DeveloperControllerImpl extends AbstractControllerImpl<Developer, Integer> {
    public DeveloperControllerImpl() {
        super(new DeveloperServiceImpl());
    }
}
