<%-- 
    Document   : adminoperation
    Created on : 30 May, 2021, 10:11:45 AM
    Author     : rosha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="adminoperation.css">
</head>
<body>

<button class="tablink" onclick="openPage('Add_Restaurant', this, 'rgb(159, 43, 104)')"id="defaultOpen">Add Restaurant</button>
<button class="tablink" onclick="openPage('Remove_Restaurant', this, 'rgb(222, 49, 99)')">Remove Restaurant</button>
<button class="tablink" onclick="openPage('Add_Food', this, 'rgb(129, 19, 49)')">Add Food</button>
<button class="tablink" onclick="openPage('Remove_Food', this, 'rgb(255, 127, 80)')">Remove Food</button>
<button class="tablink" onclick="openPage('Add_Coupon', this, 'rgb(248, 131, 121)')">Add Coupon</button>
<button class="tablink" onclick="openPage('Remove_Coupon', this, 'rgb(149, 53, 83)')">Remove Coupon</button>

<div id="Add_Restaurant" class="tabcontent">
    <h2>Foodbite - Add Restaurant</h2>
    <form action="<%=request.getContextPath()%>/addres" method="POST">
        <div class="inputBox">
            <input type="name" name="rname" required="">
            <label>Restaurant Name</label>
        </div>
        <input type="submit" value="Add">
    </form>
    <p style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
    <p style="color:green"><%=(request.getAttribute("sucMessage") == null) ? "" : request.getAttribute("sucMessage")%></p>
</div>

<div id="Remove_Restaurant" class="tabcontent">
  <h2>Foodbite - Remove Restaurant</h2>
  <form action="<%=request.getContextPath()%>/remres" method="POST">
        <div class="inputBox">
            <input type="name" name="rname" required="">
            <label>Restaurant Name</label>
        </div>
        <input type="submit" value="Remove">
    </form>
    <p style="color:red"><%=(request.getAttribute("errorMessage") == null) ? "" : request.getAttribute("errorMessage")%></p>
    <p style="color:green"><%=(request.getAttribute("successMessage") == null) ? "" : request.getAttribute("successMessage")%></p>
</div>

<div id="Add_Food" class="tabcontent">
    <h2>Foodbite - Add Food</h2>
    <form action="<%=request.getContextPath()%>/addfood" method="POST">
        <div class="inputBox">
            <input type="name" name="rname" required="">
            <label>Restaurant Name</label>
        </div>
        <div class="inputBox">
            <input type="name" name="food" required="">
            <label>Food Name</label>
        </div>
        <div class="inputBox">
            <input type="int" name="price" required="">
            <label>Price</label>
        </div>
        <input type="submit" value="Add">
    </form>
    <p style="color:red"><%=(request.getAttribute("errorMessage3") == null) ? "" : request.getAttribute("errorMessage3")%></p>
    <p style="color:green"><%=(request.getAttribute("successMessage3") == null) ? "" : request.getAttribute("successMessage3")%></p>
</div>

<div id="Remove_Food" class="tabcontent">
    <h2>Foodbite - Remove Food</h2>
    <form action="<%=request.getContextPath()%>/remfood" method="POST">
        <div class="inputBox">
            <input type="name" name="rname" required="">
            <label>Restaurant Name</label>
        </div>
        <div class="inputBox">
            <input type="name" name="food" required="">
            <label>Food Name</label>
        </div>
        <input type="submit" value="Remove">
    </form>
    <p style="color:red"><%=(request.getAttribute("errorMessage4") == null) ? "" : request.getAttribute("errorMessage4")%></p>
    <p style="color:green"><%=(request.getAttribute("successMessage4") == null) ? "" : request.getAttribute("successMessage4")%></p>
</div>
<div id="Add_Coupon" class="tabcontent">
 <h2>Foodbite - Add Coupon</h2>
  <form action="<%=request.getContextPath()%>/addcoup" method="POST">
        <div class="inputBox">
            <input type="name" name="cname" required="">
            <label>Coupon Name</label>
        </div>
        <div class="inputBox">
            <input type="int" name="deduction" required="">
            <label>Deduction</label>
        </div>
        <input type="submit" value="Add">
    </form>
    <p style="color:red"><%=(request.getAttribute("errorMessage1") == null) ? "" : request.getAttribute("errorMessage1")%></p>
    <p style="color:green"><%=(request.getAttribute("successMessage1") == null) ? "" : request.getAttribute("successMessage1")%></p>
</div>

<div id="Remove_Coupon" class="tabcontent">
  <h2>Foodbite - Remove Coupon</h2>
  <form action="<%=request.getContextPath()%>/remcoup" method="POST">
        <div class="inputBox">
            <input type="name" name="cname" required="">
            <label>Coupon Name</label>
        </div>
        <input type="submit" value="Remove">
    </form>
    <p style="color:red"><%=(request.getAttribute("errorMessage2") == null) ? "" : request.getAttribute("errorMessage2")%></p>
    <p style="color:green"><%=(request.getAttribute("successMessage2") == null) ? "" : request.getAttribute("successMessage2")%></p>
</div>

<div class="three">            
            <form action="index.html">
                <input type="submit" value="Logout">
            </form>
</div>
<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
   
</body>
</html> 

