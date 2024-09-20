<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Item</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }
        h2 {
            text-align: center;
            margin-top: 30px;
            font-size: 2rem;
        }
        .container {
            width: 90%;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        form {
            background-color: #fff;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        table {
            width: 100%;
        }
        td {
            padding: 12px;
            font-size: 1rem;
        }
        form:input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }
        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            display: inline-block;
            text-decoration: none;
            color: #007BFF;
            font-weight: 600;
            margin-top: 20px;
            text-align: center;
            width: 100%;
        }
        a:hover {
            color: #0056b3;
        }
        @media (max-width: 600px) {
            h2 {
                font-size: 1.8rem;
            }
            td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Edit Item</h2>

        <form:form method="post" action="${pageContext.request.contextPath}/updateItem">
            <table>
                <tr>
                    <td>Item Number:</td>
                    <td><form:input path="itemNumber" readonly="true"/></td>
                </tr>
                <tr>
                    <td>Date:</td>
                    <td><form:input path="date" readonly="true" /></td>
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
