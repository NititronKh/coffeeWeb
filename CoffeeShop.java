import java.util.ArrayList;
import java.util.List;

class CoffeeShop {
    private List<Command> commandList = new ArrayList<>();

    public void takeOrder(Command command) {
        commandList.add(command);
    }

    public void placeOrders() {
        for (Command command : commandList) {
            command.execute();
        }
        commandList.clear();
    }
}
