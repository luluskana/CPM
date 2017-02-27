package com.cpm.service;

import com.cpm.dao.HistoryDao;
import com.cpm.domain.History;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.Date;
import java.util.List;

@Service
public class HistoryService {

    @Autowired
    private HistoryDao historyDao;

    public String create(String codeMaster,String codeCompare, String partNumber, String batch) {
        History history = new History();
        history.setCreateDate(new Date());
        history.setMaterialMaster(codeMaster);
        history.setMaterialCompare(codeCompare);
        history.setPartNumber(partNumber);
        history.setBatch(batch);
        historyDao.create(history);
        history.setMcpNumber("RM" + String.format("%06d", history.getId()));
        historyDao.update(history);
        return history.getMcpNumber();
    }

    public List<History> findAll() {
        return historyDao.findAll();
    }
}
