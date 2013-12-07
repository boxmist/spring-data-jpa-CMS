<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>CMS article list page</title>
</head>
<body>
<h1>
	This is the CMS article list page  
</h1>

<%@ include file="menu.jsp" %> 

<p> Full list of articles : </p>

    <c:forEach items="${articles}" var="article">

      <div id="newClient">      	
		    <table>
		        <tr>
		        	<td>article ID: <a href="/publisher/viewArticle?articleID=${article.id}"><c:out value="${article.id}" /></a></td>	        	
		        </tr>
		        <tr>
		        	 <td>
		        	 	headline: <a href="/publisher/viewArticle?articleID=${article.id}"><c:out value="${article.headline}" /></a>
		        	 </td>       	 	        	 
		        </tr>
		        <tr>
		            <td>preview text: <c:out value="${article.previewText}" /></td>
		        </tr>
		        <tr>
		        	<td><button type="button" onclick="remove('${article.id}')">Remove</button></td>  
		        	<td>		        	 
		        	 	<a href="/publisher/viewArticle/${article.id}">View as JSON</a>		        	 
		        	</td>	
		        </tr>	
		        <tr>
		        	<td>------</td>	        	
		        </tr>
		        <tr>
		        	<td>------</td>	        	
		        </tr>		        		        
		        			      	       
		    </table>              
        </div>
  
    </c:forEach>

	<form:form name="removeArticleForm" modelAttribute="articleID" method="POST"
	   action="/publisher/removeArticle">
		<input type="HIDDEN" NAME="articleID">		
	</form:form>	

	<form:form name="viewArticleForm" modelAttribute="articleID" method="GET"
	   action="/publisher/viewArticle">
		<input type="HIDDEN" NAME="articleID">		
	</form:form>	

    <script>
    
    function view(id)
    {
        document.viewArticleForm.articleID.value = id;
        viewArticleForm.submit();
    };  
           
    function remove(id)
    {
        document.removeArticleForm.articleID.value = id;
        removeArticleForm.submit();
    }; 
        
    </script>


</body>
</html>
