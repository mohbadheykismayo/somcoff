<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="somcoffe.admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Modal -->
<div class="modal fade" id="catmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Employee Operations</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

          <div class="page-header">
<div class="page-title">
<h4>Add Employee</h4>

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">
        <input id="id" style="display:none"/>
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Employee name</label>
<input type="text" id="employname">
        <small id="employname1" class="text-danger"></small>
</div>
</div>


  
  
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Phone Number</label>
<input type="text" class="form-control" id="number">
        <small id="number1" class="text-danger"></small>
</div>
</div>


  <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>username</label>
<input type="text" id="username">
        <small id="username1" class="text-danger"></small>
</div>
</div>



    <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>password</label>
<input type="text" id="password">
        <small id="password1" class="text-danger"></small>
</div>
</div>




  














<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn" class="btn btn-submit me-2" onclick="updateemploy()">edit</a>
<a href="javascript:void(0);" id="submitbtn" class="btn btn-submit me-2" onclick="submitemploy()">Submit</a>
<a href="categorylist.html" class="btn btn-cancel" data-bs-dismiss="modal">Cancel</a>
</div>
</div>
</div>
</div>

      </div>
     <%-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>--%>
    </div>
  </div>
</div>
    <div class="row">
                <div class="col-6">
        <div class="page-header">
<div class="page-title">
<h4>Employee list</h4>

</div>
<div class="page-btn">
<a href="#" class="btn btn-added" onclick="callmodal()">
<img src="assets/img/icons/plus.svg" class="me-1" alt="img">Add Employee
</a>
</div>
</div>

<div class="card">
<div class="card-body">
<div class="table-top">
<div class="search-set">
<div class="search-path">
<a class="btn btn-filter" id="filter_search">
<img src="assets/img/icons/filter.svg" alt="img">
<span><img src="assets/img/icons/closes.svg" alt="img"></span>
</a>
</div>
<div class="search-input">
<a class="btn btn-searchset"><img src="assets/img/icons/search-white.svg" alt="img"></a>
</div>
</div>
<div class="wordset">
<ul>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a>
</li>
</ul>
</div>
</div>

<div class="card" id="filter_inputs">
<div class="card-body pb-0">
<div class="row">
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Category</option>
<option>Computers</option>
</select>
</div>
</div>
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Sub Category</option>
<option>Fruits</option>
</select>
</div>
</div>
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Sub Brand</option>
<option>Iphone</option>
</select>
</div>
</div>
<div class="col-lg-1 col-sm-6 col-12 ms-auto">
<div class="form-group">
<a class="btn btn-filters ms-auto"><img src="assets/img/icons/search-whites.svg" alt="img"></a>
</div>
</div>
</div>
</div>
</div>

<div class="table-responsive">
<table class="table  " id="employees">
<thead>
<tr>

    <th>Employee Name</th>
<th>Contact Info</th>
    <th>UserName</th>
    <th>Password</th>

<th>Action</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
</div>
</div>
</div>
    </div>




                        <div class="col-6">
        <div class="page-header">
<div class="page-title">
<h4>Deynta Maqan</h4>

</div>

</div>

<div class="card">
<div class="card-body">
<div class="table-top">
<div class="search-set">
<div class="search-path">
<a class="btn btn-filter" id="filter_search1">
<img src="assets/img/icons/filter.svg" alt="img">
<span><img src="assets/img/icons/closes.svg" alt="img"></span>
</a>
</div>
<div class="search-input">
<a class="btn btn-searchset"><img src="assets/img/icons/search-white.svg" alt="img"></a>
</div>
</div>
<div class="wordset">
<ul>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a>
</li>
</ul>
</div>
</div>

<div class="card" id="filter_inputs1">
<div class="card-body pb-0">
<div class="row">
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Category</option>
<option>Computers</option>
</select>
</div>
</div>
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Sub Category</option>
<option>Fruits</option>
</select>
</div>
</div>
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Sub Brand</option>
<option>Iphone</option>
</select>
</div>
</div>
<div class="col-lg-1 col-sm-6 col-12 ms-auto">
<div class="form-group">
<a class="btn btn-filters ms-auto"><img src="assets/img/icons/search-whites.svg" alt="img"></a>
</div>
</div>
</div>
</div>
</div>

<div class="table-responsive">
<table class="table  " id="deyn">
<thead>
<tr>
    <th>Magaca Macmiilka</th>
    <th>Magaca Shaqalaha</th>

    <th>Deynta</th>
    <th>Waqtiga</th>
      <th>Lacagta Guud</th>
<th>Action</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
</div>
</div>
</div>
    </div>
    </div>
    <div class="row">
      
                        <div class="col-6">
        <div class="page-header">
<div class="page-title">
<h4>Alaabta La Tuuray</h4>

</div>

</div>

