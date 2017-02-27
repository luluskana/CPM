package com.cpm.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="History")
public class History implements Serializable {

    @Id
    @Column(name="id")
    private Long id;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss")
    @Column(name="createDate")
    private Date createDate;

    @Column(name="mcpNumber")
    private String mcpNumber;

    @Column(name="materialMaster")
    private String materialMaster;

    @Column(name="materialCompare")
    private String materialCompare;

    @Column(name="batch")
    private String batch;

    @Column(name="partNumber")
    private String partNumber;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getMcpNumber() {
        return mcpNumber;
    }

    public void setMcpNumber(String mcpNumber) {
        this.mcpNumber = mcpNumber;
    }

    public String getMaterialMaster() {
        return materialMaster;
    }

    public void setMaterialMaster(String materialMaster) {
        this.materialMaster = materialMaster;
    }

    public String getMaterialCompare() {
        return materialCompare;
    }

    public void setMaterialCompare(String materialCompare) {
        this.materialCompare = materialCompare;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getPartNumber() {
        return partNumber;
    }

    public void setPartNumber(String partNumber) {
        this.partNumber = partNumber;
    }
}
