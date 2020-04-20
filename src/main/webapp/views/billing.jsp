<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<html>

<head>
    <title>Billing Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@500&display=swap" rel="stylesheet">
</head>
<style>
    td,
    th {
        border: solid lightgray;
        text-align: left;
        padding: 8px;
        text-emphasis: none;
        font-weight: 550;
        ;
    }

    th {
        background-color: #BB1E5D
    }

    tr:nth-child(even) {
        background-color: #343A40;
        color: white;
    }

    .fnt {
        font-family: 'Raleway', sans-serif;
    }

    .fnt>th {
        font-weight: 500;
    }

    .fnt1 {
        font-variant: small-caps;
    }
</style>

<body class="bg-dark text-light fnt">
    <div style="background-color: #BB1E5D; font-size: large; font-weight: bold;">
        <div class="container">
            <nav class="navbar fnt1 navbar-dark" style="background-color:#BB1E5D; ">
                <a class="navbar-brand" href="#" style="color: white;">
                    <h3>fresherpro</h3>
                </a>
                <ul class="nav justify-content-center">
                    <a class="navbar-brand" href="#" style="color: white;">
                        <h3>Billing page</h3>
                    </a>
                </ul>
            </nav>
        </div>
    </div>
    <div class="mt-5">
        <div class="row">
            <div class="col-6 offset-3" style="border: solid lightgray;">
        <h3 class="fnt1 mt-3" style="  text-align: center">Search the product</h3>
        <div class="fnt1 mt-4" style="display: flex;align-content: center;justify-content: center;text-align: center">
            <form action="getProductByCode" method="get">
                Product Code:
                <br>
                <input type="number" name="product_code" />
                <input type="submit" value="Search">
            </form>
            <form action="getProductByName" method="get">
                Product Name:
                <br>
                <input style="margin-left: 4pt;" type="text" name="product_name" />
                <input type="submit" value="Search">
            </form>
        </div>
        <hr>
        <br>
    </div>
        </div>
    </div>

    <h2 class = "mt-4"style="text-align: center">Cart Details</h2>

    <br>
    <table style="width: 100%;
                     display: flex;
                     justify-content: center;
                     align-content: center;
                     text-align: center;">
        <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Product Price</th>
            <th>GST applied</th>
            <th>Quantity of Product needed</th>
            <th>Price of the Product</th>
        </tr>
        <c:set var="initial_total_cost" scope="session" value="${0}" />
        <c:forEach items="${result}" var="v">
            <c:set var="initial_gst" scope="session" value="${v.product_gst}" />
        </c:forEach>
        <c:set var="initial_grand_total" scope="session" value="${0}" />
        <c:forEach items="${result}" var="item">
            <c:set var="initial_total_cost" scope="session" value="${initial_total_cost+item.product_price}" />
            <tr>
                <td>
                    <c:out value="${item.product_code}" />
                </td>
                <td>
                    <c:out value="${item.product_name}" />
                </td>
                <td>
                    <c:out value="${item.product_price}" />
                </td>
                <td>
                    <c:out value="${item.product_gst}" />
                </td>
                <c:set var="initial_value" scope="session" value="${item.product_price*1}" />
                <td>
                    <input type="number" id="entry+${item.product_code}" value=1
                        onkeyup="checkMethod(${item.product_price},${item.product_code})" />
                </td>
                <td id="price+${item.product_code}" class="price_of_product">${initial_value}</td>
            </tr>
        </c:forEach>
        <c:set var="initial_grand_total" scope="session"
            value="${initial_total_cost+(initial_total_cost* initial_gst)/100}" />
        <tr style="background-color: #BB1E5D">
            <td colspan="3">Total</td>
            <td id="getTotal">Initial cost is ${initial_total_cost} INR</td>
            <td id="getVat">${initial_gst}</td>
            <td id="grandTotal">Total Cost ${initial_grand_total} INR</td>
        </tr>
    </table>
</body>
<script>
    var total_price = 0;
    var vat = 0;
    var grand_total = 0;


    function checkMethod(product_price, product_code) {
        var quant = 0;
        quant = document.getElementById("entry" + "+" + product_code).value;
        var value = quant * product_price;
        document.getElementById("price" + "+" + product_code).innerHTML = value.toString();

        calculateValues();

    }

    function calculateValues() {
        total_price = 0;
        var all_prices = document.getElementsByClassName("price_of_product");
        for (var i = 0; i < all_prices.length; i++) {
            var value = parseInt(all_prices[i].innerHTML);
            total_price += value;
        }

        vat = ((18 * total_price) / 100).toFixed(2);

        grand_total = total_price + parseInt(vat);

        document.getElementById("getTotal").innerHTML = "Total Price is " + total_price + " INR";
        document.getElementById("getVat").innerHTML = "Vat is" + vat;
        document.getElementById("grandTotal").innerHTML = "Grand Total is " + grand_total + " INR";

    }


</script>

</html>