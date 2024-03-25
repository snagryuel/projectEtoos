package common;

public class QnaUtil {
	public static boolean isNumeric(String str) {
		return str != null && !str.isEmpty() && !str.isBlank() && str.matches("[0-9]+");
		
	}
	public static int parseInt(String no) {
		return (isNumeric(no)? Integer.parseInt(no) : 0);
	}

}
