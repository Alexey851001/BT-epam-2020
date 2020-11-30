package dao;

import entity.QuestionEntity;
import entity.TestEntity;

import java.sql.*;
import java.util.LinkedList;

public class TestDao implements Dao<TestEntity>{
    @Override
    public void add(TestEntity testEntity) throws DaoException {
        ConnectionPool pool = null;
        Connection connection = null;
        try {
            pool = ConnectionPool.getConnectionPool();
            connection = pool.getConnection();

            String sql = "INSERT INTO tests (name, teacher_id) VALUES (?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, testEntity.getName());
            statement.setInt(2, testEntity.getTeacherId());
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            generatedKeys.next();
            testEntity.setId(generatedKeys.getInt(1));

            sql = "INSERT INTO questions (task, correct_answer, test_id) VALUES (?, ?, ?)";
            for (QuestionEntity question : testEntity.getQuestions()) {
                statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                statement.setString(1, question.getText());
                statement.setString(2, question.getCorrectAnswer());
                statement.setInt(3, testEntity.getId());
                statement.executeUpdate();

                generatedKeys = statement.getGeneratedKeys();
                generatedKeys.next();
                question.setId(generatedKeys.getInt(1));
            }
        } catch (SQLException | ConnectionException e) {
            throw new DaoException(e);
        } finally {
            if (pool != null)
                pool.returnConnection(connection);
        }
    }

    @Override
    public TestEntity getById(int id) throws DaoException {
        ConnectionPool pool = null;
        Connection connection = null;
        try {
            pool = ConnectionPool.getConnectionPool();
            connection = pool.getConnection();

            String selectTests = "SELECT * FROM tests t, questions q WHERE t.id = ? AND t.id = q.test_id";
            PreparedStatement statement = connection.prepareStatement(selectTests);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            TestEntity testEntity = null;
            LinkedList<QuestionEntity> questions = new LinkedList<QuestionEntity>();
            if (rs.next()) {
                int testId = rs.getInt("t.id");
                String name = rs.getString("t.name");
                int teacherId = rs.getInt("t.teacher_id");

                testEntity = new TestEntity();
                testEntity.setId(testId);
                testEntity.setName(name);
                testEntity.setTeacherId(teacherId);

                do {
                    QuestionEntity question = new QuestionEntity();
                    int questionId = rs.getInt("q.id");
                    String text = rs.getString("q.text");
                    String correctAnswer = rs.getString("q.correct_answer");

                    question.setId(questionId);
                    question.setText(text);
                    question.setCorrectAnswer(correctAnswer);
                    questions.add(question);
                } while (rs.next());

                testEntity.setQuestions(questions);
            }

            return testEntity;
        } catch (SQLException | ConnectionException e) {
            throw new DaoException(e);
        } finally {
            if (pool != null)
                pool.returnConnection(connection);
        }
    }

    @Override
    public void delete(TestEntity testEntity) throws DaoException {
        ConnectionPool pool = null;
        Connection connection = null;
        try {
            pool = ConnectionPool.getConnectionPool();
            connection = pool.getConnection();
            String sql = "DELETE FROM tests WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, testEntity.getId());
            statement.executeUpdate();

            sql = "DELETE questions, answers FROM question INNER JOIN answers WHERE questions.id = answers.question_id AND questions.test_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, testEntity.getId());
            statement.executeUpdate();

            sql = "DELETE FROM complete_tests WHERE test_id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, testEntity.getId());
            statement.executeUpdate();
        } catch (SQLException | ConnectionException e) {
            throw new DaoException(e);
        } finally {
            if (pool != null)
                pool.returnConnection(connection);
        }
    }
}
