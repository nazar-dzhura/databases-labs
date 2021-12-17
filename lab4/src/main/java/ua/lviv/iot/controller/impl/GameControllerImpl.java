package ua.lviv.iot.controller.impl;

import ua.lviv.iot.model.Game;
import ua.lviv.iot.service.impl.GameServiceImpl;

public class GameControllerImpl extends AbstractControllerImpl<Game, Integer> {
    public GameControllerImpl() {
        super(new GameServiceImpl());
    }
}
