<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Items</title>

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
            margin-top: 20px;
            font-size: 2rem;
        }
        .container {
            width: 90%;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        td {
            background-color: #f9f9f9;
        }
        tr:nth-child(even) td {
            background-color: #f1f1f1;
        }
        input[type="checkbox"] {
            transform: scale(1.2);
        }
        .btn-edit {
            display: inline-block;
            padding: 6px 12px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn-edit:hover {
            background-color: #0056b3;
        }
        .total-cost {
            font-size: 1.5rem;
            font-weight: 600;
            text-align: right;
            margin-top: 10px;
        }
        .btn {
            display: inline-block;
            padding: 12px 20px;
            margin-top: 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #218838;
        }
        .btn-delete {
            background-color: #dc3545;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: 600;
            margin-top: 20px;
            display: inline-block;
        }
        a:hover {
            color: #0056b3;
        }
        @media (max-width: 768px) {
            h2 {
                font-size: 1.8rem;
            }
            th, td {
                padding: 10px;
            }
            .btn, .btn-delete {
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Item List</h2>

        <form action="${pageContext.request.contextPath}/deleteItems" method="post">
            <table>
                <tr>
                    <th>Select</th>
                    <th>Date</th>
                    <th>Item Number</th>
                    <th>Item Name</th>
                    <th>Item Cost</th>
                    <th>Edit</th>
                </tr>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td><input type="checkbox" name="itemNumbers" value="${item.itemNumber}" /></td>
                        <td>${item.date}</td>
                        <td>${item.itemNumber}</td>
                        <td>${item.itemName}</td>
                        <td>${item.itemCost}</td>
                        <td><a href="${pageContext.request.contextPath}/editItem/${item.itemNumber}" class="btn-edit">Edit</a></td>
                    </tr>
                </c:forEach>
            </table>

            <div class="total-cost">
                Total Cost: ${totalCost}
            </div>

            <input type="submit" value="Delete Selected Items" class="btn btn-delete" />
        </form>

        <a href="${pageContext.request.contextPath}/itemform" class="btn">Add New Item</a>
    </div>

</body>
</html>
