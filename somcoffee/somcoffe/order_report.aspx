<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="order_report.aspx.cs" Inherits="somcoffe.order_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css"/>
          <style>
      #datatable{
          font-size: 1.2em;
      }
        #datatable1{
      font-size: 1.2em;
  }
              #todaystocktbl{
    font-size: 1.2em;
}
            #itemstock{
    font-size: 1.2em;
}
  
   
        
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <!-- Modal -->
<div class="modal fade" id="catmodal5" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content ">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel5">Reportka Alaabta ee maalin</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="row">
                         <div class="col-12">
        <div class="page-header">
<div class="page-title">


</div>

</div>

<div class="card">
<div class="card-body">
<div class="table-top">
<div class="search-set">
<div class="search-path">
<a class="btn btn-filter" id="filter_search5">
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
<table class="table  " id="dailystock">
<thead>
<tr>
       <th>Sawirka</th>
        <th>Magaca</th>

        <th>Qeybta</th>
        <th>Lacagta</th>
        <th>Waqtiga</th>
<th>Inta La haystay</th>
        <th>Inta La Gaday</th>
<th>Inta Soo Hartay </th>
    <th>Qiimaha Guud</th>




             


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
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content ">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Report ka Order da Maalinle</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="row">
                         <div class="col-12">
        <div class="page-header">
<div class="page-title">


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

    <th>Waqtiga</th>
<th>Magaca Macmiilka</th>
        <th>Magaca Shaqaalaha</th>
<th>Lacagta U Bixiye</th>
    <th>Lacagta Laga Rabay</th>
<th>Lacagta Ku Hartay</th>





             


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
  <div class="modal-dialog modal-xl">
    <div class="modal-content ">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel1"> Report ka Order walbo Alaabteeda</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="row">
                         <div class="col-12">
        <div class="page-header">
<div class="page-title">


</div>

</div>

<div class="card">
<div class="card-body">
<div class="table-top">
<div class="search-set">
<div class="search-path">
<a class="btn btn-filter" id="filter_search2">
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

<div class="card" id="filter_inputs2">
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
<table class="table  " id="datatable2">
<thead>
<tr>
        <th>Sawirka</th>

    <th>Magaca</th>
<th>Magaca Macmiilka</th>
        <th> Shaqaalaha</th>
<th>Lacagta u Bixiye</th>
       <th>Lacagta</th>
    <th>inta Xabo</th>
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

          




      </div>
     <%-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>--%>
    </div>
  </div>
</div>

    <div class="row">




                <div class="col-lg-6 col-md-12">
                    <div class="page-header">
<div class="page-title">
<h4>Report ka Maalin Walbo</h4>

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
 
 

<div class="table-responsive">
    <table class="table" id="todaystocktbl">
        <thead>
            <tr>
                 <th>Waqtiga </th>
            <th>Lacagta Guud </th>
<th>Lacagta la Bixiye </th>

<th>Lacagta La Hartay</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

</div>
</div>
        </div>



            <div class="col-lg-6 col-md-12">
        <div class="page-header">
<div class="page-title">
<h4>Reporka Alaabta Maalin Walbo</h4>

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
    <table class="table" id="itemstock">
        <thead>
            <tr>
                  <th>Waqtiga</th>
<th>Inta La Haystay </th>
        <th>Inta La Gaday</th>
<th>Inta Soo Hartay</th>
                <th>ficil</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>



