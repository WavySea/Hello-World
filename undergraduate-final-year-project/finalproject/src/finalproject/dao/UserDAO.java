package finalproject.dao;

import finalproject.vo.User;

public interface UserDAO {
	public int queryByAdminname(User user) throws Exception;
}
