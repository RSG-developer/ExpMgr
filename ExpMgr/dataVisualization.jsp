<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Visualization with Chart.js</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- <script src="./script/chart.js"></script> -->
    <style>
        /* CSS styling for the chart container */
        .container{
            display:flex;
            justify-content: start;
        }
        .chart-container {
            display: flex;
            justify-content:space-evenly ;
            height: 400px; /* Adjust this value as needed */
            margin-top: 100px;
            
        }
        
    </style>
</head>
<body>
    <div><%@include file="navbar.jsp"%></div>
    

    <div class="conatainer">
    <div class="chart-container">
        <canvas id="myChart"></canvas>
    </div>

    <div class="chart-container">
        <canvas id="pie"></canvas>
    </div>
    </div>
    
    <% 
        Object d = request.getAttribute("data");
        Object l = request.getAttribute("labels");
    %>

    <p style="display: none;" id="data"> <%= d %></p>
    <p style="display: none;" id="label"> <%= l %></p>

    <script>
        const barChart = document.getElementById('myChart');
        var data = JSON.parse(document.getElementById("data").innerText);
        var labels = document.getElementById("label").innerText.split(",");
        const pie=document.getElementById('pie');
        Chart.defaults.font.size=20;
        new Chart(barChart, {
            type: 'bar',
            data: {
                labels: labels,
                datasets: [{
                    
                    label: 'Category vs Amount',
                    data: data,
                    backgroundColor: ['#9BD0F5'],
                    
                    borderColor: [
                        'rgba(255, 99, 132, 1)', 
                        'rgba(54, 162, 235, 1)',  
                        'rgba(255, 206, 86, 1)',  
                         
                    ],
                    
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: 'Bar chart Category vs Amount',
                        padding: {
                            top: 10,
                            bottom: 30
                            
                        },
                              
                    }
                }
            },
            
        });
        new Chart(pie, {
            type: 'pie',
            data: {
                labels: labels,
                datasets: [{
                    
                    label: 'Category vs Amount',
                    data: data,
                    backgroundColor: [
                        'red',
                        'green',
                        'blue' , 
                         'cyan'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)', 
                        'rgba(54, 162, 235, 1)',  
                        'rgba(255, 206, 86, 1)',  
                         
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: 'Pie chart Category vs Amount',
                        padding: {
                            top: 10,
                            bottom: 30
                            
                        },
                        
                    }
                }            
               
            }
        });
    </script>
</body>
</html>
