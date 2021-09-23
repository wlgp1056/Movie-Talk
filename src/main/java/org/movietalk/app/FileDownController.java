package org.movietalk.app;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/review")
public class FileDownController {
	
	@RequestMapping(value = "fileDownload.do")
	public void fileDownload4(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		// String path = request.getSession().getServletContext().getRealPath("저장경로");

		String filename = req.getParameter("fileName");
		String realFilename = "";
		System.out.println(filename);

		try {
			String browser = req.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else {
				filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		
		// 자기 패키지 경로로 변경!!
		realFilename = "C:\\Users\\jihye\\stud\\spring\\MovieTalk_0916_1531\\src\\main\\webapp\\resources\\file\\" + filename;

		System.out.println(realFilename);
		File file1 = new File(realFilename);
		if (!file1.exists()) {
			return;
		}

		// 파일명 지정
		resp.setContentType("application/octer-stream");
		resp.setHeader("Content-Transfer-Encoding", "binary;");
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		try {
			OutputStream os = resp.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (Exception e) {
			System.out.println("FileNotFoundException : " + e);
		}
	}
}


