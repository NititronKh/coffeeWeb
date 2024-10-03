interface Command {
    void execute();
}

class AddMenuCommand implements Command {
    private CoffeeMenu coffeeMenu;
    private String name;
    private double price;
    private int sweetnessLevel;

    public AddMenuCommand(CoffeeMenu coffeeMenu, String name, double price, int sweetnessLevel) {
        this.coffeeMenu = coffeeMenu;
        this.name = name;
        this.price = price;
        this.sweetnessLevel = sweetnessLevel;
    }

    @Override
    public void execute() {
        coffeeMenu.getCoffee(name, price, sweetnessLevel);
    }
}

class OrderCoffeeCommand implements Command {
    private String name;

    public OrderCoffeeCommand(String name) {
        this.name = name;
    }

    @Override
    public void execute() {
        Coffee coffee = CoffeeMenu.getCoffeeByName(name);
        if (coffee != null) {
            System.out.println("Ordered: " + coffee);
        } else {
            System.out.println("Coffee not found in menu.");
        }
    }
}

class DisplayMenuCommand implements Command {

    @Override
    public void execute() {
        CoffeeMenu.displayMenu();
    }
}

class EditMenuCommand implements Command {
    private String name;
    private double newPrice;
    private int newSweetnessLevel;

    public EditMenuCommand(String name, double newPrice, int newSweetnessLevel) {
        this.name = name;
        this.newPrice = newPrice;
        this.newSweetnessLevel = newSweetnessLevel;
    }

    @Override
    public void execute() {
        Coffee coffee = CoffeeMenu.getCoffeeByName(name);
        if (coffee != null) {
            coffee.setPrice(newPrice);
            coffee.setSweetnessLevel(newSweetnessLevel);
            System.out.println("Updated: " + coffee);
        } else {
            System.out.println("Coffee not found in menu.");
        }
    }
}
