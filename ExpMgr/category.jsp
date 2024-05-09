

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Category Expense</title>
   <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> 
  <style>
   
    body {
      font-family: 'Roboto', sans-serif;
      place-items: center;
      background-image: radial-gradient(grey,#c0c0c0,#dbd7d2,#91A3B0,grey);
      background-size: 100% 100%;
      background-position: center;
      display: flex;
      animation: bg-animation 15s infinite alternate;
      overflow-y: hidden;
      padding: 20px;
    }
    
    @keyframes bg-animation {
      0% {
        background-size: 100% 100%; 
      }
      50% {
        background-size: 150% 150%;
      }
      100% {
        background-size: 100% 100%;
      }
    }
    
    .container {
      margin-top:70px;
      background-color:azure;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
    }
    .total {
      font-weight: bold;
    } 
    .title
    {
      padding:11px;
       font-size: 35px;
       font-weight: 600;
       text-align: center;
       line-height: 60px;
       color: #fff;
       user-select: none;
       border-radius: 15px;
       background: linear-gradient(-130deg,azure,cyan, #4158d0,lightblue);
       margin-bottom: 25px;;
    }
   
    input[type="submit"]{
      color: #fff;
      border: none;
      border-radius:15px;
      width:80%;
      height:50px;
      align-self:center;
      margin-left:8vw;
      margin-top: 15px;
      font-size: 20px;
      font-weight: 600;
      cursor: pointer;
      background: linear-gradient(-135deg,azure ,cyan, #4158d0,lightblue);
       background-size:125%;
      transition: all 0.3s ease;
    }
    input[type="submit"]:active{
      transform: scale(0.95);
    }
    input[type="submit"]:hover{
    animation:bg-animation 2s infinite alternate;
    }
    label{
      font-size:20px;
    }
    .navbar-brand img {
      max-height: 40px;
    }
    .navbar {
      background: linear-gradient(270deg, #2d388a, #00aeef);
    }
    .nav-link:hover a {
      color: white;
    }
</style>
</head>
<body>

  <%@include file="navbar.jsp"%>
<div class="container">
  <h2 class="title">CATEGORIES</h2>
  <form action=addCategory.jsp method="POST" id="dateForm">
    <div class="form-group">
      <label for="startDate">Start Date:</label>
      <input type="date" class="form-control" id="startDate" name="startDate" required>
    </div>
    
    <div class="form-group">
      <label for="endDate">End Date:</label>
      <input type="date" class="form-control" id="endDate" name="endDate" required>
    </div>
    <input type="submit" value="FILTER">
    
  </form>

  
  <!-- <table id="expenseTable" class="table mt-4"  >
    <thead>
      <tr>
        <th>Category</th>
        <th>Expense Amount</th>
      </tr>
    </thead>
    
    <tbody>
       Data will be populated here
    </tbody>
    <tfoot>
      <tr>
        <td class="total">Total</td>
        <td class="total" id="totalAmount">$0</td>
      </tr>
    </tfoot>
  </table> -->
</div>


</body>
</html>
