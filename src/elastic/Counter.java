package elastic;

import org.json.JSONObject;

/**
 * Created by zsjanos on 2016.11.17..
 */
public class Counter {

    private static int getCountValue(String response) {
        int c = 0;
        JSONObject json;
        try {
            json = new JSONObject(response);
            c = json.getInt("count");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    public static int count() {
        return getCountValue(Search.ask("http://localhost:9200/users/user/_count"));
    }

    public static void main(String[] args) {
        System.out.println(count());
    }
}
