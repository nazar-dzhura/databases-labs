package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.SystemRequirementDaoImpl;
import ua.lviv.iot.model.SystemRequirement;

public class SystemRequirementServiceImpl extends AbstractServiceImpl<SystemRequirement, Integer> {
    public SystemRequirementServiceImpl() {
        super(new SystemRequirementDaoImpl());
    }
}
