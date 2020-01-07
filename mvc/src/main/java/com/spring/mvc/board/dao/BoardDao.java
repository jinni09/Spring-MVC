package com.spring.mvc.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mvc.board.model.Board;
import com.spring.mvc.board.model.BoardFile;
import com.spring.mvc.board.model.BoardReply;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
	
	public List<Board> list(Board board) {
		return session.selectList("board.boardList", board);
	}	

	public int getTotal(Board board) {
		int total = 0;
		try {
			total = session.selectOne("board.boardTotal", board);
		}catch (Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return total;
	}

	public void boardHit(int brd_no) {
		session.update("board.boardHit", brd_no);
	}

	public Board boardSelect(int brd_no) {
		return session.selectOne("board.boardSelect", brd_no);
	}

	public int insertNo() {
		return session.selectOne("board.insertNo");
	}

	public int boardInsert(Board board) {
		int result = 0;
		try {
			result = session.insert("board.boardInsert", board);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int boardUpdate(Board board) {
		int result = 0;
		try {
			result = session.update("board.boardUpdate", board);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int boardDelete(int number) {
		int result = 0;
		int result2 = 0;
		try {
			result = session.delete("file.fileDeleteAll", number);
			if(result > 0) {
				result2 = session.update("board.boardDelete", number);
			}else {
				result2 = session.update("board.boardDelete", number);
			}
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result2;
	}

	public List<BoardReply> selectReply(int brd_no) {
		return session.selectList("reply.selectReply", brd_no);
	}
	
	public int replyNo() {
		return session.selectOne("reply.replyNo");
	}

	public int insertReply(BoardReply boardReply) {
		int result = 0;
		try {
			result = session.insert("reply.insertReply", boardReply);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int replyCount(int brd_no) {
		int total = 0;
		try {
			total = session.selectOne("reply.replyCount", brd_no);
		}catch (Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return total;
	}
	
	public int updateReply(BoardReply boardReply) {
		int result = 0;
		try {
			result = session.update("reply.updateReply", boardReply);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int deleteReply(int crNo) {
		int result = 0;
		try {
			result = session.update("reply.deleteReply", crNo);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result;
	}

	public int fileNo() {
		return session.selectOne("file.fileNo");
	}

	public int fileInsert(BoardFile boardfile) {
		int result2 = 0;
		try {
			result2 = session.insert("file.fileInsert", boardfile);
		}catch(Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return result2;
	}

	public List<BoardFile> selectFile(int brd_no) {
		return session.selectList("file.selectFile", brd_no);
	}

	public int fileCount(int brd_no) {
		int total = 0;
		try {
			total = session.selectOne("file.fileCount", brd_no);
		}catch (Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return total;
	}

	public void fileDelete(BoardFile boardfile) {
		session.delete("file.fileDelete", boardfile);
	}

	public String fileSelect(BoardFile boardfile) {
		String f_stor_name = "";
		try {
			f_stor_name = session.selectOne("file.fileSelect", boardfile);
		}catch (Exception e) {
			logger.info("error Message: ", e.getMessage());
		}
		return f_stor_name;
	}

}
