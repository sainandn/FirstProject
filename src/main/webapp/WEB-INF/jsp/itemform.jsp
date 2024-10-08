<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        /* Your existing CSS styles */
    </style>
</head>
<body>

    <div class="container">
        <h2>Add New Item</h2>
        
        <form:form method="post" action="save">
            <table>
                <tr>
                    <td>Item Number:</td>
                    <td><form:input path="itemNumber" /></td>
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
                        <input type="submit" value="Add Item" />
                    </td>
                </tr>
            </table>
        </form:form>

        <a href="${pageContext.request.contextPath}/viewitems">Back to Item List</a>
    </div>

</body>
</html>
