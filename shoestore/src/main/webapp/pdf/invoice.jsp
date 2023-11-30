<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Invoice PDF</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Invoice</h1>
    <table>
        <tr>
            <th>Item</th>
            <th>Description</th>
            <th>Price</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Product A</td>
            <td>$100.00</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Product B</td>
            <td>$50.00</td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right;">Total:</td>
            <td>$150.00</td>
        </tr>
    </table>
</body>
</html>
