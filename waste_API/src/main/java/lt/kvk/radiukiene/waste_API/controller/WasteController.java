package lt.kvk.radiukiene.waste_API.controller;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lt.kvk.radiukiene.waste_API.model.Waste;
import lt.kvk.radiukiene.waste_API.service.ServiceInterface;

@RestController
public class WasteController {
	@Autowired
	ServiceInterface service;

	// api to get all wastes
	@RequestMapping(value = "wastes", method = RequestMethod.GET)
	public JSONObject wastes() throws InterruptedException, ExecutionException {
		JSONObject jsonObject = new JSONObject();
		Future<List<Waste>>code = service.wasteList();
		jsonObject.put("result", code.get());
		return jsonObject;
	}	
}
