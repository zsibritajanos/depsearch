package ws;

/**
 * Created by zsjanos on 2016.11.23..
 */

import elastic.Counter;
import elastic.Search;

import javax.jws.WebService;

@WebService(endpointInterface = "ws.DepSearchWebServiceInterface")
public class DepSearchWebServiceImpl implements DepSearchWebServiceInterface {
    @Override
    public int count(String arg0) {
        return Counter.count();
    }

    @Override
    public String searchMultiple(String arg0, String arg1, String arg2, String arg3, String arg4) {
        return Search.searchByMultiple(arg0, arg1, arg2, arg3, arg4);
    }
}
