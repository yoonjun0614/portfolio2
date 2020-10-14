package yj.kr.dataroom.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import com.mysql.jdbc.Field;

public class UploadFileUtil {

	public static String uploadFile(String uploadPath, String originalName , byte[] fileDate )throws Exception{

    	Calendar calendar = Calendar.getInstance();
    	Date date = calendar.getTime();
    	String prevTime = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
    	
		//저장할 파일명 날자 + 원본이름
		String savedName = "/"+ prevTime + "_" + originalName; 
		
		//업로드할 디렉토리 (날자별 생성)
		String savedPath = calcPath(uploadPath);
		//파일 경로(기존의 업로드경로 + 날자별 경로) , 파일명을 받아 파일 객체 생성
		File target =new File(uploadPath + savedPath + savedName);
		//임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileDate, target);
		//썸네일을 생성하기 위한 파일의 확장자 검사
		//파일명이 aaa.bbb.ccc.jpg일 경우 마지막 마침표를 찾기위해
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName =null;
		//이지미 파일은 썸네일 사용
		
		System.out.println("uploadPath::"+uploadPath);
		System.out.println("savedPath::"+savedPath);
		System.out.println("savedName::"+savedName);
		
		if(MeaidUtil.getMediaType(formatName) != null) {
			//썸네일 생성
			uploadedFileName =makeThumbnail(uploadPath, savedPath, savedName);
		//나머지는 아이콘 생성
		}else{
			//아이콘 생성
			uploadedFileName =makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	
	//날자별 디렉토리 추출
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		//File.separator :디렉토리 구분자
		//연도  ex) \\2017
		String yearPath = "/" + cal.get(Calendar.YEAR);
		//월 ex) \\2017\\03
		String monthPath = yearPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		//일 ex) \\2017\\03\\01
		String datePath = monthPath + "/" + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	
		makeDir(uploadPath, yearPath, monthPath ,datePath);

		return datePath;
	}
	
	//디렉토리 생성
	private static void makeDir(String uploadPath, String ... paths) {
		
		//디렉토리가 존재하면
		if(new File(paths[paths.length - 1]).exists()) {
			return;
		}
		//디렉토리가 존재하지 않으면
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	//썸네일 생성
	private static String makeThumbnail(String uploacPath, String Path, String fileName)throws Exception{
		
		//이미지를 읽기 위한 버퍼
		BufferedImage sourceImg =ImageIO.read(new File(uploacPath + Path , fileName));
		//100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg,Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		//썸네일의 이름을 생성(원본파일명에 s_를 붙인다)
		String thumbnailName = uploacPath + Path + File.separator + "s_" + fileName;
		//파일이름을 새롭게 만든다
		File  newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		//썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase() ,newFile );
		
		//썸네일의 이름을 리턴
		return thumbnailName.substring(uploacPath.length()).replace(File.separatorChar, '/');
	}
	
	//아이콘 생성
	private static String makeIcon(String uploadPath,String path, String fileName)throws Exception{
		
		//아이콘의 이름
		String iconName =uploadPath + path +File.separator +fileName;
		//아이콘 이름을 리턴
		//File.separatorChar : 디렉토리 구분자
		// 윈도우 \ , 리눅스(유닉스) /
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	}
	
}
