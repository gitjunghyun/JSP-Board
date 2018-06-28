package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LogonDBBean { // static을 사용해 객체를 생성하면 객체 간의 전역 객체가 됨 //따라서, 이 객체는 단
							// 한번만 생성되고 객체들 간에 공유
	private static LogonDBBean instance = new LogonDBBean();

	public static LogonDBBean getInstance() {
		return instance;
	}

	private LogonDBBean() {
	}

	// 커넥션 풀에서 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}

	// user로그인 . 사용자 인증 페이지
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try

		{
			conn = getConnection();
			String orgPass = passwd;
			pstmt = conn.prepareStatement("select mem_pwd from member where mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {// 해당 아이디가 있으면 수행
				String dbpasswd = rs.getString("mem_pwd");
				if (dbpasswd.equals(orgPass))
					x = 1; // 인증성공
				else
					x = 0; // 비밀번호 틀림
			} else// 해당 아이디 없으면 수행
				x = -1;// 아이디 없음
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// 아이디 중복 확인 (confirmId.jsp)에서 아이디의 중복 여부를 확인하는 메소드
	public int confirmId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select mem_id from member where mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())// 아이디 존재
				x = 1; // 같은 아이디 있음
			else
				x = -1;// 같은 아이디 없음
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// 회원 가입 처리(registerPro.jsp)에서 사용하는 새 레코드 추가 메소드
	public int insertMember(LogonDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 1;
		try {
			conn = getConnection();
			int test = instance.confirmId(member.getId());
			if (test == 1) {
				flag = 0;
			} else {
				pstmt = conn.prepareStatement("insert into member values (null,?,?,?,?,?,?)");
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPasswd());
				pstmt.setTimestamp(3, member.getReg_date());
				pstmt.setString(4, member.getName());
				pstmt.setString(5, member.getGroup());
				pstmt.setString(6, member.getEmail());
				if (pstmt.executeUpdate() == 1)
					flag = -1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return flag;
	}

	public LogonDataBean getMember(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;
		try {
			conn = getConnection();
			String orgPass = passwd;
			pstmt = conn.prepareStatement("select * from member where mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 해당 아이디에 대한 레코드가 존재
				String dbpasswd = rs.getString("mem_pwd");
				// 사용자가 입력한 비밀번호와 테이블의 비밀번호가 같으면 수행
				if (dbpasswd.equals(orgPass)) {
					member = new LogonDataBean();
					member.setId(rs.getString("mem_id"));
					member.setName(rs.getString("mem_name"));
					member.setReg_date(rs.getTimestamp("reg_date"));
					member.setGroup(rs.getString("mem_group"));
					member.setEmail(rs.getString("email"));
				}
			}
		} catch (

		Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return member;// 데이터 저장빈 객체 member 리턴
	}

	// 회원 정보 수정 처리(modifyPro.jsp)에서 회원 정보 수정을 처리하는 메소드
	public int updateMember(LogonDataBean member) {
		Connection conn = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = getConnection();
			String orgPass = member.getPasswd();
			pstmt = conn.prepareStatement("select mem_pwd from member where mem_id = ?");
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {// 해당 아이디가 있으면 수행
				String dbpasswd = rs.getString("mem_pwd");
				pstmt = conn.prepareStatement("update member set mem_name=?,mem_pwd=?,mem_group=?,email=? " + "where mem_id=?");
				pstmt.setString(1, member.getName());
				pstmt.setString(2, orgPass);
				pstmt.setString(3, member.getGroup());
				pstmt.setString(4, member.getEmail());
				pstmt.setString(5, member.getId());
				pstmt.executeUpdate();
				x = 1;// 회원정보 수정
				// 처리 성공
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// 회원 탈퇴 처리(deletePro.jsp)에서 회원 정보를 삭제하는 메소드
	public int deleteMember(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = getConnection();
			String orgPass = passwd;
			pstmt = conn.prepareStatement("select mem_pwd from member where mem_id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbpasswd = rs.getString("mem_pwd");
				if (dbpasswd.equals(orgPass)) {
					pstmt = conn.prepareStatement("delete from member where mem_id=?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					x = 1;// 회원탈퇴처리 성공
				} else
					x = 0;// 회원탈퇴 처리 실패
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}
}
