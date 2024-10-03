public class Main {
    public static void main(String[] args) {
        CoffeeShop coffeeShop = new CoffeeShop();

        // เพิ่มเมนู
        coffeeShop.takeOrder(new AddMenuCommand(CoffeeMenu, "Latte", 5.0, 3));
        coffeeShop.takeOrder(new AddMenuCommand(CoffeeMenu, "Espresso", 3.0, 1));
        coffeeShop.placeOrders();

        // แสดงเมนูทั้งหมด
        coffeeShop.takeOrder(new DisplayMenuCommand());
        coffeeShop.placeOrders();

        // เลือกสั่งเมนู
        coffeeShop.takeOrder(new OrderCoffeeCommand("Latte"));
        coffeeShop.placeOrders();

        // แก้ไขเมนู
        coffeeShop.takeOrder(new EditMenuCommand("Latte", 5.5, 4));
        coffeeShop.placeOrders();

        // แสดงเมนูที่อัปเดตแล้ว
        coffeeShop.takeOrder(new DisplayMenuCommand());
        coffeeShop.placeOrders();
    }
}
