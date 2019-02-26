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
	

	
	//�������� �տ� @Autowired ���̸� �ڵ����� setter�۾��� �ȴ�
	@Autowired
	private SqlSession sqlSession;
	
	
	//�۾��� ��
	@RequestMapping("writeForm.do")
	public String writeForm(Model model, String num, String ref,
			String re_step, String re_level,String pageNum) {
		
	
		if(num==null) {//�۾���
			num="0"; ref="1"; re_step="0"; re_level="0";//�۹�ȣ, ��۱׷�, �ۼ���, �� ����
		}
		if(pageNum==null) {pageNum="1";}
		
		model.addAttribute("pageNum", pageNum);//��������ȣ
		model.addAttribute("num",new Integer(num));//�۹�ȣ
		model.addAttribute("ref",new Integer(num));//��� �׷�
		model.addAttribute("re_step",new Integer(re_step));//�� ����
		model.addAttribute("re_level",new Integer(re_level));//�� ����
		
		return ".main.board.writeForm";//�� ����
	}
	//�۾���
	@RequestMapping(value="/writePro.do",method=RequestMethod.POST)
	public String writeFormPro(@ModelAttribute("BoardDto")BoardDto boardDto,HttpServletRequest request)
			throws NamingException,IOException{
		//System.out.println("boardDto.writer :"+boardDto.getWriter());
		int maxNum=0;//�ִ� �� ��ȣ
		
		if(sqlSession.selectOne("board.maxNumber") != null) {//�ִ� �� ��ȣ�� null�� �ƴϸ�
			maxNum = sqlSession.selectOne("board.maxNumber");
		}
		if(maxNum != 0) {//�ִ�۹�ȣ�� 0�� �ƴϸ�
			maxNum=maxNum+1;//�ִ� �۹�ȣ +1�� �� �ۼ�
		}else {//�ִ� �۹�ȣ�� 0�̸�
			maxNum=1;//�۹�ȣ 1���� �ۼ�
		}
		String ip=request.getRemoteAddr();//ip���ϱ�
		boardDto.setIp(ip);
		
		if(boardDto.getNum() != 0) {//�亯���̸�
			sqlSession.update("board.reStep",boardDto);//��� �������� ��ġ Ȯ��
			
			boardDto.setRe_step(boardDto.getRe_step()+1);//�ۼ���+1
			boardDto.setRe_level(boardDto.getRe_level()+1);//�� ���� +1
		}else {//����
			
			boardDto.setRef(new Integer(maxNum));//�� �׷��ȣ, ���� �۹�ȣ��  ref�� �־��ش�
			boardDto.setRe_step(new Integer(0));//�� ���� 0
			boardDto.setRe_level(new Integer(0));//�� ���� 0
			
		}
		sqlSession.insert("board.insertBoard",boardDto);//
		return "redirect:list.do";
	}
	//����Ʈ
	@RequestMapping("/list.do")
	public String list(Model model, String pageNum) throws NamingException,IOException{
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10;//�� �������� ���� ����
		int currentPage = Integer.parseInt(pageNum);//���� ������
		int startRow = (currentPage-1)*pageSize+1;//�� �������� ������
		int endRow = currentPage * pageSize;//�� �������� ��������
		int count = 0;
		int pageBlock=10;//���� ������ ��

		count = sqlSession.selectOne("board.selectCount");//�� ���� ���
		
		int number=count-(currentPage-1)*pageSize;//�۸�Ͽ� ǥ���� �۹�ȣ
		int pageCount=count/pageSize+(count%pageSize==0?0:1);//������ �� ���ϱ�
		
		HashMap<String,Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow-1);//������ġ
		map.put("cnt",pageSize);//�� ����
		
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
		model.addAttribute("list",list);//����Ʈ�� �ֱ�
		
		return ".main.board.list";//�� ���� list.jsp
	}
	
	//�۳��뺸��
	@RequestMapping("content.do")
	public String content(Model model,String num,String pageNum)
			throws NamingException,IOException{
		int num1=Integer.parseInt(num);//String �̱� ������ ��ȯ�� �־�� �Ѵ�
		sqlSession.update("board.readCount",num1);//��ȸ��
		BoardDto boardDto = sqlSession.selectOne("board.contentBoard",num1);
		
		String content=boardDto.getContent();
		content=content.replace("\n","<br>");
		model.addAttribute("content",content);
		
		model.addAttribute("num",num);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("boardDto",boardDto);
		return ".main.board.content";//content.jsp ��
	}
	
	//�ۼ��� ��
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
	
	//�ۼ��� DB
	@RequestMapping(value="updatePro.do",method=RequestMethod.POST)
	public ModelAndView updatePro(BoardDto boardDto, String pageNum) throws NamingException, IOException{
		
		sqlSession.update("board.updateBoardPro",boardDto);
		ModelAndView mv = new ModelAndView();
		
		//System.out.println("pageNum:"+pageNum);
		mv.addObject("pageNum",pageNum);
		mv.setViewName("redirect:list.do");//�� ����);//response.sendRedirect("list.jsp")
		return mv;
	}
	
	//�ۻ���
	@RequestMapping("delete.do")
	public String delete(Model model,String num,String pageNum) {
		
		sqlSession.delete("board.deleteBoard",num);
		model.addAttribute("pageNum",pageNum);
		return "redirect:list.do";//�� ����
	}
	
}//class end
