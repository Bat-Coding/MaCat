package com.macat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.macat.dto.AdminDTO;
import com.macat.dto.AdminSearchDTO;
import com.macat.dto.NotsDTO;

@Repository("adminNoticeManagementDAO")
public class AdminNoticeManagementDAO implements AdminPostManagementDAO {
	
	private SqlSessionTemplate sqlSessionTemplate;
	public SqlSessionTemplate getSqlSessionTemplate() { return sqlSessionTemplate; }
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) { this.sqlSessionTemplate = sqlSessionTemplate; }

	@Override
	public int getAdminCount() {
		return sqlSessionTemplate.selectOne("nots_count");
	}

	@Override
	public List<NotsDTO> getAdminList(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("notices", map);
	}

	@Override
	public int getAndCount(AdminSearchDTO adminSearchDTO) {
		return sqlSessionTemplate.selectOne("nots_and_count", adminSearchDTO);
	}
	
	
	@Override
	public int getOrCount(AdminSearchDTO adminSearchDTO) {
		return sqlSessionTemplate.selectOne("nots_or_count", adminSearchDTO);
	}

	@Override
	public List<NotsDTO> getAndSearch(AdminSearchDTO adminSearchDTO) {
		return sqlSessionTemplate.selectList("nots_and_search", adminSearchDTO);
	}

	@Override
	public List<NotsDTO> getOrSearch(AdminSearchDTO adminSearchDTO) {
		return sqlSessionTemplate.selectList("nots_or_search", adminSearchDTO);
	}
	
	@Override
	public int deleteAdmin(String not_sq) {
		return sqlSessionTemplate.delete("nots_delete", not_sq);
	}
	
	@Override
	public AdminDTO getPostView(String sq) {
		return null;
	}
	
	public NotsDTO getNotice(String not_sq) {
		return sqlSessionTemplate.selectOne("nots", not_sq);
	}
}
