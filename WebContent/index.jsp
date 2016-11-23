<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ws.DepSearchWebServiceInterface" %>
<%@ page import="ws.DepSearchWebServiceImplService" %>

<%
    request.setCharacterEncoding("UTF-8");

    DepSearchWebServiceImplService depSearchWebServiceImplService = new DepSearchWebServiceImplService();
    DepSearchWebServiceInterface depSearchWebServiceInterface = depSearchWebServiceImplService.getDepSearchWebServiceImplPort();
    int count = depSearchWebServiceInterface.count("xxx");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title></title>
</head>
<body>
<form action="index.jsp" method="POST">
    child Lemma: <input type="text" name="childlemma">
    child POS: <input type="text" name="childpos">
    dep rel: <input type="text" name="dep" value="NE">
    parent Lemma: <input type="text" name="parentlemma">
    parent POS: <input type="text" name="parentpos">
    <input type="submit" value="SEARCH">

    <%
        String childlemma = request.getParameter("childlemma") == null ? "" : request.getParameter("childlemma");
        String childpos = request.getParameter("childpos") == null ? "" : request.getParameter("childpos");
        String depQuery = request.getParameter("dep") == null ? "" : request.getParameter("dep");
        String parentlemma = request.getParameter("parentlemma") == null ? "" : request.getParameter("parentlemma");
        String parentpos = request.getParameter("parentpos") == null ? "" : request.getParameter("parentpos");

        String parsed = depSearchWebServiceInterface.searchMultiple(childlemma, childpos, depQuery, parentlemma, parentpos);

    %>

</form>
    <pre>
<%=
count
%>
        <br />
<%=
parsed
%>
    </pre>
</body>
</html>
