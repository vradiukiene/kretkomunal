package lt.kvk.radiukiene.waste_API.dao;

import java.util.List;
import java.util.concurrent.Future;

import lt.kvk.radiukiene.waste_API.model.Waste;
import lt.kvk.radiukiene.waste_API.model.Street;

public interface StreetDao {

	Future<List<Street>> streetList();

	Future<List<Waste>> wasteList();

	Future<Integer> addStreet(Street model);
}
