package oracle.webcenter.sites.controller

import com.fatwire.assetapi.common.AssetAccessException;
import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*
import com.fatwire.assetapi.fragment.Fragment

public class TableController extends BaseController
{
    @RequiredParams(query="fields,table")
    public void doWork(Map models)
    {
		String fields = variables.fields;
		String tableName = variables.table;
		
		String limit = variables.limit;
		if(limit == null)
			limit = "100";
		
		try {
			List<Map> rows = newTableReader()
				.select(fields)
				.from(tableName)
				.limit(Integer.parseInt(limit))
				.execute();
			models.put("table", tableName);
			models.put("fields", fields.split(","));
			models.put("rows", rows);
		} catch (NumberFormatException | AssetAccessException e) {
			e.printStackTrace();
		}
    }
}