package File;

public class FileDTO {
	private String idx;
	private String title;
	private String category;
	private String orgFile;
	private String saveFile;
	private String reg_date;
	private String bbs_idx;
	
	public FileDTO(){
		
	}
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOrgFile() {
		return orgFile;
	}
	public void setOrgFile(String orgFile) {
		this.orgFile = orgFile;
	}
	public String getSaveFile() {
		return saveFile;
	}
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getBbs_idx() {
		return bbs_idx;
	}

	public void setBbs_idx(String bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
}
