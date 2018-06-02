package lt.kvk.radiukiene.waste_API.dao;

import java.util.List;
import java.util.concurrent.Future;

import lt.kvk.radiukiene.waste_API.model.AllWasteCollection;
import lt.kvk.radiukiene.waste_API.model.WasteCollection;
import lt.kvk.radiukiene.waste_API.model.UpdateWaste;

public interface WasteCollectionDao {

	Future<Integer> addWasteCollection(UpdateWaste model);

	Future<List<WasteCollection>> wasteCollectionListStreet(String streetId);

	Future<Integer> wasteCollectionStreets(AllWasteCollection model);
}
