<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Visualization with D3.js</title>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <style>
        /* CSS styling for the bar chart */
        .bar {
            fill: steelblue;
        }

        .bar:hover {
            fill: orange;
        }

        .axis {
            font-size: 14px;
        }

        svg {
            background-color: white;
        }

        /* Center alignment */
        .chart-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Adjust this value as needed */
        }

        /* Styling for labels */
        .label {
            font-size: 12px;
            text-anchor: middle;
        }
    </style>
</head>
<body>
    <div class="chart-container">
        <svg width="500" height="300"></svg>
    </div>
    <% 
        Object d=request.getAttribute("data");
        Object l=request.getAttribute("labels");
    %>
    <p style="display: none;" id="data"> <%= d %></p>
    <p style="display: none;" id="label"> <%= l %></p>
    <script>
        // Retrieve data and labels from request attributes
        var data = JSON.parse(document.getElementById("data").innerText);
        var labels = document.getElementById("label").innerText.split(",");

        // Create a scale for mapping data values to pixel values
        var xScale = d3.scaleBand()
            .domain(d3.range(data.length))
            .range([0, 500]); // Width of the SVG container

        var yScale = d3.scaleLinear()
            .domain([0, d3.max(data)])
            .range([0, 300]); // Height of the SVG container

        // Create SVG elements for the bars
        var bars = d3.select("svg")
            .selectAll("rect")
            .data(data)
            .enter()
            .append("rect")
            .attr("class", "bar")
            .attr("x", function(l, i) { return xScale(i); })
            .attr("y", function(d) { return 300 - yScale(d); })
            .attr("width", xScale.bandwidth())
            .attr("height", function(d) { return yScale(d); });

        // Add labels to the bars
        bars.each(function(d, i) {
            d3.select(this.parentNode)
                .append("text")
                .attr("class", "label")
                .attr("x", xScale(i) + xScale.bandwidth() / 2)
                .attr("y", 300 - yScale(d) - 5) // Adjust label position
                .text(function(d) { return d; });
        });

        // Create axes for the bar chart
        var xAxis = d3.axisBottom(xScale);
        var yAxis = d3.axisLeft(yScale);

        d3.select("svg")
            .append("g")
            .attr("class", "axis")
            .attr("transform", "translate(0,300)") // Move x-axis to the bottom
            .call(xAxis);

        d3.select("svg")
            .append("g")
            .attr("class", "axis")
            .call(yAxis);
    </script>
</body>
</html>