</div>
</div>
    </div>
        </div>



    <!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.print.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>

    <script>


        itemstock();
        function itemstock() {
            $.ajax({
                url: 'order_report.aspx/itemstock',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

                    // Clear existing table body content
                    $("#itemstock tbody").empty();

                    // Populate the table rows
                    for (var i = 0; i < response.d.length; i++) {
                        var StockDate = response.d[i].StockDate;
                        var TotalQuantityAvailable = response.d[i].TotalQuantityAvailable;
                        var TotalQuantitySold = response.d[i].TotalQuantitySold;
                        var TotalQuantityRemaining = response.d[i].TotalQuantityRemaining;

                        $("#itemstock tbody").append(
                            "<tr>" +
                            "<td>" + StockDate + "</td>" +
                            "<td>" + TotalQuantityAvailable + "</td>" +
                            "<td>" + TotalQuantitySold + "</td>" +
                            "<td>" + TotalQuantityRemaining + "</td>" +
                            "<td>" +
                            '<a class="me-3 btn btn-success text-white edit-button" data-id="' + StockDate + '">' +
                            ' Check' +
                            "</a>" +
                            "</td>" +
                            "</tr>"
                        );
                    }

                    // Initialize DataTable with search, pagination, and export buttons
                    $("#itemstock").DataTable({
                        destroy: true,  // Destroy any existing instance before re-initializing
                        dom: 'Bfrtip',  // Define the placement of buttons and the search box
                        buttons: [
                            'excelHtml5',  // Export to Excel
                            'print'        // Print button
                        ],
                        paging: true,       // Enable pagination
                        pageLength: 10,     // Default number of rows per page
                        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                        responsive: true    // Make the table responsive
                    });
                },
                error: function (response) {
                    alert(response.responseText);
                    console.log(response.responseText);
                }
            });
        }

        displaytodaystock();
        function displaytodaystock() {
            $.ajax({
                url: 'order_report.aspx/dailyorder',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response);

                    // Clear existing table body content
                    $("#todaystocktbl tbody").empty();

                    // Populate the table rows
                    for (var i = 0; i < response.d.length; i++) {
                        var OrderDate = response.d[i].OrderDate;
                        var totalcredits = response.d[i].totalcredits;
                        var TotalAmountPerDay = response.d[i].TotalAmountPerDay;
                        var TotalCombinedAmountPerDay = response.d[i].TotalCombinedAmountPerDay;

                        $("#todaystocktbl tbody").append(
                            "<tr>" +
                            "<td>" + OrderDate + "</td>" +
                            "<td>" + TotalAmountPerDay + "</td>" +
                            "<td>" + TotalCombinedAmountPerDay + "</td>" +
                            "<td>" + totalcredits + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + OrderDate + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            "</a>" +
                            "</td>" +
                            "</tr>"
                        );
                    }

                    // Initialize DataTable with search, pagination, and export buttons
                    $("#todaystocktbl").DataTable({
                        destroy: true,  // Destroy any existing instance before re-initializing
                        dom: 'Bfrtip',  // Define the placement of buttons and the search box
                        buttons: [
                            'excelHtml5',  // Export to Excel
                            'print'        // Print button
                        ],
                        paging: true,       // Enable pagination
                        pageLength: 10,     // Default number of rows per page
                        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                        responsive: true    // Make the table responsive
                    });
                },
                error: function (response) {
                    alert(response.responseText);
                    console.log(response.responseText);
                }
            });
        }

  /*      datadisplay();*/
        function datadisplay() {
            $.ajax({
                url: 'order_report.aspx/datadisplay',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#datatable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var OrderDateTime = response.d[i].OrderDateTime;
                        var CustomerName = response.d[i].CustomerName;
                        var EmployeeName = response.d[i].EmployeeName;
                        
                        var CreditAmount = response.d[i].CreditAmount;
                        var TotalAmount = response.d[i].TotalAmount;
                        var TotalCombinedAmount = response.d[i].TotalCombinedAmount;









                        $("#datatable tbody").append(
                            "<tr>" +
                            "<td>" + OrderDateTime + "</td>" +
                            "<td>" + CustomerName + "</td>" +
                            "<td>" + EmployeeName + "</td>" +
                            "<td>" + CreditAmount + "</td>" +
                            "<td>" + TotalAmount + "</td>" +
                            "<td>" + TotalCombinedAmount + "</td>" +
                                 "</tr>"
                        );
                    }


                },
                error: function (response) {
                    alert(response.responseText);
                    console.log(response.responseText);
                }
            });
        }



        $("#todaystocktbl").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


  
       
            $.ajax({
                url: 'order_report.aspx/dailyreports',
                data: JSON.stringify({ 'id': id }),
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {

                    $("#datatable1 tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var OrderDateTime = response.d[i].OrderDateTime;
                        var CustomerName = response.d[i].CustomerName;
                        var EmployeeName = response.d[i].EmployeeName;

                        var CreditAmount = response.d[i].CreditAmount;
                        var TotalAmount = response.d[i].TotalAmount;
                        var TotalCombinedAmount = response.d[i].TotalCombinedAmount;
                        var OrderID = response.d[i].OrderID;

                        






                        $("#datatable1 tbody").append(
                            "<tr>" +
                            "<td>" + OrderDateTime + "</td>" +
                            "<td>" + CustomerName + "</td>" +
                            "<td>" + EmployeeName + "</td>" +
                            "<td>" + CreditAmount + "</td>" +
                            "<td>" + TotalAmount + "</td>" +
                            "<td>" + TotalCombinedAmount + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + OrderID + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            "</td>" +
                            "</tr>"
                        );
                    }

                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            $('#catmodal').modal('show');
        });


        $("#itemstock").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");




            $.ajax({
                url: 'order_report.aspx/dailystockitemreport',
                data: JSON.stringify({ 'id': id }),
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {

                    $("#dailystock tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var StockDate = response.d[i].StockDate;
                        var TotalQuantityAvailable = response.d[i].TotalQuantityAvailable;
                        var TotalQuantitySold = response.d[i].TotalQuantitySold;
                        var TotalQuantityRemaining = response.d[i].TotalQuantityRemaining;
                        var ItemName = response.d[i].ItemName;
                        var Section = response.d[i].Section;
                        var Price = response.d[i].Price;
                        var TotalSalesAmount = response.d[i].TotalSalesAmount;

                        var image = response.d[i].image;

                        // If 'image' is a URL, wrap it in an <img> tag
                        var imageTag = '<img src="' + image + '" alt="Item Image" style="width:50px;height:50px;">';











                        $("#dailystock tbody").append(
                            "<tr>" +
                            "<td>" + imageTag + "</td>" +
                            "<td>" + ItemName + "</td>" +
                            "<td>" + Section + "</td>" +
                            "<td>" + Price + "</td>" +
                            "<td>" + StockDate + "</td>" +
                            "<td>" + TotalQuantityAvailable + "</td>" +
                            "<td>" + TotalQuantitySold + "</td>" +
                            "<td>" + TotalQuantityRemaining + "</td>" +
                            "<td>" + TotalSalesAmount + "</td>" +
                        
                            "</tr>"
                        );
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            $('#catmodal5').modal('show');
        });



        $("#datatable1").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");




            $.ajax({
                url: 'order_report.aspx/itemreport',
                data: JSON.stringify({ 'id': id }),
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {

                    $("#datatable2 tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var ItemName = response.d[i].ItemName;
                        var CustomerName = response.d[i].CustomerName;
                        var EmployeeName = response.d[i].EmployeeName;

                        var TotalBookingAmount = response.d[i].TotalBookingAmount;
                        var Quantity = response.d[i].Quantity;
                        var OrderDateTime = response.d[i].OrderDateTime;
                        var SubTotalAmount = response.d[i].SubTotalAmount;

                        var image = response.d[i].image;

                        // If 'image' is a URL, wrap it in an <img> tag
                        var imageTag = '<img src="' + image + '" alt="Item Image" style="width:50px;height:50px;">';





                        $("#datatable2 tbody").append(
                            "<tr>" +
                            "<td>" + imageTag + "</td>" +
                            "<td>" + ItemName + "</td>" +
                            "<td>" + CustomerName + "</td>" +
                            "<td>" + EmployeeName + "</td>" +
                            "<td>" + TotalBookingAmount + "</td>" +
                            "<td>" + SubTotalAmount + "</td>" +
                            "<td>" + Quantity + "</td>" +
                            "<td>" + OrderDateTime + "</td>" +
                      
                           "</tr>"
                        );
                    }

                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

            $('#catmodal1').modal('show');
        });
    </script>
</asp:Content>
