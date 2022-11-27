package cocktail.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import cocktail.dbcp.DBConnectionMgr;

import javax.servlet.http.HttpServletRequest;


public class BoardMgr {
	private DBConnectionMgr pool;
	private static final String ENCTYPE = "UTF-8";
	
	public BoardMgr( ) {
		try { pool = DBConnectionMgr.getInstance( );
		}catch(Exception e) { e.printStackTrace( ); }
	}
	
	public Vector<BoardBean> getBoardList(String keyField, String keyWord, int offset, int postingListSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist = new Vector<BoardBean>( );
		
		try {
			con = pool.getConnection( ); 
			if (keyWord.equals("null") || keyWord.equals("")) { 
				sql = "select * FROM booking order by no desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, offset);
				pstmt.setInt(2, postingListSize);
			} else { 
				sql = "select * FROM booking where " + keyField + " like ? ";
				sql += "order by no desc limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%"); 
				pstmt.setInt(2, offset); // 0부터 시작
				pstmt.setInt(3, postingListSize);
			}
			rs = pstmt.executeQuery( );
			
			while (rs.next( )) {
				BoardBean bean = new BoardBean( );
				bean.setNo(rs.getInt("no"));
				bean.setEvent_type(rs.getString("event_type"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setParticipant(rs.getInt("participant"));
				bean.setVisit_date(rs.getString("visit_date"));
				bean.setState(rs.getString("state"));
				vlist.add(bean);
			}
		} catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		return vlist; 
	}
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		
		try {
			con = pool.getConnection( );
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(*) from booking";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(*) from booking where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery( );
			if (rs.next( )) { totalCount = rs.getInt(1); }
		} catch (Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		return totalCount; 
	}

	//int ref로 게시글 번호를 별도로 관리했으나 기본키 id를 기준으로 관리하도록 변경
	//게시글 번호의 연속성을 위해 ref 필드로 게시글 번호를 별도로 관리 했었음
	public Integer insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Integer rowCnt = null;
		
		try {
			con = pool.getConnection( );

			sql = "insert into booking(event_type,name,tel,participant,visit_date,pwd)";
			sql += "values(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("event_type"));
			pstmt.setString(2, req.getParameter("name"));
			pstmt.setString(3, req.getParameter("tel"));
			pstmt.setInt(4, Integer.parseInt(req.getParameter("participant")));
			pstmt.setString(5, req.getParameter("visit_date"));
			pstmt.setString(6, req.getParameter("pwd"));
			rowCnt = pstmt.executeUpdate( );
			return rowCnt;
		}
		catch(Exception e) { e.printStackTrace( ); return rowCnt;}
		finally { pool.freeConnection(con, pstmt, rs); }
	}
	
	public MemberBean getAdminPwd() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MemberBean memberBean = new MemberBean();
		
		try {
			con = pool.getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "admin");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				memberBean.setPwd(rs.getString("pwd"));
			}
		} catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }

		return memberBean;
	}

	public BoardBean getBoard(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardBean bean = new BoardBean( );
		
		try {
			con = pool.getConnection( );
			sql = "select * from booking where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery( );
			if (rs.next( )) {
				bean.setNo(rs.getInt("no"));
				bean.setEvent_type(rs.getString("event_type"));
				bean.setName(rs.getString("name"));
				bean.setTel(rs.getString("tel"));
				bean.setParticipant(rs.getInt("participant"));
				bean.setVisit_date(rs.getString("visit_date"));
				bean.setState(rs.getString("state"));
				bean.setPwd(rs.getString("pwd"));
			}
		} 
		catch(Exception e) { e.printStackTrace( ); }
		finally { pool.freeConnection(con, pstmt, rs); }
		return bean;
	}

	public int deleteBoard(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		int rowCnt = 0;
		
		try {
			con = pool.getConnection( );
			sql = "delete from booking where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			return rowCnt = pstmt.executeUpdate( );
		} catch (Exception e) {
			e.printStackTrace( );
			return rowCnt;
		} finally { pool.freeConnection(con, pstmt, rs); }
	}

	
	public void updateBoard(BoardBean boardBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			con = pool.getConnection( );
			sql = "update booking set event_type=?,name=?,tel=?,participant=?,visit_date=?, state=? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardBean.getEvent_type( ));
			pstmt.setString(2, boardBean.getName( ));
			pstmt.setString(3, boardBean.getTel( ));
			pstmt.setInt(4, boardBean.getParticipant( ));
			pstmt.setString(5, boardBean.getVisit_date( ));
			pstmt.setString(6, boardBean.getState( ));
			pstmt.setInt(7, boardBean.getNo( ));
			pstmt.executeUpdate( );
		} catch(Exception e) { e.printStackTrace( );
		} finally { pool.freeConnection(con, pstmt);
		}
	}
	
	public void updateState(BoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			sql = "update booking set state=? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getState( ));
			pstmt.setInt(2, bean.getNo( ));
			pstmt.executeUpdate( );
		} catch(Exception e) { e.printStackTrace( );
		} finally { pool.freeConnection(con, pstmt);
		}
	}
	
	public void postSample( ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			con = pool.getConnection( );
			for (int i = 0; i < 100; i++) {
			sql = "insert into booking(event_type,name,tel,participant,visit_date,pwd) ";
			sql += "values('칵테일 클래스','마로니에" +i+"',";
			sql += "'010-1234-5678','4','2022-11-02','1234')";
			pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();
			}
		}
		catch (Exception e) { e.printStackTrace(); }
		finally { pool.freeConnection(con, pstmt); }
	}
	
	
	public static void main(String[] args) {
		new BoardMgr( ).postSample();
		System.out.println("SUCCESS");
	}

}
