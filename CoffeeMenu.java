import java.util.HashMap;
import java.util.Map;

class CoffeeMenu {
    private static Map<String, Coffee> coffeeMenu = new HashMap<>();

    public static Coffee getCoffee(String name, double price, int sweetnessLevel) {
        Coffee coffee = coffeeMenu.get(name);
        if (coffee == null) {
            coffee = new Coffee(name, price, sweetnessLevel);
            coffeeMenu.put(name, coffee);
        }
        return coffee;
    }

    public static void displayMenu() {
        System.out.println("Current Coffee Menu:");
        for (Coffee coffee : coffeeMenu.values()) {
            System.out.println(coffee);
        }
    }

    public static Coffee getCoffeeByName(String name) {
        return coffeeMenu.get(name);
    }
}

class Coffee {
    private String name;
    private double price;
    private int sweetnessLevel;

    public Coffee(String name, double price, int sweetnessLevel) {
        this.name = name;
        this.price = price;
        this.sweetnessLevel = sweetnessLevel;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getSweetnessLevel() {
        return sweetnessLevel;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setSweetnessLevel(int sweetnessLevel) {
        this.sweetnessLevel = sweetnessLevel;
    }

    @Override
    public String toString() {
        return "Coffee{" +
                "name='" + name + '\'' +
                ", price=" + price +
                ", sweetnessLevel=" + sweetnessLevel +
                '}';
    }
}
