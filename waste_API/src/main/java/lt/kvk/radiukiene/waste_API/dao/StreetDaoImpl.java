package lt.kvk.radiukiene.waste_API.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Future;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.AsyncResult;
import org.springframework.stereotype.Service;

import lt.kvk.radiukiene.waste_API.model.Waste;
import lt.kvk.radiukiene.waste_API.model.Street;

@Service
public class StreetDaoImpl implements StreetDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	protected Session getSession() {
		return sessionFactory.openSession();
	}

	public Future<List<Street>> streetList() {
		Session session = this.sessionFactory.openSession();
		try {
			String sql = "select str.street_name, str.id  from street as str";
			SQLQuery query = session.createSQLQuery(sql);
			List<Street> list = query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
			return new AsyncResult<List<Street>>(list);
		} catch (Exception e) {
			e.printStackTrace();
			return new AsyncResult<List<Street>>(new ArrayList<Street>());
		} finally {
			session.close();
		}
	}


	public Future<List<Waste>> wasteList() {
		Session session = this.sessionFactory.openSession();
		try {
			String sql = "select wst.waste_name, wst.id  from waste as wst";
			SQLQuery query = session.createSQLQuery(sql);
			List<Waste> list = query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP).list();
			return new AsyncResult<List<Waste>>(list);
		} catch (Exception e) {
			e.printStackTrace();
			return new AsyncResult<List<Waste>>(new ArrayList<Waste>());
		} finally {
			session.close();
		}
	}


	public Future<Integer> addStreet(Street model) {
		try {
			Session session = this.sessionFactory.openSession();
			session.save(model);
			session.flush();
			return new AsyncResult<Integer>(200);
		} catch (Exception e) {
			System.out.println(e);

			return new AsyncResult<Integer>(409);
		}
	}

}
