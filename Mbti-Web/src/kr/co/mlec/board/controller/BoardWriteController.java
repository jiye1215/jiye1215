   package kr.co.mlec.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardFileVO;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.controller.Controller;
import kr.co.mlec.util.SesacFileNamePolicy;

public class BoardWriteController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String saveFolder = "C:\\Users\\ASUS\\OneDrive\\바탕 화면\\Mbti-Web\\WebContent\\upload";
		
		MultipartRequest multi = new MultipartRequest(request, saveFolder, 1024*1024*3, "utf-8", new SesacFileNamePolicy());
		// 요청객체를 파씽해서 알맞게 사용하게해줌, 첨부된 파일을 이 위치에 저장, 파일의 크기는 최대 3메가, 파일을 인코딩함, 다른이름으로 저장되게 만들어질때 규약을만드는것
		
		// 제목, 작성자, 내용 추출
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String content = multi.getParameter("content");
		
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setWriter(writer);
		board.setContent(content);
		
		
		
		// 첨부파일 추출(file_ori_name, file_save_name, file_size) =>tbl_board
		
		List<BoardFileVO> fileList = new ArrayList<>();
		
		
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String fileName = files.nextElement();
			//System.out.println(fileName);
			File file = multi.getFile(fileName); // File: 파일의 크기,수정 날짜 등을 알게해줌
			//System.out.println(fileName + " : " + file);
			
			if(file != null) {
				String fileOriName = multi.getOriginalFileName(fileName);
				String fileSaveName = multi.getFilesystemName(fileName);
				int fileSize = (int)file.length();
				
	
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setFileOriName(fileOriName);
				fileVO.setFileSaveName(fileSaveName);
				fileVO.setFileSize(fileSize);
				
				fileList.add(fileVO);
			}
		}
		
		BoardService service = new BoardService();
		service.insertBoard(board, fileList);
		
		return "redirect:/board/list.do";
	}

}
