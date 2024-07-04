package Model;

public class Wishlist {

    int orderID;
    int userID;
    int productID;
    String productName;
    float productPrice;
    int day;

    public Wishlist() {
    }

    public Wishlist(int orderID, int userID, int productID, String productName, float productPrice, int day) {
        this.orderID = orderID;
        this.userID = userID;
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.day = day;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(float productPrice) {
        this.productPrice = productPrice;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "Wishlist{" + "orderID=" + orderID + ", userID=" + userID + ", productID=" + productID + ", productName=" + productName + ", productPrice=" + productPrice + ", day=" + day + '}';
    }

}
