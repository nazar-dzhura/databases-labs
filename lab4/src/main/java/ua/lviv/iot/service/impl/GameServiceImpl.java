package ua.lviv.iot.service.impl;

import ua.lviv.iot.dao.impl.GameDaoImpl;
import ua.lviv.iot.model.Game;

public class GameServiceImpl extends AbstractServiceImpl<Game, Integer> {
    public GameServiceImpl() {
        super(new GameDaoImpl());
    }
}
