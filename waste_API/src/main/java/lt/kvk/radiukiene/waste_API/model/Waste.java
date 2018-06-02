package lt.kvk.radiukiene.waste_API.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "waste")
public class Waste {
	
	@Id
	@Column(name = "waste_id")
	String wasteId; 
	
	@Column(name = "waste_name")
	String wasteName;
	
	public Waste(String wasteId, String wasteName) {
		super();
		this.wasteId = wasteId;
		this.wasteName = wasteName;
	}
	
	public Waste() {
		super();
	}
	
	public String getWasteId() {
		return wasteId;
	}

	public void setWasteId(String wasteId) {
		this.wasteId = wasteId;
	}

	public String getWasteName() {
		return wasteName;
	}

	public void setWasteName(String wasteName) {
		this.wasteName = wasteName;
	}
}
