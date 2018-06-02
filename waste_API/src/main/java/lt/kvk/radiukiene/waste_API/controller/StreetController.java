package lt.kvk.radiukiene.waste_API.controller;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lt.kvk.radiukiene.waste_API.model.Street;
import lt.kvk.radiukiene.waste_API.service.ServiceInterface;


@RestController
public class StreetController {
	@Autowired
	ServiceInterface service;

	// api to get all streets
	@RequestMapping(value = "streets", method = RequestMethod.GET)
	public JSONObject streets() throws InterruptedException, ExecutionException {
		JSONObject jsonObject = new JSONObject();
		Future<List<Street>>code = service.streetList();
		jsonObject.put("result", code.get());
		return jsonObject;
	}
}
