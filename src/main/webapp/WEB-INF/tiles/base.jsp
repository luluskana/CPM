<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Foamtec</title>
    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCss" />
    <spring:url value="/resources/css/jquery.dataTables.min.css" var="dataTablesCss" />
    <spring:url value="/resources/css/custom.css" var="customCss" />
    <link href="${bootstrapCss}" rel="stylesheet" />
    <link href="${dataTablesCss}" rel="stylesheet" />
    <link href="${customCss}" rel="stylesheet" />
    <spring:url value="/resources/js/jquery.min.js" var="jqueryJs" />
    <spring:url value="/resources/js/jquery.dataTables.min.js" var="dataTablesJs" />
    <spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJs" />
    <script src="${jqueryJs}"></script>
    <script src="${dataTablesJs}"></script>
    <script src="${bootstrapJs}"></script>

</head>
<body>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="body"/>
<tiles:insertAttribute name="footer"/>
</body>
</html>