<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Item</title>
    <style>
        /* Similar styles as itemform.jsp */
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Item</h2>
        <form:form method="post" action="updateitem" modelAttribute="command">
            <table>
                <tr>
                    <td>Item Number:</td>
                    <td><form:input path="itemNumber" readonly="true"/></td>
                </tr>
                <tr>
                    <td>Item Name:</td>
                    <td><form:input path="itemName" /></td>
                </tr>
                <tr>
                    <td>Item Cost:</td>
                    <td><form:input path="itemCost" /></td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Update Item" />
                    </td>
                </tr>
            </table>
        </form:form>

        <a href="${pageContext.request.contextPath}/viewitems">Back to Item List</a>
    </div>
</body>
</html>
