package bitcamp.pms.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import bitcamp.pms.domain.Member;

public class MemberDao {

    SqlSessionFactory sqlsesionFactory;

    public MemberDao(SqlSessionFactory sqlsesionFactory) {
        this.sqlsesionFactory = sqlsesionFactory;
    }

    public List<Member> selectList(Map<String,Object>params) throws Exception {
        try (SqlSession sqlSession = sqlsesionFactory.openSession()) {
            return sqlSession.selectList("member.selectList",params);
        }
    }

    public Member selectOne(String id) throws Exception {
        try (SqlSession sqlSession = sqlsesionFactory.openSession()) {
            return sqlSession.selectOne("member.selectOne", id);
        }
    }

    public int update(Member member) throws Exception {
        try (SqlSession sqlSession = sqlsesionFactory.openSession()) {
           int count = sqlSession.update("member.update", member);
           sqlSession.commit();
           return count;
        }
    }

    public int delete(String id) throws Exception {
        try (SqlSession sqlSession = sqlsesionFactory.openSession()) {
            int count = sqlSession.delete("member.delete", id);
            sqlSession.commit();
            return count;
        }

    }

    public int insert(Member member) throws Exception {
        try (SqlSession sqlSession = sqlsesionFactory.openSession()) {
            int count = sqlSession.insert("member.insert", member);
            sqlSession.commit();
            return count;
        }

    }
}
