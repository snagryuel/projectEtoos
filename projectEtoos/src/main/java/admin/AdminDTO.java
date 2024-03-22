package admin;

public class AdminDTO {
	private int courseIdx;
	private String coursename;
	private String sugangStart;
	private String sugangEnd;
	private String sub1;
	private String sub2;
	private String name;
	private String id;
	private String birth;
	private String joinday;
	public String getJoinday() {
		return joinday;
	}
	public void setJoinday(String joinday) {
		this.joinday = joinday;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getSugangStart() {
		return sugangStart;
	}
	public void setSugangStart(String sugangStart) {
		this.sugangStart = sugangStart;
	}
	public String getSugangEnd() {
		return sugangEnd;
	}
	public void setSugangEnd(String sugangEnd) {
		this.sugangEnd = sugangEnd;
	}
	public String getSub1() {
		return sub1;
	}
	public void setSub1(String sub1) {
		this.sub1 = sub1;
	}
	public String getSub2() {
		return sub2;
	}
	public void setSub2(String sub2) {
		this.sub2 = sub2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCourseIdx() {
		return courseIdx;
	}
	public void setCourseIdx(int courseIdx) {
		this.courseIdx = courseIdx;
	}
}
