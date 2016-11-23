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

    <style>
        body {
            background: url("./desing/bg.jpg") no-repeat fixed;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            color: whitesmoke;
        }

        pre {
            color: whitesmoke;
        }

        label{
            font-family: Arial, Helvetica, sans-serif;
            color: whitesmoke;
        }

        .form_grey{
            background-color: #5a6473;
            padding: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="form_grey">
    <form action="index.jsp" method="POST">
        <label for="childlemma">child Lemma:</label><input type="text" id="childlemma" name="childlemma">
        <label for="childpos">child POS: </label><input type="text" id="childpos" name="childpos">
        <label for="dep">dep rel: </label><input type="text" id="dep" name="dep" value="NE">
        <label for="parentlemma">parent Lemma: </label><input type="text" id="parentlemma" name="parentlemma">
        <label for="parentpos">parent POS: </label><input type="text" id="parentpos" name="parentpos">
        <input type="submit" value="SEARCH" />
        (<%=count%> relations in database)
    </form>
</div>
    <%
        String childlemma = request.getParameter("childlemma") == null ? "" : request.getParameter("childlemma");
        String childpos = request.getParameter("childpos") == null ? "" : request.getParameter("childpos");
        String depQuery = request.getParameter("dep") == null ? "" : request.getParameter("dep");
        String parentlemma = request.getParameter("parentlemma") == null ? "" : request.getParameter("parentlemma");
        String parentpos = request.getParameter("parentpos") == null ? "" : request.getParameter("parentpos");

        String parsed = depSearchWebServiceInterface.searchMultiple(childlemma, childpos, depQuery, parentlemma, parentpos);
    %>


    <pre>

        <br />
<%=
parsed
%>
    </pre>
</body>
</html>
