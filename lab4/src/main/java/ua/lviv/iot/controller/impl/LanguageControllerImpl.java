package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Language;
import ua.lviv.iot.service.impl.LanguageServiceImpl;

public class LanguageControllerImpl extends AbstractControllerImpl<Language, Integer> {
    public LanguageControllerImpl() {
        super(new LanguageServiceImpl());
    }
}
