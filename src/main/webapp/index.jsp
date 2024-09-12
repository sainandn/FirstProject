<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing System</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f9;
        }
        h1 {
            font-size: 2.5rem;
            color: #333;
        }
        .container {
            width: 90%;
            max-width: 700px;
            margin: 0 auto;
            text-align: center;
            padding-top: 50px;
        }
        p {
            font-size: 1.2rem;
            color: #666;
        }
        .btn {
            display: inline-block;
            padding: 15px 25px;
            margin: 20px 10px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .btn:focus {
            outline: none;
        }
        @media (max-width: 600px) {
            h1 {
                font-size: 2rem;
            }
            .btn {
                padding: 12px 20px;
                margin: 15px 5px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Billing System</h1>
        <p>Manage your items with ease</p>
        
        <a href="viewitems" class="btn">View Items</a>
        <a href="itemform" class="btn">Add New Item</a>
    </div>
</body>
</html>
