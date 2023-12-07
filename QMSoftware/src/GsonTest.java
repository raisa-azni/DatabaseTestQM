import com.google.gson.Gson;

public class GsonTest {
    public static void main(String[] args) {
        Gson gson = new Gson();
        MyObject obj = new MyObject();
        String json = gson.toJson(obj);
        System.out.println(json);
    }
}

class MyObject {
    private int id = 1;
    private String name = "Test";
    // Getters and setters
}
