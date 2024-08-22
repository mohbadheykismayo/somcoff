<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="add_details.aspx.cs" Inherits="somcoffe.add_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<!-- Modal -->
<div class="modal fade" id="catmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Item Operations</h1>
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
    <a href="javascript:void(0);" id="editbtn" class="btn btn-submit me-2" onclick="updatecategory()">edit</a>
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

    <div class="row">
    <div class="col-6">
        <div class="page-header">
<div class="page-title">
<h4>Items list</h4>

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
        </div>
    




    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script>
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

    </script>
</asp:Content>