<div class="card">
<div class="card-body">
<div class="table-top">
<div class="search-set">
<div class="search-path">
<a class="btn btn-filter" id="filter_search11">
<img src="assets/img/icons/filter.svg" alt="img">
<span><img src="assets/img/icons/closes.svg" alt="img"></span>
</a>
</div>
<div class="search-input">
<a class="btn btn-searchset"><img src="assets/img/icons/search-white.svg" alt="img"></a>
</div>
</div>
<div class="wordset">
<ul>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a>
</li>
<li>
<a data-bs-toggle="tooltip" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a>
</li>
</ul>
</div>
</div>

<div class="card" id="filter_inputs11">
<div class="card-body pb-0">
<div class="row">
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Category</option>
<option>Computers</option>
</select>
</div>
</div>
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Sub Category</option>
<option>Fruits</option>
</select>
</div>
</div>
<div class="col-lg-2 col-sm-6 col-12">
<div class="form-group">
<select class="select">
<option>Choose Sub Brand</option>
<option>Iphone</option>
</select>
</div>
</div>
<div class="col-lg-1 col-sm-6 col-12 ms-auto">
<div class="form-group">
<a class="btn btn-filters ms-auto"><img src="assets/img/icons/search-whites.svg" alt="img"></a>
</div>
</div>
</div>
</div>
</div>

<div class="table-responsive">
<table class="table  " id="tuur">
<thead>
<tr>
    <th>Magaca </th>
    <th>inta xabo</th>

    <th>lacagta</th>
    <th>Waqtiga</th>

</tr>
</thead>
<tbody>

