package ua.lviv.iot.view;

import ua.lviv.iot.controller.AbstractController;
import ua.lviv.iot.controller.impl.*;
import ua.lviv.iot.model.*;

import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;

public class View {

    private static final String KEY_EXIT = "Q";
    private static final String TEXT_GO_BACK = "Go back or quit";
    private static final String TEXT_SELECT_MENU_OPTION = "Please choose menu option: ";
    private static final String ERROR_NO_SUCH_OPTION = "No such option found. Try again.";

    private static final Scanner input = new Scanner(System.in, StandardCharsets.UTF_8);

    public void show() {
        showTablesMenu();
    }

    /**
     * Show general tables MENU
     */
    private void showTablesMenu() {
        Map<String, String> tablesMenu = generateTablesMenu();
        Map<String, Printable> tablesMenuMethods = generateTablesMenuMethods();
        showMenuFromMaps(tablesMenu, tablesMenuMethods);
    }

    /**
     * Generate general tables MENU and MENU METHODS
     */
    private Map<String, String> generateTablesMenu() {
        Map<String, String> tablesMenu = new LinkedHashMap<>();
        tablesMenu.put("1", "Table: Developer");
        tablesMenu.put("2", "Table: Game");
        tablesMenu.put("3", "Table: Group");
        tablesMenu.put("4", "Table: Language");
        tablesMenu.put("5", "Table: Status");
        tablesMenu.put("6", "Table: SystemRequirement");
        tablesMenu.put("7", "Table: User");
        return tablesMenu;
    }

    private Map<String, Printable> generateTablesMenuMethods() {
        Map<String, Printable> tablesMenuMethods = new LinkedHashMap<>();
        tablesMenuMethods.put("1", this::showDeveloperMenu);
        tablesMenuMethods.put("2", this::showGameMenu);
        tablesMenuMethods.put("3", this::showGroupMenu);
        tablesMenuMethods.put("4", this::showLanguageMenu);
        tablesMenuMethods.put("5", this::showStatusMenu);
        tablesMenuMethods.put("6", this::showSystemRequirementMenu);
        tablesMenuMethods.put("7", this::showUserMenu);
        return tablesMenuMethods;
    }

    /**
     * Show single table MENU
     */
    private void showDeveloperMenu() {
        Map<String, String> menu = generateMenu();
        Map<String, Printable> menuMethods = generateMenuOptions(new DeveloperControllerImpl(), Developer.class);
        showMenuFromMaps(menu, menuMethods);
    }

    private void showGameMenu() {
        Map<String, String> menu = generateMenu();
        Map<String, Printable> menuMethods = generateMenuOptions(new GameControllerImpl(), Game.class);
        showMenuFromMaps(menu, menuMethods);
    }

    private void showGroupMenu() {
        Map<String, String> menu = generateMenu();
        Map<String, Printable> menuMethods = generateMenuOptions(new GroupControllerImpl(), Group.class);
        showMenuFromMaps(menu, menuMethods);
    }

    private void showLanguageMenu() {
        Map<String, String> menu = generateMenu();
        Map<String, Printable> menuMethods = generateMenuOptions(new LanguageControllerImpl(), Language.class);
        showMenuFromMaps(menu, menuMethods);
    }

    private void showStatusMenu() {
        Map<String, String> menu = generateMenu();
        Map<String, Printable> menuMethods = generateMenuOptions(new StatusControllerImpl(), Status.class);
        showMenuFromMaps(menu, menuMethods);
    }

    private void showSystemRequirementMenu() {
        Map<String, String> menu = generateMenu();
        Map<String, Printable> menuMethods = generateMenuOptions(new SystemRequirementControllerImpl(), SystemRequirement.class);
        showMenuFromMaps(menu, menuMethods);
    }

    private void showUserMenu() {
        Map<String, String> menu = generateMenu();
        Map<String, Printable> menuMethods = generateMenuOptions(new UserControllerImpl(), User.class);
        showMenuFromMaps(menu, menuMethods);
    }

    /**
     * Generate single table MENU
     */
    private Map<String, String> generateMenu() {
        Map<String, String> menu = new LinkedHashMap<>();
        menu.put("1", "Select all");
        menu.put("2", "Select");
        menu.put("3", "Create");
        menu.put("4", "Update");
        menu.put("5", "Delete");
        return menu;
    }

    /**
     * Generate single table MENU METHODS
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private <T> Map<String, Printable> generateMenuOptions(AbstractController controller, Class<T> clazz) {
        Formatter<T, Integer> formatter = new Formatter<>(clazz);
        ViewOperations<Developer, Integer> operation = new ViewOperations<>(controller, formatter, clazz);

        Map<String, Printable> menuOptions = new LinkedHashMap<>();
        menuOptions.put("1", operation::findAll);
        menuOptions.put("2", operation::findById);
        menuOptions.put("3", operation::create);
        menuOptions.put("4", operation::update);
        menuOptions.put("5", operation::delete);
        return menuOptions;
    }


    /**
     * Show menu from Maps
     */
    private void showMenuFromMaps(Map<String, String> keyName, Map<String, Printable> keyMethod) {
        String keyMenu;
        do {
            printMenu(keyName);
            System.out.println(TEXT_SELECT_MENU_OPTION);
            keyMenu = input.nextLine().toUpperCase();
            Printable method = keyMethod.get(keyMenu);
            if (method != null) {
                method.print();
            } else if (!keyMenu.equals(KEY_EXIT)) {
                System.out.println(ERROR_NO_SUCH_OPTION);
            }
        } while (!keyMenu.equals(KEY_EXIT));
    }

    private void printMenu(Map<String, String> keyName) {
        keyName.entrySet().stream()
                .forEach(es -> System.out.printf("%3s - %s%n", es.getKey(), es.getValue()));
        System.out.printf("%3s - %s%n", KEY_EXIT, TEXT_GO_BACK);
    }
}
