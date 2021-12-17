package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.SystemRequirement;
import ua.lviv.iot.service.impl.SystemRequirementServiceImpl;

public class SystemRequirementControllerImpl extends AbstractControllerImpl<SystemRequirement, Integer> {
    public SystemRequirementControllerImpl() {
        super(new SystemRequirementServiceImpl());
    }
}
