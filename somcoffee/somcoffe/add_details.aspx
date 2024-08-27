<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="add_details.aspx.cs" Inherits="somcoffe.add_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Modal -->
<div class="modal fade" id="catmodal3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel3">Customer Operations</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

          <div class="page-header">
<div class="page-title">
<h4>Add Customer</h4>

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">
     <input id="id1" style="display:none"/>
    <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label> Customer </label>
<select class="select" id="custid">

</select>

</div>
</div>
    <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label> Room</label>
<select class="select" id="roomid">

</select>

</div>
</div>


        <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label> Booking Date</label>
    <input  type="datetime-local" id="date" class="form-control"/>
</div>
</div>

<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Duration </label>
<input type="text" id="duration">
        <small id="duration1" class="text-danger"></small>
</div>
</div>


  
  
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Amount</label>
<input type="text" class="form-control" id="price">
        <small id="price1" class="text-danger"></small>
</div>
</div>


  








  














<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn2" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn2" class="btn btn-submit me-2" onclick="updatebooking()">edit</a>
<a href="javascript:void(0);" id="submitbtn2" class="btn btn-submit me-2" onclick="submitbooking()">Submit</a>
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

<!-- Modal -->
<div class="modal fade" id="catmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Customer Operations</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

          <div class="page-header">
<div class="page-title">
<h4>Add Customer</h4>

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">
        <input id="id" style="display:none"/>
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>customer name</label>
<input type="text" id="custname">
        <small id="custname1" class="text-danger"></small>
</div>
</div>


  
  
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Phone Number</label>
<input type="text" class="form-control" id="number">
        <small id="number1" class="text-danger"></small>
</div>
</div>


  








  














<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn" class="btn btn-submit me-2" onclick="updateitem()">edit</a>
<a href="javascript:void(0);" id="submitbtn" class="btn btn-submit me-2" onclick="submitstock()">Submit</a>
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

    <!-- Modal -->
<div class="modal fade" id="catmodal1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel1">Rooms Operations</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

          <div class="page-header">
<div class="page-title">
<h4>Add Rooms</h4>

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">

<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Room name</label>
<input type="text" id="room">
        <small id="room1" class="text-danger"></small>
</div>
</div>

    <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Capacity</label>
<input type="text" id="capa">
        <small id="capa1" class="text-danger"></small>
</div>
</div>

  
  
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Price</label>
<input type="text" class="form-control" id="amount">
        <small id="amount1" class="text-danger"></small>
</div>
</div>


  








  














<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn1" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn1" class="btn btn-submit me-2" onclick="updaterooms()">edit</a>
<a href="javascript:void(0);" id="submitbtn1" class="btn btn-submit me-2" onclick="submitroom()">Submit</a>
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
<h4>Customers list</h4>

</div>
<div class="page-btn">
<a href="#" class="btn btn-added" onclick="callmodal()">
<img src="assets/img/icons/plus.svg" class="me-1" alt="img">Add Customer
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
<table class="table  " id="datatable">
<thead>
<tr>

    <th>Customer Name</th>
<th>Number</th>

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
<h4>Rooms list</h4>

</div>
<div class="page-btn">
<a href="#" class="btn btn-added" onclick="callmodal1()">
<img src="assets/img/icons/plus.svg" class="me-1" alt="img">Add Rooms
</a>
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
<table class="table  " id="datatable1">
<thead>
<tr>

    <th>Room Name</th>
<th>Capacity</th>
    <th>Price</th>
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
<h4>Booking list</h4>

</div>
<div class="page-btn">
<a href="#" class="btn btn-added" onclick="callmodal3()">
<img src="assets/img/icons/plus.svg" class="me-1" alt="img">Add Booking 
</a>
</div>
</div>

<div class="card">
<div class="card-body">
<div class="table-top">
<div class="search-set">
<div class="search-path">
<a class="btn btn-filter" id="filter_search3">
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



<div class="table-responsive">
<table class="table  " id="datatable3">
<thead>
<tr>

    <th>Customer Name</th>
<th>Room Name</th>

        <th>BookingDateTime</th>
<th>Duration</th>


        <th>TotalBookingAmount</th>
