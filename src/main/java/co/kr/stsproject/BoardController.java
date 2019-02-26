package co.kr.stsproject;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.dto.BoardDto;//
import model.dto.MemberDto;

@Controller
public class BoardController {
	

	
	//변수선언 앞에 @Autowired 붙이면 자동으로 setter작업이 된다
	@Autowired
	private SqlSession sqlSession;
	
	
	//글쓰기 폼
	@RequestMapping("writeForm.do")
	public String writeForm(Model model, String num, String ref,
			String re_step, String re_level,String pageNum) {
		
	
		if(num==null) {//글쓰기
			num="0"; ref="1"; re_step="0"; re_level="0";//글번호, 답글그룹, 글순서, 글 깊이
		}
		if(pageNum==null) {pageNum="1";}
		
		model.addAttribute("pageNum", pageNum);//페이지번호
		model.addAttribute("num",new Integer(num));//글번호
		model.addAttribute("ref",new Integer(num));//답글 그룹
		model.addAttribute("re_step",new Integer(re_step));//글 순서
		model.addAttribute("re_level",new Integer(re_level));//글 깊이
		
		return ".main.board.writeForm";//뷰 리턴
	}
	//글쓰기
	@RequestMapping(value="/writePro.do",method=RequestMethod.POST)
	public String writeFormPro(@ModelAttribute("BoardDto")BoardDto boardDto,HttpServletRequest request)
			throws NamingException,IOException{
		//System.out.println("boardDto.writer :"+boardDto.getWriter());
		int maxNum=0;//최대 글 번호
		
		if(sqlSession.selectOne("board.maxNumber") != null) {//최대 글 번호가 null이 아니면
			maxNum = sqlSession.selectOne("board.maxNumber");
		}
		if(maxNum != 0) {//최대글번호가 0이 아니면
			maxNum=maxNum+1;//최대 글번호 +1로 글 작성
		}else {//최대 글번호가 0이면
			maxNum=1;//글번호 1부터 작성
		}
		String ip=request.getRemoteAddr();//ip구하기
		boardDto.setIp(ip);
		
		if(boardDto.getNum() != 0) {//답변글이면
			sqlSession.update("board.reStep",boardDto);//답글 끼워넣을 위치 확보
			
			boardDto.setRe_step(boardDto.getRe_step()+1);//글순서+1
			boardDto.setRe_level(boardDto.getRe_level()+1);//글 깊이 +1
		}else {//원글
			
			boardDto.setRef(new Integer(maxNum));//글 그룹번호, 현재 글번호를  ref에 넣어준다
			boardDto.setRe_step(new Integer(0));//글 순서 0
			boardDto.setRe_level(new Integer(0));//글 깊이 0
			
		}
		sqlSession.insert("board.insertBoard",boardDto);//
		return "redirect:list.do";
	}
	//리스트
	@RequestMapping("/list.do")
	public String list(Model model, String pageNum) throws NamingException,IOException{
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10;//한 페이지의 글의 개수
		int currentPage = Integer.parseInt(pageNum);//현재 페이지
		int startRow = (currentPage-1)*pageSize+1;//한 페이지의 시작행
		int endRow = currentPage * pageSize;//한 페이지의 마지막행
		int count = 0;
		int pageBlock=10;//블럭당 페이지 수

		count = sqlSession.selectOne("board.selectCount");//글 갯수 얻기
		
		int number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//페이지 수 구하기
		
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow-1);//시작위치
		map.put("cnt",pageSize);//글 갯수
		
		List<BoardDto> list = sqlSession.selectList("board.selectList",map);
		//----------------------
		
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("startRow",startRow);
		model.addAttribute("endRow",endRow);
		model.addAttribute("pageBlock",pageBlock);
		
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("number",number);
		model.addAttribute("list",list);//리스트에 넣기
		
		return ".main.board.list";//뷰 리턴 list.jsp
	}
	
	//글내용보기
	@RequestMapping("content.do")
	public String content(Model model,String num,String pageNum)
			throws NamingException,IOException{
		int num1=Integer.parseInt(num);//String 이기 때문에 변환해 주어야 한다
		sqlSession.update("board.readCount",num1);//조회수
		BoardDto boardDto = sqlSession.selectOne("board.contentBoard",num1);
		
		String content=boardDto.getContent();
		content=content.replace("\n","<br>");
		model.addAttribute("content",content);
		
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("boardDto",boardDto);
		return ".main.board.content";//content.jsp 뷰
	}
	
	//글수정 폼
	@RequestMapping("updateForm.do")
	public ModelAndView updateForm(String num,String pageNum)throws NamingException,IOException{
		
		int num1=Integer.parseInt(num);
		BoardDto boardDto = sqlSession.selectOne("board.contentBoard",num1);
		ModelAndView model = new ModelAndView();
		
		model.addObject("pageNum",pageNum);
		model.addObject("boardDto",boardDto);
		model.setViewName(".main.board.updateForm");//updateForm.jsp
		return model;
	}
	
	//글수정 DB
	@RequestMapping(value="updatePro.do",method=RequestMethod.POST)
	public ModelAndView updatePro(BoardDto boardDto, String pageNum) throws NamingException, IOException{
		
		sqlSession.update("board.updateBoardPro",boardDto);
		ModelAndView mv = new ModelAndView();
		
		//System.out.println("pageNum:"+pageNum);
		mv.addObject("pageNum",pageNum);
		mv.setViewName("redirect:list.do");//뷰 리턴);//response.sendRedirect("list.jsp")
		return mv;
	}
	
	//글삭제
	@RequestMapping("delete.do")
	public String delete(Model model,String num,String pageNum) {
		
		sqlSession.delete("board.deleteBoard",num);
		model.addAttribute("pageNum",pageNum);
		return "redirect:list.do";//뷰 리턴
	}
	
}//class end
