package lt.kvk.radiukiene.waste_API.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@Async
public class StatusBean { // bean status code class
	
	StatusBean status;
	private String Status;
	
	private int code;

	@Autowired
	public StatusBean(String Status, int code) {

		this.Status = Status;
		this.code = code;
	}

	@Autowired
	public StatusBean(int code) {
		this.code = code;

		if (code == 200) {
			this.Status = "Success";
		}
		else if (code == 400) {
			this.Status = "BadRequest";
		}
		else if (code == 404) {
			this.Status = "notfound";
		}
		else if (code == 503) {
			this.Status = "ServerNotFound";
		}
		else if (code == 500) {
			this.Status = "InternalServerError";
		}
		else {
			this.code = 409;
			this.Status = "try again";
		}
	}
	
	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

}
