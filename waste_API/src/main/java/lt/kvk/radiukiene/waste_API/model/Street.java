package lt.kvk.radiukiene.waste_API.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "street")
public class Street {

	@Id
	@Column(name = "street_id")
	String streetId;
	
	@Column(name = "street_name")
	String name;
	
	public Street(String streetId, String name) {
		super();
		this.streetId = streetId;
		this.name = name;
	}
	
	protected Street() {
		super();
	}
	
	public String getStreetId() {
		return streetId;
	}

	public void setStreetId(String streetId) {
		this.streetId = streetId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	} 
}
