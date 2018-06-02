package lt.kvk.radiukiene.waste_API.controller;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lt.kvk.radiukiene.waste_API.model.WasteCollection;
import lt.kvk.radiukiene.waste_API.service.ServiceInterface;

@RestController
public class WasteCollectionController {
	@Autowired
	ServiceInterface service;

	//one street wasteCollection data
	@RequestMapping(value = "wastecollections", method = RequestMethod.GET)
	public JSONObject wasteCol(@RequestParam String street_id) throws InterruptedException, ExecutionException {
		JSONObject jsonObject = new JSONObject();

		Future<List<WasteCollection>>code = service.wasteCollectionListStreet(street_id);
		jsonObject.put("result", code.get());
		return jsonObject;
	}
}