<th>Number</th>














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


    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script>

        $(document).ready(function () {



            $(function () {


                $.ajax({
                    type: "POST",
                    url: "add_details.aspx/getcust",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var itemdrop = $("[id*=custid]");
                        itemdrop.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            itemdrop.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });



            });

        });

        $(document).ready(function () {



            $(function () {


                $.ajax({
                    type: "POST",
                    url: "add_details.aspx/getroom",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var itemdrop = $("[id*=roomid]");
                        itemdrop.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            itemdrop.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });



            });

        });


        function submitbooking() {
            // Clear previous error messages
            document.getElementById('duration1').textContent = "";
            document.getElementById('price1').textContent = "";
            document.getElementById('amount1').textContent = "";

            var price = $("#price").val();
            var duration = $("#duration").val();
            var date = $("#date").val();
            var custid = $("#custid").val();
            var roomid = $("#roomid").val();
            // Validate the form values
            let isValid = true;

            // Uncomment and adjust validation as necessary
            if (duration.trim() === "") {
                document.getElementById('duration1').textContent = "Please select an item.";
                isValid = false;
            }
            if (price.trim() === "") {
                document.getElementById('price1').textContent = "Please enter a valid date.";
                isValid = false;
            }

            // If all validations pass, proceed with AJAX call
            if (isValid) {
                $.ajax({
                    url: 'add_details.aspx/submitbooking',
                    data: JSON.stringify({ 'price': price, 'duration': duration, 'date': date, 'custid': custid, 'roomid': roomid }),
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
                            displaystock();
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





        function submitroom() {
            // Clear previous error messages
            document.getElementById('room1').textContent = "";
            document.getElementById('capa1').textContent = "";
            document.getElementById('amount1').textContent = "";

            var room = $("#room").val();
            var capa = $("#capa").val();
            var amount = $("#amount").val();

            // Validate the form values
            let isValid = true;

            // Uncomment and adjust validation as necessary
            if (room.trim() === "") {
                document.getElementById('room1').textContent = "Please select an item.";
                isValid = false;
            }
            if (capa.trim() === "") {
                document.getElementById('capa1').textContent = "Please enter a valid date.";
                isValid = false;
            }

            if (amount.trim() === "") {
                document.getElementById('amount1').textContent = "Please enter a valid date.";
                isValid = false;
            }
            // If all validations pass, proceed with AJAX call
            if (isValid) {
                $.ajax({
                    url: 'add_details.aspx/submitroom',
                    data: JSON.stringify({ 'room': room, 'capa': capa, 'amount': amount }),
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
                            displaystock();
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


        function submitstock() {
            // Clear previous error messages
            document.getElementById('custname1').textContent = "";
            document.getElementById('number1').textContent = "";

            var custname = $("#custname").val();
            var number = $("#number").val();

            // Validate the form values
            let isValid = true;

            // Uncomment and adjust validation as necessary
            if (custname.trim() === "") {
                document.getElementById('custname1').textContent = "Please select an item.";
                isValid = false;
            }
            if (number.trim() === "") {
                document.getElementById('number1').textContent = "Please enter a valid date.";
                isValid = false;
            }


            // If all validations pass, proceed with AJAX call
            if (isValid) {
                $.ajax({
                    url: 'add_details.aspx/submitstock',
                    data: JSON.stringify({ 'custname': custname, 'number': number }),
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
                            displaystock();
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
        function callmodal1() {
            document.getElementById('submitbtn1').style.display = 'inline-block';
            document.getElementById('editbtn1').style.display = 'none';
            document.getElementById('deletebtn1').style.display = 'none';
            /*  $("#catname").val('');*/
            $('#catmodal1').modal('show');

        }

        function callmodal3() {
            document.getElementById('submitbtn2').style.display = 'inline-block';
            document.getElementById('editbtn2').style.display = 'none';
            document.getElementById('deletebtn2').style.display = 'none';
            /*  $("#catname").val('');*/
            $('#catmodal3').modal('show');

        }


        displaycustomer();
        function displaycustomer() {
            $.ajax({
                url: 'add_details.aspx/displaycustomer',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#datatable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var CustomerID = response.d[i].CustomerID;
                        var CustomerName = response.d[i].CustomerName;
                        var ContactInfo = response.d[i].ContactInfo;




                        $("#datatable tbody").append(
                            "<tr>" +
                            "<td>" + CustomerName + "</td>" +
                            "<td>" + ContactInfo + "</td>" +

                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + CustomerID + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + CustomerID + '">' +
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





        displayrooms();
        function displayrooms() {
            $.ajax({
                url: 'add_details.aspx/displayrooms',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#datatable1 tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var RoomName = response.d[i].RoomName;
                        var Capacity = response.d[i].Capacity;
                        var PricePerHour = response.d[i].PricePerHour;

                        var RoomID = response.d[i].RoomID;






                        $("#datatable1 tbody").append(
                            "<tr>" +
                            "<td>" + RoomName + "</td>" +
                            "<td>" + Capacity + "</td>" +
                            "<td>" + PricePerHour + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + RoomID + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + RoomID + '">' +
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


        $("#datatable").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var name = row.find("td:nth-child(1)").text();
            var number = row.find("td:nth-child(2)").text();

            $("#id").val(id);
            $("#custname").val(name);

            $("#number").val(number);

            document.getElementById('submitbtn').style.display = 'none';
            document.getElementById('editbtn').style.display = 'inline-block';
            document.getElementById('deletebtn').style.display = 'none';

            $('#catmodal').modal('show');



        });




        $("#datatable1").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var name = row.find("td:nth-child(1)").text();
            var capa = row.find("td:nth-child(2)").text();
            var price = row.find("td:nth-child(3)").text();

            $("#id").val(id);
            $("#room").val(name);

            $("#capa").val(capa);
            $("#amount").val(price);

            document.getElementById('submitbtn1').style.display = 'none';
            document.getElementById('editbtn1').style.display = 'inline-block';
            document.getElementById('deletebtn1').style.display = 'none';

            $('#catmodal1').modal('show');



        });



        $("#datatable3").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var dura = row.find("td:nth-child(4)").text();
            var amount = row.find("td:nth-child(5)").text();


            $("#id1").val(id);
            $("#duration").val(dura);


            $("#price").val(amount);

            document.getElementById('submitbtn2').style.display = 'none';
            document.getElementById('editbtn2').style.display = 'inline-block';
            document.getElementById('deletebtn2').style.display = 'none';

            $('#catmodal3').modal('show');



        });
        function updatebooking() {
            // Clear previous error messages
            document.getElementById('duration1').textContent = "";
            document.getElementById('price1').textContent = "";
            document.getElementById('date').textContent = "";

            var price = $("#price").val();
            var duration = $("#duration").val();
            var date = $("#date").val();
            var custid = $("#custid").val();
            var roomid = $("#roomid").val();


            var id = $("#id1").val();

            // Validate the form values
            let isValid = true;
            // Uncomment and adjust validation as necessary
            if (duration.trim() === "") {
                document.getElementById('duration1').textContent = "Please select an item.";
                isValid = false;
            }
            if (price.trim() === "") {
                document.getElementById('price1').textContent = "Please enter a valid date.";
                isValid = false;
            }



            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'add_details.aspx/updatebooking',
                    data: "{'id':'" + id + "', 'price':'" + price + "','duration':'" + duration + "','date':'" + date + "','custid':'" + custid + "','roomid':'" + roomid + "'}",
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
                            $('#catmodal1').modal('hide');
                            clearInputFields();
                            displaycustomer();
                            displayrooms();
                            displaybooking();

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

        function updaterooms() {
            // Clear previous error messages
            document.getElementById('room1').textContent = "";
            document.getElementById('capa1').textContent = "";
            document.getElementById('amount1').textContent = "";





            var room = $("#room").val();
            var capa = $("#capa").val();
            var amount = $("#amount").val();


            var id = $("#id").val();

            // Validate the form values
            let isValid = true;

            if (room.trim() === "") {
                document.getElementById('room1').textContent = "Please enter the  Item Name.";
                isValid = false;
            }


            if (capa.trim() === "") {
                document.getElementById('capa1').textContent = "Please enter the  Price.";
                isValid = false;
            }

            if (amount.trim() === "") {
                document.getElementById('amount1').textContent = "Please enter the  Price.";
                isValid = false;
            }






            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'add_details.aspx/updaterooms',
                    data: "{'id':'" + id + "', 'room':'" + room + "','capa':'" + capa + "','amount':'" + amount + "'}",
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
                            $('#catmodal1').modal('hide');
                            clearInputFields();
                            displaycustomer();
                            displayrooms();

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


        function updateitem() {
            // Clear previous error messages
            document.getElementById('custname1').textContent = "";
            document.getElementById('number1').textContent = "";





            var custname = $("#custname").val();
            var number = $("#number").val();


            var id = $("#id").val();

            // Validate the form values
            let isValid = true;

            if (custname.trim() === "") {
                document.getElementById('custname1').textContent = "Please enter the  Item Name.";
                isValid = false;
            }


            if (number.trim() === "") {
                document.getElementById('number1').textContent = "Please enter the  Price.";
                isValid = false;
            }






            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'add_details.aspx/updatecust',
                    data: "{'id':'" + id + "', 'custname':'" + custname + "','number':'" + number + "'}",
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
                            displaycustomer();

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


        displaybooking();
        function displaybooking() {
            $.ajax({
                url: 'add_details.aspx/displaybooking',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#datatable3 tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var BookingID = response.d[i].BookingID;
                        var CustomerName = response.d[i].CustomerName;
                        var RoomName = response.d[i].RoomName;
                        var BookingDateTime = response.d[i].BookingDateTime;

                        var Duration = response.d[i].Duration;
                        var TotalBookingAmount = response.d[i].TotalBookingAmount;




                        $("#datatable3 tbody").append(
                            "<tr>" +

                            "<td>" + CustomerName + "</td>" +
                            "<td>" + RoomName + "</td>" +
                            "<td>" + BookingDateTime + "</td>" +
                            "<td>" + Duration + "</td>" +
                            "<td>" + TotalBookingAmount + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + BookingID + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + BookingID + '">' +
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





        $("#datatable").on("click", ".delete-btn", function (event) {
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
                        url: 'add_details.aspx/deletecust',
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

                                displaycustomer();
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




        $("#datatable1").on("click", ".delete-btn", function (event) {
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
                        url: 'add_details.aspx/deleteroom',
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

                                displaycustomer();
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


        $("#datatable3").on("click", ".delete-btn", function (event) {
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
                        url: 'add_details.aspx/deletebooking',
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

                                displaycustomer();
                                displaybooking();
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



    </script>
</asp:Content>



