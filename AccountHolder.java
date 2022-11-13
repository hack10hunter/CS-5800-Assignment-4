import java.util.Random;

class AccountHolder {
    protected int ID;
    protected String address;

    public AccountHolder(int ID, String address) {
        this.ID = ID;
        this.address = address;
    }

    public static int getNextID() {
        int random = (int)(Math.random() * 1000000 + 1);
        return random;
    }
}