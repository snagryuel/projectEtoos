package common;

public class PageUtil {
	public static String makePageNumber(int total_page, int page_selected, String uri, String queryString) {
		String text = "";
		StringBuilder sb = new StringBuilder();
		
		// 페이징의 시작 페이지 번호 계산
		int start_page = ((int) Math.floor((((double)page_selected - 1)*0.1))*10)+1; // 좀 더 쉬운방법이 있으면 좋겠음.
		
		// <<, <, >, >> 버튼 클릭 시 이동할 페이징 계산
		int grandPrev = (page_selected > 1) ? (((page_selected - 10) > 1) ? page_selected - 10 : 1) : 1;
		int prev = (page_selected > 1)? page_selected - 1 : 1;
		int next = (page_selected < total_page)? page_selected + 1 : page_selected;
		int grandNext = (page_selected < total_page) ? (((page_selected + 10) < total_page) ? page_selected + 10 : total_page) : total_page;
		
		sb.append("<li><a class='prev' href='" + uri + "?pageSelected="+ grandPrev + "&" + queryString +"'>&lt;&lt;</a></li>");
		sb.append("<li><a class='prev' href='" + uri + "?pageSelected="+ prev + "&" + queryString +"'>&lt;</a></li>");
		for(int i = start_page; i < (start_page + 10); i++) {
			if(i > total_page) {
				break;
			} else {
				String fullUrl = uri + "?pageSelected="+i+"&"+queryString;
				String selected = "";
				if(i == page_selected) {
					selected = "class='selected'";
				}	
				
				sb.append("<li><a href='" + fullUrl + "'"+selected+">"+ i +"</a></li>");
			}
		}
		sb.append("<li><a class='next' href='" + uri + "?pageSelected="+ next + "&" + queryString +"'>&gt;</a></li>");
		sb.append("<li><a class='next' href='" + uri + "?pageSelected="+ grandNext + "&" + queryString +"'>&gt;&gt;</a></li>");
		text = sb.toString();
		
		return text;
	}
	
}
