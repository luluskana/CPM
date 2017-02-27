<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<spring:url value="/" var="home" />
<%@page session="true"%>
<div class="container">
    <div class="row">
        <div class="col-sm-12 well" align="center">
            <h4><label>History</label></h4>
            <table id="historyList" class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>MCP NO</th>
                    <th>Part No</th>
                    <th>Material</th>
                    <th>Batch</th>
                    <th>Date</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>#</th>
                    <th>MCP NO</th>
                    <th>Part No</th>
                    <th>Material</th>
                    <th>Batch</th>
                    <th>Date</th>
                </tr>
                </tfoot>
                <tbody>
                <c:forEach var="history" items="${historys}" varStatus="loop">
                    <tr>
                        <td>${loop.index + 1}</td>
                        <td>${history.mcpNumber}</td>
                        <td>${history.partNumber}</td>
                        <td>${history.materialMaster}</td>
                        <td>${history.batch}</td>
                        <td><fmt:formatDate pattern="dd/MM/yyyy [hh:mm]"  value="${history.createDate}" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#historyList').DataTable();
    } );
</script>