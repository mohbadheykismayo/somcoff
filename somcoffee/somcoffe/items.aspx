<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="items.aspx.cs" Inherits="somcoffe.items" %>
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

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label> Category</label>
<select class="select" id="catdrop">

</select>

</div>
</div>
    <input id="id" style="display:none"/>
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Item Name</label>
<input type="text" id="itemname">
        <small id="itemname1" class="text-danger"></small>
</div>
</div>


    <div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label> Section</label>
<select class="select"  id="section">
        <option value="0">Please select section</option>

       <option value="Fast Food">fastfood</option>
       <option value="Drinks">Drinks</option>
      <option value="Kitchen">Kitchen</option>
</select>
</div>
</div>
  
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Price</label>
<input type="number" class="form-control" id="price">
        <small id="price1" class="text-danger"></small>
</div>
</div>


  








  














<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn" class="btn btn-submit me-2" onclick="updateitem()">edit</a>
<a href="javascript:void(0);" id="submitbtn" class="btn btn-submit me-2" onclick="submititem()">Submit</a>
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
    <div class="col-lg-6 col-md-12">
        <div class="page-header">
            <div class="page-title">
                <h4>List Ga Alaabta</h4>
            </div>
            <div class="page-btn">
               <a href="#" class="btn btn-added" onclick="callmodal()">
                    <img src="assets/img/icons/plus.svg" class="me-1" alt="img">Ku dar Alaabta
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
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a></li>
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
                    <table class="table" id="datatable">
                        <thead>
                            <tr>
                            <th>ID Alaabta</th>
                                <th>Magaca Alaabta</th>
                                <th>Nooca</th>
                                <th>Qeybta</th>
                                <th>Qiimaha</th>
                                <th>Fal</th>
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
                <h4>Baqaarka Alaabta</h4>
            </div>
            <div class="page-btn">
                <a href="#" class="btn btn-added" onclick="callstockmodal()">
                    <img src="assets/img/icons/plus.svg" class="me-1" alt="img">Ku dar Stock
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
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a></li>
                        </ul>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table" id="datatable1">
                        <thead>
                            <tr>
                           <th>Alaabta</th>
                                <th>Taariikhda</th>
                                <th>Tirada La Heli Karo</th>
                                <th>Tirada La Iibiyey</th>
                                <th>Tirada Hartay</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="page-header">
            <div class="page-title">
                <h4>Alaabta Maanta</h4>
            </div>
            <div class="page-btn">
               <a href="#" class="btn btn-added" onclick="startnextday()">
                    <img src="assets/img/icons/plus.svg" class="me-1" alt="img">Bilow Maalin Cusub
                </a>
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
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="pdf"><img src="assets/img/icons/pdf.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="excel"><img src="assets/img/icons/excel.svg" alt="img"></a></li>
                            <li><a data-bs-toggle="tooltip" data-bs-placement="top" title="print"><img src="assets/img/icons/printer.svg" alt="img"></a></li>
                        </ul>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table" id="todaystocktbl">
                        <thead>
                            <tr>
                            <th>Alaabta</th>
                                <th>Taariikhda</th>
                                <th>Tirada La Heli Karo</th>
                                <th>Tirada La Iibiyey</th>
                                <th>Tirada Hartay</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


    <!-- Modal -->
<div class="modal fade" id="stockmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel1">Stock Operations</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

          <div class="page-header">
<div class="page-title">
<h4>Items Add to Stock</h4>

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">
        <input id="id1" style="display:none"/>
<div class="col-lg-4 col-sm-6 col-12" id="dropee">
<div class="form-group">
<label> Item</label>
<select class="select" id="itemdrop">

</select>

</div>
</div>
<div class="col-lg-4 col-sm-6 col-12">
<div class="form-group">
<label>Quantity Available</label>
<input type="text" id="qtya">
        <small id="itemname11" class="text-danger"></small>
</div>
</div>


