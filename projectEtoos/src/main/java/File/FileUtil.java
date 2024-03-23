package File;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	public static String uploadFile(HttpServletRequest req, String directory) throws ServletException, IOException{
		Part part = req.getPart("teacherImgUp");
		String FileName="";
		
		if(part != null) {
			String pHeader = part.getHeader("content-disposition");
			System.out.println("pHeader : "+pHeader);
			
			String [] arrPartHeader = pHeader.split("filename=");
			FileName = arrPartHeader[1].trim().replace("\"", "");
			
			
			if(!FileName.isEmpty()) {
				System.out.println("파일 인서트 실행");
				part.write(directory+File.separator + FileName);	        
			}
		}
		
		return FileName;
	}
}
