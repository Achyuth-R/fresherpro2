<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<html>
    <head>
        <title>Products page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@500&display=swap" rel="stylesheet">
    </head>
    <style>
        td, th {
            border: 1px solid black;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #343A40;
            color: white;
        }
        .fnt{
          font-family: 'Raleway', sans-serif;
        }
        .fnt1{
          font-variant: small-caps;
        }
    </style>
    <body class="bg-dark text-light fnt">

        <div style="background-color: #BB1E5D; font-size: large; font-weight: bold;">
            <div class="container">
              <nav class="navbar fnt1 navbar-dark" style="background-color:#BB1E5D; ">
                <a class="navbar-brand" href="#" style="color: white;"><h3>fresherpro</h3></a>
                <ul class="nav justify-content-end">
                  <li class="nav-item">
    
                  <li class="nav-item">
                    <a class="nav-link disabled" href="#" style="color: white; font-size: large; font-weight: 550; margin-top: 1pt;">create</a>
                  </li>
                  <li class="nav-item">
                    <!-- <a class="nav-link " href="/gst.html" style="color: white;"><h5>order</h5></a> -->
                    <form action="BillProduct" method="post">
                        <input class = "nav-link mt-2" style="border: none; background-color: #BB1E5D; color: white; font-size: small;" type="submit" value="BILLING-PAGE"/></form>
                  </li>
                </ul>
              </nav>
            </div>
          </div>

          
        <!-- <h4 style="text-align: center;"><form action="BillProduct" method="post"> -->
        <!-- <input type="submit" value="BILLING-PAGE"/></form> </h4> -->
        <form style="text-align: center;"
                action="addProduct" method="post">
            Enter your Product Code:
            <br>
            <input type="number" name="product_code"/>
            <br>
            Enter your Product Name:
            <br>
            <input type="text" name="product_name"/>
            <br>
            Enter your Price/Unit of your product
            <br>
            <input type="number" name="product_price"/>
            <br>
            Enter the GST Rate in %
            <br>
            <input type="number" name="product_gst"/>
            <br>
            <br>
            <input type="submit" value="Enter New Product Details">
        </form>
        <hr>

        <h2 style="text-align: center">All Product Details</h2>

        <table style="width: 100%;
                     display: flex;
                     justify-content: center;
                     align-content: center;
                     text-align: center;
                     font-family: 'Times New Roman';">
            <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>GST applied</th>
                <th>Modify Product Data</th>
            </tr>
            <c:forEach items="${allProducts}" var="item">
                <tr>
                    <td><c:out value="${item.product_code}" /></td>
                    <td><c:out value="${item.product_name}" /></td>
                    <td><c:out value="${item.product_price}" /></td>
                    <td><c:out value="${item.product_gst}" /></td>
                    <td><input type="submit" class = "btn btn-primary" style = "background-color: #BB1E5D;border: none;" value="Modify Product Data" onclick="loadEditOption(${item.product_code})"></td>
                </tr>
            </c:forEach>
        </table>
            <form action="updateProduct" method="post" id="edit_form" style="display: none;float:right;margin-right: 40px;margin-top: -140px">
                Enter the Id of the Product
                <br>
                <input type="number" id="prod_code" name="product_code"/>
                <br>
                Enter new Price/Unit of your product
                <br>
                <input type="number" name="product_price"/>
                <br>
                Enter new GST Rate in %
                <br>
                <input type="number" name="product_gst"/>
                <br>
                <input type="submit">
                <button class = "btn btn-primary" style="background-color: #BB1E5D;" onclick="hideForm()">Hide</button>
            </form>

    </body>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script>
        function loadEditOption(product_id)
        {
            document.getElementById("edit_form").style.display="block";
            document.getElementById("prod_code").value=product_id;
        }
        function hideForm()
        {
            document.getElementById("edit_form").style.display="none";
        }
    </script>

</html>