<%--    <div class="col-lg-4 col-sm-6 col-12" id="datee">
<div class="form-group">
<label> Stock Date</label>
    <input  type="datetime-local" id="date" class="form-control"/>
</div>
</div>--%>
  


<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn1" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn1" class="btn btn-submit me-2" onclick="updateitemstock()">edit</a>
      <a href="javascript:void(0);" id="editbtn11" class="btn btn-submit me-2" onclick="updatetodaystock()">edit</a>
    
<a href="javascript:void(0);" id="submitbtn1" class="btn btn-submit me-2" onclick="submitstock()">Submit</a>
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





    <script src="datatables/jquery-3.4.1.min.js"></script>



    <script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script>
            function call() {
         

                
            }
          



         

            getcat();
            function getcat(){
                    $.ajax({
                        type: "POST",
                        url: "items.aspx/getcat",
                        data: '{}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var catdrop = $("[id*=catdrop]");
                            catdrop.empty().append('<option selected="selected" value="0">Please select</option>');
                            $.each(r.d, function () {
                                catdrop.append($("<option></option>").val(this['Value']).html(this['Text']));
                            });
                        }
                    });
                }



            getitem();

                function getitem() {
                    $.ajax({
                        type: "POST",
                        url: "items.aspx/getitem",
                        data: '{}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            var itemdrop = $("[id*=itemdrop]");
                            itemdrop.empty().append('<option selected="selected" value="0">Please select</option>');
                            $.each(r.d, function () {
                                itemdrop.append($("<option></option>").val(this['Value']).html(this['Text']));
                            });
                        }
                    });
                }

         
        datadisplay();
        function datadisplay() {
            $.ajax({
                url: 'items.aspx/datadisplay',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                
                    $("#datatable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var id = response.d[i].ItemID;
                        var name = response.d[i].ItemName;
                        var CategoryName = response.d[i].CategoryName;
                        var Section = response.d[i].Section;
                        var Price = response.d[i].Price;
                  
                        





                        $("#datatable tbody").append(
                            "<tr>" +
                      
                            "<td>" + name + "</td>" +
                            "<td>" + CategoryName + "</td>" +
                            "<td>" + Section + "</td>" +
                            "<td>" + Price + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + id + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + id + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>' +
                            "</td>" +
                            "</tr>"
                        );
                    }

                    call();
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

        function submititem() {
            // Clear previous error messages
            document.getElementById('itemname1').textContent = "";
            document.getElementById('price1').textContent = "";
          
    



            var itemname = $("#itemname").val();
            var price = $("#price").val();
            var section = $("#section").val();
            var catdrop = $("#catdrop").val();

        

            // Validate the form values
            let isValid = true;

            if (itemname.trim() === "") {
                document.getElementById('itemname1').textContent = "Please enter the  Item Name.";
                isValid = false;
            }


            if (price.trim() === "") {
                document.getElementById('price1').textContent = "Please enter the  Price.";
                isValid = false;
            }





            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'items.aspx/submititem',
                    data: "{ 'itemname':'" + itemname + "', 'price':'" + price + "', 'section':'" + section + "', 'catdrop':'" + catdrop + "'}",
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
                            datadisplay();
                            getitem();

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
                document.getElementById('itemname1').textContent = "";
                document.getElementById('price1').textContent = "";





                var itemname = $("#itemname").val();
                var price = $("#price").val();
                var section = $("#section").val();
                var catdrop = $("#catdrop").val();
             
                var id = $("#id").val();
          
                // Validate the form values
                let isValid = true;

                if (itemname.trim() === "") {
                    document.getElementById('itemname1').textContent = "Please enter the  Item Name.";
                    isValid = false;
                }


                if (price.trim() === "") {
                    document.getElementById('price1').textContent = "Please enter the  Price.";
                    isValid = false;
                }



                if (price == 0) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Bank price',
                        text: 'There was an error while inserting the data.',
                    });
                    isValid = false;
                }

                if (section == 0) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Bank Section',
                        text: 'There was an error while inserting the data.',
                    });
                    isValid = false;
                }




                // If all validations pass, proceed with AJAX call
                if (isValid) {

                    $.ajax({
                        url: 'items.aspx/updateitem',
                        data: "{'id':'" + id + "', 'itemname':'" + itemname + "', 'price':'" + price + "', 'section':'" + section + "', 'catdrop':'" + catdrop + "'}",
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
                                datadisplay();

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


            function updateitemstock() {
                // Clear previous error messages
                document.getElementById('itemname11').textContent = "";
           





                var qty = $("#qtya").val();

                var id = $("#id1").val();
             
                // Validate the form values
                let isValid = true;

                if (qty.trim() === "") {
                    document.getElementById('itemname11').textContent = "Please enter the  Item Name.";
                    isValid = false;
                }


        



                // If all validations pass, proceed with AJAX call
                if (isValid) {

                    $.ajax({
                        url: 'items.aspx/updateitemstock',
                        data: "{'id':'" + id + "', 'qty':'" + qty + "'}",
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
                                $('#stockmodal').modal('hide');
                                clearInputFields();
                                datadisplay();
                                displaystock();

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






        function updatecategory() {
            // Clear previous error messages
            document.getElementById('nameError').textContent = "";




            var catname = $("#catname").val();

            var id = $("#id").val();



            // Validate the form values
            let isValid = true;

            if (catname.trim() === "") {
                document.getElementById('nameError').textContent = "Please enter the  name.";
                isValid = false;
            }






            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'add_category.aspx/updatecategory',
                    data: "{'id':'" + id + "','catname':'" + catname + "' }",

                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        console.log(response);
                        $('#catmodal').modal('hide');
                        Swal.fire(
                            'Successfully Updated !',
                            'You Updated a new Category!',
                            'success'
                        )
                    
                        clearInputFields();
                        datadisplay();
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

        function deletecategory() {
            var id = $("#id").val();
 
            $.ajax({
                type: "POST",
                url: "add_category.aspx/deletecategory",
                data: JSON.stringify({ id: id }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response);
                    $('#catmodal').modal('hide');
                    if (response.d === 'true') {
                        Swal.fire(
                            'Successfully Deleted !',
                            'You Deleted  A category!',
                            'success'
                        )

                        datadisplay();
                    } else {
                        // Handle errors in the response
                        Swal.fire({
                            icon: 'error',
                            title: 'Data Insertion Failed',
                            text: 'There was an error while inserting the data.',
                        });
                    }
                },
                error: function (xhr, status, error) {
                    alert("Error: " + xhr.responseText);
                }
            });

        }




        $("#datatable").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var name = row.find("td:nth-child(2)").text();
            var price = row.find("td:nth-child(5)").text();
            $("#id").val(id);
            $("#itemname").val(name);
     
            $("#price").val(price);

            document.getElementById('submitbtn').style.display = 'none';
            document.getElementById('editbtn').style.display = 'inline-block';
            document.getElementById('deletebtn').style.display = 'none';
            
            $('#catmodal').modal('show');



        });












            //$("#datatable1").on("click", ".edit-button", function (event) {
            //    event.preventDefault(); // Prevent default behavior

            //    var row = $(this).closest("tr");
            //    var id = $(this).data("id");

 
            //    var qty = row.find("td:nth-child(3)").text();
            //    $("#id1").val(id);
             
             
            //    $("#qtya").val(qty);

            //    document.getElementById('dropee').style.display = 'none';

            //    document.getElementById('submitbtn1').style.display = 'none';
            //    document.getElementById('editbtn1').style.display = 'inline-block';
            //    document.getElementById('deletebtn1').style.display = 'none';

            //    $('#stockmodal').modal('show');



            //});












            $("#datatable1").on("click", ".send-btn", function (event) {
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
                            url: 'items.aspx/startstockitem',
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

                                    displaytodaystock();
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
                });



            });




            $("#datatable").on("click", ".delete-btn", function (event) {
                event.preventDefault(); // Prevent default behavior

                var row = $(this).closest("tr");
                var id = $(this).data("id");



                // Clear previous error messages

                Swal.fire({
                    title: 'Ma Hubtaa ?',
                    text: "Ma Rabtaa Inaad Delete Gareeneyso ?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, start it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Execute the AJAX request only if the user confirms
                        $.ajax({
                            url: 'items.aspx/deleteitem',
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

                                    displaytodaystock();
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
                                    title: 'Lama Tuuri Karo Dalab Buu KU Maqanyahay',
                                    text: 'An error occurred during the AJAX request: ',
                                });
                            }
                        });
                    }
                });



            });














            $("#todaystocktbl").on("click", ".delete-btn", function (event) {
                event.preventDefault(); // Prevent default behavior

                var row = $(this).closest("tr");
                var id = $(this).data("id");



                // Clear previous error messages

                Swal.fire({
                    title: 'Ma Hubtaa ?',
                    text: "Ma Rabtaa Inaad Delete Gareeneyso ?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, start it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Execute the AJAX request only if the user confirms
                        $.ajax({
                            url: 'items.aspx/deletetodaystock',
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

                                    displaytodaystock();
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
                });



            });






















        //$("#datatable").on("click", ".delete-btn", function (event) {
        //    event.preventDefault(); // Prevent default behavior

        //    var row = $(this).closest("tr");
        //    var id = $(this).data("id");


        //    var name = row.find("td:nth-child(2)").text();

        //    $("#id").val(id);
        //    $("#catname").val(name);


        //    document.getElementById('submitbtn').style.display = 'none';
        //    document.getElementById('editbtn').style.display = 'none';

        //    document.getElementById('deletebtn').style.display = 'inline-block';

        //    $('#catmodal').modal('show');



        //});
        function callmodal() {
            document.getElementById('submitbtn').style.display = 'inline-block';
            document.getElementById('editbtn').style.display = 'none';
            document.getElementById('deletebtn').style.display = 'none';
          /*  $("#catname").val('');*/
            $('#catmodal').modal('show');

            }

            function callstockmodal() {
                $('#stockmodal').modal('hide');
                document.getElementById('submitbtn1').style.display = 'inline-block';
                document.getElementById('editbtn1').style.display = 'none';
                document.getElementById('editbtn11').style.display = 'none';
                document.getElementById('deletebtn1').style.display = 'none';
                /*  $("#catname").val('');*/

         ;
                $('#stockmodal').modal('show');

            }



            function updatetodaystock() {
                // Clear previous error messages
                document.getElementById('itemname11').textContent = "";






                var qty = $("#qtya").val();

                var id = $("#id1").val();

                // Validate the form values
                let isValid = true;

                if (qty.trim() === "") {
                    document.getElementById('itemname11').textContent = "Please enter the  Item Name.";
                    isValid = false;
                }






                // If all validations pass, proceed with AJAX call
                if (isValid) {

                    $.ajax({
                        url: 'items.aspx/updatetodaystock',
                        data: "{'id':'" + id + "', 'qty':'" + qty + "'}",
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
                                $('#stockmodal').modal('hide');
                                clearInputFields();
                                datadisplay();
                                displaystock();
                                displaytodaystock();

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



            $("#todaystocktbl").on("click", ".edit-button", function (event) {
                event.preventDefault(); // Prevent default behavior
                $('#stockmodal').modal('hide');

                var row = $(this).closest("tr");
                var id = $(this).data("id");
     

             
                var qty = row.find("td:nth-child(3)").text();
                $("#id1").val(id);


                $("#qtya").val(qty);

                document.getElementById('dropee').style.display = 'none';

                document.getElementById('submitbtn1').style.display = 'none';
                document.getElementById('editbtn1').style.display = 'none';
                document.getElementById('editbtn11').style.display = 'inline-block';
                document.getElementById('deletebtn1').style.display = 'none';

            
                $('#stockmodal').modal('show');


            });
            displaytodaystock();
            function displaytodaystock() {
                $.ajax({
                    url: 'items.aspx/displaytodaystock',
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        console.log(response)


                        $("#todaystocktbl tbody").empty();

                        for (var i = 0; i < response.d.length; i++) {
                            var id = response.d[i].StockID;
                            var ItemName = response.d[i].ItemName;
                            
                            
                            var StockDate = response.d[i].StockDate;
                            var QuantityAvailable = response.d[i].QuantityAvailable;
                            var QuantitySold = response.d[i].QuantitySold;
                            var QuantityRemaining = response.d[i].QuantityRemaining;
                            





                            $("#todaystocktbl tbody").append(
                                "<tr>" +
                                "<td>" + ItemName + "</td>" +
                                "<td>" + StockDate + "</td>" +
                                "<td>" + QuantityAvailable + "</td>" +
                                "<td>" + QuantitySold + "</td>" +
                                "<td>" + QuantityRemaining + "</td>" +
                                "<td>" +
                                '<a class="me-3 edit-button" data-id="' + id + '">' +
                                '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                                '</a>' +
                                '<a class="me-3 delete-btn" data-id="' + id + '">' +
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


            function submitstock() {
                // Clear previous error messages
                document.getElementById('itemname1').textContent = "";
                document.getElementById('price1').textContent = "";

                var itemdrop = $("#itemdrop").val();
           /*     var date = $("#date").val();*/
                var qtya = $("#qtya").val();
           
                // Validate the form values
                let isValid = true;

                // Uncomment and adjust validation as necessary
                 if (itemdrop.trim() === "") {
                     document.getElementById('itemname1').textContent = "Please select an item.";
                     isValid = false;
                 }
                 //if (date.trim() === "") {
                 //    document.getElementById('price1').textContent = "Please enter a valid date.";
                 //    isValid = false;
                 //}
                 if (qtya.trim() === "" || isNaN(qtya)) {
                     document.getElementById('price1').textContent = "Please enter a valid quantity.";
                     isValid = false;
                 }

                // If all validations pass, proceed with AJAX call
                if (isValid) {
                    $.ajax({
                        url: 'items.aspx/submitstock',
                        data: JSON.stringify({ 'itemdrop': itemdrop, 'qtya': qtya }),
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
                                displaytodaystock();
                                getitem();
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

            displaystock();
            function displaystock() {
                $.ajax({
                    url: 'items.aspx/displaystock',
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        console.log(response)


                        $("#datatable1 tbody").empty();

                        for (var i = 0; i < response.d.length; i++) {
                            var ItemName = response.d[i].ItemName;
                            var StockDate = response.d[i].StockDate;
                            var QuantityAvailable = response.d[i].QuantityAvailable;
                            var QuantitySold = response.d[i].QuantitySold;
                            var QuantityRemaining = response.d[i].QuantityRemaining;
                            var StockID = response.d[i].StockID;
                            




                            $("#datatable1 tbody").append(
                                "<tr>" +
                                "<td>" + ItemName + "</td>" +
                                "<td>" + StockDate + "</td>" +
                                "<td>" + QuantityAvailable + "</td>" +
                                "<td>" + QuantitySold + "</td>" +
                                "<td>" + QuantityRemaining + "</td>" +
                                "<td>" +
                                     
                                '<a class="me-3 -btn btn-success send-btn" data-id="' + StockID + '">' +
                            '   <button class=" btn btn-success" >Send</button>  ' +
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

















            function startnextday() {
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
                            url: 'items.aspx/startnextday',
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

                                    displaytodaystock();
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
                });


           
            }

        </script>
</asp:Content>