</tbody>
</table>
</div>
</div>
</div>
    </div>
    </div>
    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script>


        $("#employees").on("click", ".delete-btn", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");



            // Clear previous error messages

            Swal.fire({
                title: 'Are you sure?',
                text: "Do you want to start a new day stock?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, start it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Execute the AJAX request only if the user confirms
                    $.ajax({
                        url: 'admin.aspx/deleteemploy',
                        data: "{'id':'" + id + "'}",
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        type: 'POST',
                        success: function (response) {
                            console.log(response);
                            if (response.d === 'true') {
                                Swal.fire(
                                    'Successfully Started!',
                                    'You Started a new Day Stock!',
                                    'success'
                                );
                                $('#stockmodal').modal('hide');
                                displayemployees();
                            } else {
                                // Handle errors in the response
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Data Insertion Failed',
                                    text: 'There was an error while inserting the stock data: ' + response.d,
                                });
                            }
                        },
                        error: function (response) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Lama Tuuri Karo ',
                                text: 'An error occurred during the AJAX request: ',
                            });
                        }
                    });
                }
            });



        });










        function updateemploy() {
            // Clear previous error messages
            document.getElementById('employname1').textContent = "";
            document.getElementById('number1').textContent = "";
            document.getElementById('username1').textContent = "";
            document.getElementById('password1').textContent = "";

            var employname = $("#employname").val();
            var number = $("#number").val();
            var username = $("#username").val();

            var password = $("#password").val();
            var id = $("#id").val();

            // Validate the form values
            let isValid = true;

            // Uncomment and adjust validation as necessary
            if (employname.trim() === "") {
                document.getElementById('employname1').textContent = "Please select an item.";
                isValid = false;
            }
            if (number.trim() === "") {
                document.getElementById('number1').textContent = "Please enter a valid date.";
                isValid = false;
            }
            if (username.trim() === "") {
                document.getElementById('username1').textContent = "Please enter a valid date.";
                isValid = false;
            }
            if (password.trim() === "") {
                document.getElementById('password1').textContent = "Please enter a valid date.";
                isValid = false;
            }





            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'admin.aspx/updateemploy',
                    data: "{'id':'" + id + "', 'employname':'" + employname + "','number':'" + number + "','username':'" + username + "','password':'" + password + "'}",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'POST',
                    success: function (response) {
                        console.log(response);
                        if (response.d === 'true') {
                            Swal.fire(
                                'Successfully Saved!',
                                'You added a new Item!',
                                'success'
                            );
                            $('#catmodal').modal('hide');
                            clearInputFields();
                            displayemployees();

                        } else {
                            // Handle errors in the response
                            Swal.fire({
                                icon: 'error',
                                title: 'Data Insertion Failed',
                                text: 'There was an error while inserting the data.',
                            });
                        }
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });

            }

            function clearInputFields() {
                // Replace these lines with code to clear the input fields
                $("#catname").val('');

            }
        }

        $("#employees").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var name = row.find("td:nth-child(1)").text();
            var number = row.find("td:nth-child(2)").text();
            var user = row.find("td:nth-child(3)").text();
            var pass = row.find("td:nth-child(4)").text();

            $("#id").val(id);
            $("#employname").val(name);

            $("#number").val(number);
            $("#username").val(user);

            $("#password").val(pass);

            document.getElementById('submitbtn').style.display = 'none';
            document.getElementById('editbtn').style.display = 'inline-block';
            document.getElementById('deletebtn').style.display = 'none';

            $('#catmodal').modal('show');



        });






        function submitemploy() {
            // Clear previous error messages
            document.getElementById('employname1').textContent = "";
            document.getElementById('number1').textContent = "";
            document.getElementById('username1').textContent = "";
            document.getElementById('password1').textContent = "";

            var employname = $("#employname").val();
            var number = $("#number").val();
            var username = $("#username").val();

            var password = $("#password").val();


            // Validate the form values
            let isValid = true;

            // Uncomment and adjust validation as necessary
            if (employname.trim() === "") {
                document.getElementById('employname1').textContent = "Please select an item.";
                isValid = false;
            }
            if (number.trim() === "") {
                document.getElementById('number1').textContent = "Please enter a valid date.";
                isValid = false;
            }
            if (username.trim() === "") {
                document.getElementById('username1').textContent = "Please enter a valid date.";
                isValid = false;
            }
            if (password.trim() === "") {
                document.getElementById('password1').textContent = "Please enter a valid date.";
                isValid = false;
            }




            // If all validations pass, proceed with AJAX call
            if (isValid) {
                $.ajax({
                    url: 'admin.aspx/submitemploy',
                    data: JSON.stringify({ 'employname': employname, 'number': number, 'username': username, 'password': password }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'POST',
                    success: function (response) {
                        console.log(response);
                        if (response.d === 'true') {
                            Swal.fire(
                                'Successfully Saved!',
                                'You added a new Stock!',
                                'success'
                            );
                            $('#stockmodal').modal('hide');
                            clearInputFields();
                            displayemployees();
                        } else {
                            // Handle errors in the response
                            Swal.fire({
                                icon: 'error',
                                title: 'Data Insertion Failed',
                                text: 'There was an error while inserting the stock data: ' + response.d,
                            });
                        }
                    },
                    error: function (response) {
                        Swal.fire({
                            icon: 'error',
                            title: 'AJAX Error',
                            text: 'An error occurred during the AJAX request: ' + response.responseText,
                        });
                    }
                });
            }

            function clearInputFields() {
                // Clear the input fields
                $("#itemdrop").val('');
                $("#date").val('');
                $("#qtya").val('');
            }
        }






        function callmodal() {
            document.getElementById('submitbtn').style.display = 'inline-block';
            document.getElementById('editbtn').style.display = 'none';
            document.getElementById('deletebtn').style.display = 'none';
            /*  $("#catname").val('');*/
            $('#catmodal').modal('show');

        }
        displayemployees();
        function displayemployees() {
            $.ajax({
                url: 'add_details.aspx/displayemployees',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#employees tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var EmployeeID = response.d[i].EmployeeID;
                        var EmployeeName = response.d[i].EmployeeName;
                        var ContactInfo = response.d[i].ContactInfo;
                        var username = response.d[i].username;
                        var password = response.d[i].password;








                        $("#employees tbody").append(
                            "<tr>" +
                            "<td>" + EmployeeName + "</td>" +
                            "<td>" + ContactInfo + "</td>" +
                            "<td>" + username + "</td>" +
                            "<td>" + password + "</td>" +

                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + EmployeeID + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + EmployeeID + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>' +
                            "</td>" +
                            "</tr>"
                        );
                    }


                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }


        displaydeyn();
        function displaydeyn() {
            $.ajax({
                url: 'admin.aspx/displaydeyn',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#deyn tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var EmployeeName = response.d[i].EmployeeName;
                        var CustomerName = response.d[i].CustomerName;
                        var CreditAmount = response.d[i].CreditAmount;
                        var TotalAmount = response.d[i].TotalAmount;
                        var OrderDateTime = response.d[i].OrderDateTime;
                        var OrderID = response.d[i].OrderID;







                        $("#deyn tbody").append(
                            "<tr>" +
                            "<td>" + EmployeeName + "</td>" +
                            "<td>" + CustomerName + "</td>" +
                            "<td>" + CreditAmount + "</td>" +
                            "<td>" + TotalAmount + "</td>" +
                            "<td>" + OrderDateTime + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + OrderID + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + OrderID + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>' +
                            "</td>" +
                            "</tr>"
                        );
                    }


                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

        displaydelete();
        function displaydelete() {
            $.ajax({
                url: 'admin.aspx/displaydelete',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#tuur tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var ItemName = response.d[i].ItemName;
                        var quantity = response.d[i].quantity;
                        var SubTotalAmount = response.d[i].SubTotalAmount;
                        var date = response.d[i].date;
                   



                        $("#tuur tbody").append(
                            "<tr>" +
                            "<td>" + ItemName + "</td>" +
                            "<td>" + quantity + "</td>" +
                            "<td>" + CreditAmount + "</td>" +
                            "<td>" + SubTotalAmount + "</td>" +
                            "<td>" + date + "</td>" +
                         
                            "</tr>"
                        );
                    }


                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

    </script>
</asp:Content>
