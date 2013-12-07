<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<html>
<head>
	<title>article : ${article.id}</title>
</head>
<body>
<h1>
	This is the CMS view article page  
</h1>

<%@ include file="menu.jsp" %> 

<P> article : </P>

    <p>
      <div id="newClient">      	
		    <table>
		        <tr>
		        	<td>article ID: <c:out value="${article.id}" /></td>
		        	<!-- <td><button type="button" onclick="remove('${article.id}')">Remove</button></td>  -->
		        </tr>
		        <tr>
		        	 <td><c:out value="${article.headline}" /></td>
		        </tr>
		        <tr>
		            <td><textarea rows="8" cols="50"  readonly>${article.previewText}</textarea></td>
		        </tr>
		        <tr>
		            <td><textarea rows="24" cols="50"  readonly>${article.fullText}</textarea>
		            </td>
		        </tr>		        
		       
		    </table>              
        </div>
       </p>

	<form:form name="articleForm" modelAttribute="articleID" method="POST"
	   action="/publisher/removeArticle">
		<input type="HIDDEN" NAME="articleID">		
	</form:form>

    <script>
       
        function remove(id)
        {
            document.articleForm.articleID.value = id;
            articleForm.submit();
        }; 
        
    </script>


</body>
</html>
