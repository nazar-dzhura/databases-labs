package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.LanguageDaoImpl;
import ua.lviv.iot.model.Language;

public class LanguageServiceImpl extends AbstractServiceImpl<Language, Integer> {
    public LanguageServiceImpl() {
        super(new LanguageDaoImpl());
    }
}
