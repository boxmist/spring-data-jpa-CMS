<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>CMS page to create a new article </title>
</head>
<body>
<h1>
	This is the CMS page to create a new article  
</h1>

<%@ include file="menu.jsp" %> 

<p> Submit a new article: </p>
<form:form modelAttribute="articleModel" method="POST"
   action="/publisher/addArticle">
    <table>
        <tr>
            <td><form:label path="headline">Headline</form:label></td>
            <td><form:input path="headline" /></td>
        </tr>
        <tr>           
            <td><form:label path="previewText">Preview Text</form:label></td>
            <td><form:textarea maxlength="200" rows="8" cols="50" path="previewText" /></td>    
        </tr>
        <tr>               
            <td><form:label path="fullText">Full Text</form:label></td>
            <td><form:textarea maxlength="4000" rows="24" cols="50" path="fullText" /></td>       
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Submit" /></td>
        </tr>
    </table>
</form:form>

</body>
</html>
