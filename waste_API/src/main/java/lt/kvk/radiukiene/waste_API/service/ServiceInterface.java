package lt.kvk.radiukiene.waste_API.service;

import java.util.List;
import java.util.concurrent.Future;

import lt.kvk.radiukiene.waste_API.model.AllWasteCollection;
import lt.kvk.radiukiene.waste_API.model.Waste;
import lt.kvk.radiukiene.waste_API.model.Street;
import lt.kvk.radiukiene.waste_API.model.WasteCollection;
import lt.kvk.radiukiene.waste_API.model.UpdateWaste;


public interface ServiceInterface {

	Future<List<Street>> streetList();

	Future<List<Waste>> wasteList();

	Future<Integer> addWasteCollection(UpdateWaste model);

	Future<Integer> addStreet(Street model);

	Future<List<WasteCollection>> wasteCollectionListStreet(String streetId);

	Future<Integer> wasteCollectionStreets(AllWasteCollection model);
}
