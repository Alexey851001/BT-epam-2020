package dao;

import entity.UserEntity;

import java.sql.*;

public class UserDao implements Dao<UserEntity> {

    @Override
    public void add(UserEntity userEntity) throws DaoException {
        ConnectionPool pool = null;
        Connection connection = null;
        try {
            pool = ConnectionPool.getConnectionPool();
            connection = pool.getConnection();

            String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, userEntity.getName());
            statement.setString(2, userEntity.getEmail());
            statement.setString(3, userEntity.getPassword());
            statement.setString(4, String.valueOf(userEntity.getRole()));
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            generatedKeys.next();
            userEntity.setId(generatedKeys.getInt(1));
        } catch (SQLException | ConnectionException e) {
            throw new DaoException(e);
        }finally {
            if (pool != null)
                pool.returnConnection(connection);
        }
    }

    @Override
    public UserEntity getById(int id) throws DaoException {
        return null;
    }

    @Override
    public void delete(UserEntity userEntity) throws DaoException {

    }
}
