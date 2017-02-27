package com.cpm.dao;

import com.cpm.domain.History;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.math.BigInteger;
import java.util.List;

@Repository
@Transactional
public class HistoryDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void create(History history) {
        Session session = (Session) entityManager.getDelegate();
        String sqlSelect = "SELECT ID FROM History ORDER BY ID DESC FETCH FIRST 1 ROWS ONLY";
        List lists = session.createSQLQuery(sqlSelect).list();
        if(lists.size() <= 0) {
            history.setId(1L);
        } else {
            Long id = ((BigInteger)lists.get(0)).longValue() + 1;
            history.setId(id);
        }
        entityManager.persist(history);
    }

    public void update(History history) {
        entityManager.merge(history);
        entityManager.flush();
    }

    public List<History> findAll() {
        Criteria c = ((Session) entityManager.getDelegate()).createCriteria(History.class);
        return c.list();
    }

}
