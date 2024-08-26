<%@ Page Title="" Language="C#" MasterPageFile="~/homepage.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="somcoffe.order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<!-- Modal -->
<div class="modal fade" id="catmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Edit Order</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="row">
              <div class="col-6">
                                          <div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
           <input style="display:none" id="orderin" />
<label>Category</label>
<select class="select" id="catdrop1">

</select>
</div>
</div>
              </div>
              <div class="col-6">
                            <div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label> Status</label>
<select class="select" id="drinkdrop1">
    <option value="0">Please Select </option>
<option value="Drinks">Drinks</option>
<option value="Fast Food">Fast Food</option>
</select>
</div>
</div>
              </div>
                

          </div>
    
             <div class="col-12">
       <div class="row" id="orderslist1"></div>
   </div>
<div id="selectedItemsContainer1">
    <!-- This is where the selected items will be displayed -->
    <div id="selectedItemsList1">
        <!-- Items will be dynamically appended here -->
    </div>

    <!-- Overall total price -->
    <div class="total-price-container1">
        <strong>Total Price: $<span id="totalPrice1">0.00</span></strong>
    </div>

            <div>
    <input type="checkbox" id="isCreditOrder1" /> Credit Order
</div>
<div id="creditDetails1" style="display: none;">
    <label for="customerID1">Customer:</label>
    <select class="form-control" id="customerID1">
        <option value="">Select Customer</option>
        <!-- Add customer options here -->
    </select>
    
    <label for="employeeID1">Employee:</label>
    <select class="form-control" id="employeeID1">
   
        <!-- Add employee options here -->
    </select>
    
    <label for="amountPaid">Amount Paid:</label>
    <input class="form-control" type="number" id="amountPaid1" min="0" step="0.01" value="0.00" />
</div>
    <!-- Action buttons -->
    <div class="action-buttons">
        <button id="takeOrderBtn" class="btn btn-success">Take Order</button>
        <button id="clearSelectionBtn" class="btn btn-warning">Clear Selection</button>
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

    <div class="card">
<div class="card-body">
<div class="row">
 <div class="col-6">
     <div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label>Category</label>
<select class="select" id="catdrop">

</select>
</div>
</div>
 </div>
    <div class="col-6">
        
<div class="col-lg-3 col-sm-6 col-12">
<div class="form-group">
<label> Status</label>
<select class="select" id="drinkdrop">
    <option value="0">Please Select </option>
<option value="Drinks">Drinks</option>
<option value="Fast Food">Fast Food</option>
</select>
</div>
</div>

  
    </div>




</div>
<div class="row">
    <div class="col-6">
        <div class="row" id="orderslist"></div>
    </div>

    <div class="col-6">
        
<!-- Selected Items Container -->
<div id="selectedItemsList"></div>

<!-- Total Price -->
<div>Total Price: $<span id="totalPrice">0.00</span></div>

        <div>
    <input type="checkbox" id="isCreditOrder" /> Credit Order
</div>
<div id="creditDetails" style="display: none;">
    <label for="customerID">Customer:</label>
    <select class="form-control" id="customerID">
        <option value="">Select Customer</option>
        <!-- Add customer options here -->
    </select>
    
    <label for="employeeID">Employee:</label>
    <select class="form-control" id="employeeID">
        <option value="">Select Employee</option>
        <!-- Add employee options here -->
    </select>
    
    <label for="amountPaid">Amount Paid:</label>
    <input class="form-control" type="number" id="amountPaid" min="0" step="0.01" value="0.00" />
</div>

        <br />
<!-- Clear Button -->
<button id="clearSelection" class="btn btn-danger">Clear All Selections</button>
<button id="takeOrder" class="btn btn-success" style="display: none;">Take Order</button>




        <br />
        <br />
        <br />
        <h1> Recent Orders</h1>
        <div class="row">
            <div class="col-12">
                
<div class="table-responsive">
<table class="table  " id="todaystocktbl">
<thead>
<tr>

    <th>Order ID</th>
<th>Order Date</th>


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
</div>
        <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script>
        //$(document).ready(function () {
        //    let selectedItems = {}; // Object to store selected items

        //    $('#catdrop').change(function () {
        //        var search = $(this).val();

        //        $.ajax({
        //            url: 'order.aspx/orderlist',
        //            data: JSON.stringify({ 'search': search }),
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {
        //                const data = response.d;
        //                const container = $('#orderslist');
        //                container.empty();

        //                data.forEach(item => {
        //                    // Check if item is already selected
        //                    const isChecked = selectedItems[item.ItemName] ? 'checked' : '';
        //                    const itemHtml = `
        //                <div class="col-lg-4 col-sm-4">
        //                    <div class="productset flex-fill">
        //                        <div class="productsetcontent">
        //                            <input type="checkbox" class="item-checkbox" data-item-name="${item.ItemName}" data-item-quantity="${item.QuantityRemaining}" data-item-price="${item.Price || '0'}" ${isChecked} />
        //                            <h3>${item.ItemName}</h3>
        //                            <h4>${item.QuantityRemaining}</h4>
        //                            <h4>${item.Price || 'N/A'}</h4>
        //                        </div>
        //                    </div>
        //                </div>
        //            `;
        //                    container.append(itemHtml);
        //                });

        //                $('.item-checkbox').change(function () {
        //                    const itemName = $(this).data('item-name');
        //                    if ($(this).is(':checked')) {
        //                        selectedItems[itemName] = {
        //                            maxQuantity: $(this).data('item-quantity'),
        //                            price: parseFloat($(this).data('item-price'))
        //                        };
        //                    } else {
        //                        delete selectedItems[itemName];
        //                    }
        //                    updateSelectedItems();
        //                });
        //            },
        //            error: function (response) {
        //                alert(response.responseText);
        //            }
        //        });
        //    });

        //    function updateSelectedItems() {
        //        const selectedItemsContainer = $('#selectedItemsList');
        //        selectedItemsContainer.empty();

        //        let overallTotalPrice = 0;

        //        for (const [itemName, itemDetails] of Object.entries(selectedItems)) {
        //            const { maxQuantity, price } = itemDetails;

        //            const selectedItemHtml = `
        //        <div class="selected-item">
        //            <h5>${itemName}</h5>
        //            <div>
        //                Quantity: <input type="number" class="quantity-input" value="1" min="1" max="${maxQuantity}" />
        //                Price per unit: $<span class="price">${price.toFixed(2)}</span>
        //                <button class="increment-btn">+</button>
        //                <button class="decrement-btn">-</button>
        //                <span class="total-price">Total: $${price.toFixed(2)}</span>
        //                <button class="remove-item btn btn-danger">Remove</button>
        //            </div>
        //        </div>
        //    `;

        //            selectedItemsContainer.append(selectedItemHtml);
        //            overallTotalPrice += price; // Initial total price when quantity is 1
        //        }

        //        $('#totalPrice').text(overallTotalPrice.toFixed(2));

        //        // Attach events to increment and decrement buttons
        //        $('.increment-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const maxQuantity = parseInt(quantityInput.attr('max'));
        //            const currentQuantity = parseInt(quantityInput.val());
        //            const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
        //            quantityInput.val(newQuantity);
        //            updateTotalPrice($(this).parent());
        //            updateOverallTotalPrice();
        //        });

        //        $('.decrement-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const currentQuantity = parseInt(quantityInput.val());
        //            if (currentQuantity > 1) {
        //                quantityInput.val(currentQuantity - 1);
        //                updateTotalPrice($(this).parent());
        //                updateOverallTotalPrice();
        //            }
        //        });

        //        $('.remove-item').click(function (e) {
        //            e.preventDefault();
        //            const itemName = $(this).siblings('h5').text();
        //            $(this).closest('.selected-item').remove();
        //            delete selectedItems[itemName]; // Remove item from selectedItems
        //            updateOverallTotalPrice();
        //            // Uncheck the corresponding checkbox
        //            $(`.item-checkbox[data-item-name="${itemName}"]`).prop('checked', false);
        //        });
        //    }

        //    function updateTotalPrice(parentElement) {
        //        const quantity = parseInt(parentElement.find('.quantity-input').val());
        //        const pricePerUnit = parseFloat(parentElement.find('.price').text());
        //        const totalPrice = (quantity * pricePerUnit).toFixed(2);
        //        parentElement.find('.total-price').text(`Total: $${totalPrice}`);
        //    }

        //    function updateOverallTotalPrice() {
        //        let total = 0;
        //        $('#selectedItemsList .selected-item').each(function () {
        //            const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
        //            total += totalPrice;
        //        });
        //        $('#totalPrice').text(total.toFixed(2));
        //    }

        //    $('#clearSelection').click(function (e) {
        //        e.preventDefault(); // Prevent default button action
        //        $('#selectedItemsList').empty();
        //        $('#totalPrice').text('0.00');
        //        selectedItems = {}; // Clear selected items object
        //        $('.item-checkbox').prop('checked', false);
        //    });
        //});



        displaytodaystock();
        function displaytodaystock() {
            $.ajax({
                url: 'order.aspx/stockorder',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#todaystocktbl tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var OrderID = response.d[i].OrderID;
                        var OrderDateTime = response.d[i].OrderDateTime;
                    



                        $("#todaystocktbl tbody").append(
                            "<tr>" +
                            "<td>" + OrderID + "</td>" +
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



    //    $(document).ready(function () {
    //        let selectedItems = {}; // Object to store selected items

    //        // Generic function to handle AJAX requests
    //        function handleAjaxRequest(url, dropdownSelector) {
    //            const search = $(dropdownSelector).val();

     
    //            $.ajax({
    //                url: url,
    //                data: JSON.stringify({ 'search': search }),
    //                dataType: "json",
    //                type: 'POST',
    //                contentType: "application/json",
    //                success: function (response) {
    //                    const data = response.d;
    //                    const container = $('#orderslist');
    //                    container.empty();

    //                    data.forEach(item => {
    //                        // Check if item is already selected
    //                        const isChecked = selectedItems[item.ItemID] ? 'checked' : '';
    //                        const itemHtml = `
    //            <div class="col-lg-4 col-sm-4">
    //                <div class="productset flex-fill">
    //                    <div class="productsetcontent">
    //                        <input type="checkbox" class="item-checkbox" data-item-id="${item.ItemID}" data-item-name="${item.ItemName}" data-item-quantity="${item.QuantityRemaining}" data-item-price="${item.Price || '0'}" data-stock-id="${item.StockID}" ${isChecked} />
    //                        <h3>${item.ItemName}</h3>
    //                        <h4>${item.QuantityRemaining}</h4>
    //                        <h4>${item.Price || 'N/A'}</h4>
    //                    </div>
    //                </div>
    //            </div>
    //        `;
    //                        container.append(itemHtml);
    //                    });

    //                    $('.item-checkbox').change(function () {
    //                        const itemID = $(this).data('item-id');
    //                        const itemName = $(this).data('item-name');
    //                        const stockID = $(this).data('stock-id');
    //                        if ($(this).is(':checked')) {
    //                            selectedItems[itemID] = {
    //                                name: itemName,
    //                                stockID: stockID,
    //                                maxQuantity: $(this).data('item-quantity'),
    //                                price: parseFloat($(this).data('item-price')),
    //                                quantity: 1 // default quantity
    //                            };
    //                        } else {
    //                            delete selectedItems[itemID];
    //                        }
    //                        updateSelectedItems();
    //                    });
    //                },
    //                error: function (response) {
    //                    alert(response.responseText);
    //                }
    //            });

    //        }

    //        // Handle category drop-down change
    //        $('#catdrop').change(function () {
    //            handleAjaxRequest('order.aspx/orderlist', '#catdrop');
    //        });

    //        // Handle drink drop-down change
    //        $('#drinkdrop').change(function () {
    //            handleAjaxRequest('order.aspx/drinkdrop', '#drinkdrop');
    //        });

    //        function updateSelectedItems() {
    //            const selectedItemsContainer = $('#selectedItemsList');
    //         //   selectedItemsContainer.empty();

    //            let overallTotalPrice = 0;

    //            for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
    //                const { name, stockID, maxQuantity, price, quantity } = itemDetails;

    //                const selectedItemHtml = `
    //        <div class="selected-item">
    //            <h5>${name}</h5>
    //            <div>
    //                Quantity: <input type="number" class="quantity-input" value="${quantity}" min="1" max="${maxQuantity}" data-item-id="${itemID}" />
    //                Price per unit: $<span class="price">${price.toFixed(2)}</span>
    //                <button class="increment-btn">+</button>
    //                <button class="decrement-btn">-</button>
    //                <span class="total-price">Total: $${(quantity * price).toFixed(2)}</span>
    //                <button class="remove-item btn btn-danger">Remove</button>
    //            </div>
    //        </div>
    //    `;

    //                selectedItemsContainer.append(selectedItemHtml);
    //                overallTotalPrice += quantity * price;
    //            }

    //            $('#totalPrice').text(overallTotalPrice.toFixed(2));

    //            $('.quantity-input').change(function () {
    //                const itemID = $(this).data('item-id');
    //                const newQuantity = parseInt($(this).val());
    //                selectedItems[itemID].quantity = newQuantity;
    //                updateTotalPrice($(this).parent());
    //                updateOverallTotalPrice();
    //            });

    //            // Attach events to increment and decrement buttons
    //            $('.increment-btn').click(function (e) {
    //                e.preventDefault();
    //                const quantityInput = $(this).siblings('.quantity-input');
    //                const maxQuantity = parseInt(quantityInput.attr('max'));
    //                const currentQuantity = parseInt(quantityInput.val());
    //                const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
    //                quantityInput.val(newQuantity);
    //                const itemID = quantityInput.data('item-id');
    //                selectedItems[itemID].quantity = newQuantity;
    //                updateTotalPrice($(this).parent());
    //                updateOverallTotalPrice();
    //            });

    //            $('.decrement-btn').click(function (e) {
    //                e.preventDefault();
    //                const quantityInput = $(this).siblings('.quantity-input');
    //                const currentQuantity = parseInt(quantityInput.val());
    //                if (currentQuantity > 1) {
    //                    quantityInput.val(currentQuantity - 1);
    //                    const itemID = quantityInput.data('item-id');
    //                    selectedItems[itemID].quantity = currentQuantity - 1;
    //                    updateTotalPrice($(this).parent());
    //                    updateOverallTotalPrice();
    //                }
    //            });

    //            $('.remove-item').click(function (e) {
    //                e.preventDefault();
    //                const itemID = $(this).siblings('.quantity-input').data('item-id');
    //                $(this).closest('.selected-item').remove();
    //                delete selectedItems[itemID];
    //                updateOverallTotalPrice();
    //                $(`.item-checkbox[data-item-id="${itemID}"]`).prop('checked', false);
    //            });
    //        }

    //        function updateTotalPrice(parentElement) {
    //            const quantity = parseInt(parentElement.find('.quantity-input').val());
    //            const pricePerUnit = parseFloat(parentElement.find('.price').text());
    //            const totalPrice = (quantity * pricePerUnit).toFixed(2);
    //            parentElement.find('.total-price').text(`Total: $${totalPrice}`);
    //        }

    //        function updateOverallTotalPrice() {
    //            let total = 0;
    //            $('#selectedItemsList .selected-item').each(function () {
    //                const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
    //                total += totalPrice;
    //            });
    //            $('#totalPrice').text(total.toFixed(2));
    //        }

    //        $('#clearSelection').click(function (e) {
    //            e.preventDefault(); // Prevent default button action
    //            $('#selectedItemsList').empty();
    //            $('#totalPrice').text('0.00');
    //            selectedItems = {}; // Clear selected items object
    //            $('.item-checkbox').prop('checked', false);
    //        });


    //        // Toggle visibility of credit order details
    //        $('#isCreditOrder').change(function () {
    //            if ($(this).is(':checked')) {
    //                $('#creditDetails').show();
    //            } else {
    //                $('#creditDetails').hide();
    //            }
    //        });
 

    //        $('#takeOrder').click(function (e) {
    //            e.preventDefault(); // Prevent page refresh

    //            const isCreditOrder = $('#isCreditOrder').is(':checked'); // Check if order is credit

    //            // Conditionally assign values based on isCreditOrder
    //            const customerId = isCreditOrder ? $('#customerID').val() : null;
    //            const employeeId = isCreditOrder ? $('#employeeID').val() : null;
    //            const bookingId = isCreditOrder ? $('#bookingID').val() : null;
    //            const amountPaid = isCreditOrder ? parseFloat($('#amountPaid').val()) || 0 : null; // Get amount paid or null if not credit order

    //            const totalPrice = parseFloat($('#totalPrice').text()) || 0; // Get total price

    //            let printContent = `
    //    <img src="assets/img/logo.png" alt="SomCoffe Logo"/>
    //    <h2>SomCoffe</h2>
    //    <h2>SomCoffe Kismayo, Somalia</h2>
    //    <h2>EVC: *712*0614020290*${totalPrice.toFixed(2)}#</h2>
    //    <h2>E-DAHAB: *712*0624020290*${totalPrice.toFixed(2)}#</h2>
    //    <hr>
    //    <p>Customer ID: ${customerId || 'N/A'}</p>
    //    <p>Employee ID: ${employeeId || 'N/A'}</p>
    //    <p>Booking ID: ${bookingId || 'N/A'}</p>
    //    <p>Credit Order: ${isCreditOrder ? 'Yes' : 'No'}</p>
    //    <p>Amount Paid: $${amountPaid !== null ? amountPaid.toFixed(2) : 'N/A'}</p>
    //    <table border="1" cellpadding="5" cellspacing="0">
    //        <thead>
    //            <tr>
    //                <th>Item Name</th>
    //                <th>Quantity</th>
    //                <th>Price per Unit</th>
    //                <th>SubTotal</th>
    //            </tr>
    //        </thead>
    //        <tbody>`;

    //            const orderData = [];
    //            for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
    //                orderData.push({
    //                    ItemID: itemID,
    //                    StockID: itemDetails.stockID, // Include StockID
    //                    Quantity: itemDetails.quantity,
    //                    SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2)
    //                });

    //                // Add item details to the print content
    //                printContent += `
    //            <tr>
    //                <td>${itemDetails.name}</td>
    //                <td>${itemDetails.quantity}</td>
    //                <td>$${itemDetails.price.toFixed(2)}</td>
    //                <td>$${(itemDetails.quantity * itemDetails.price).toFixed(2)}</td>
    //            </tr>`;
    //            }

    //            printContent += `
    //        </tbody>
    //    </table>
    //    <p>Total: $${totalPrice.toFixed(2)}</p>
    //`;

    //            // Open a new window for printing
    //            const printWindow = window.open('', '_blank');
    //            printWindow.document.write(`
    //    <html>
    //    <head>
    //        <title>Print Order</title>
    //        <style>
    //            table {
    //                width: 100%;
    //                border-collapse: collapse;
    //            }
    //            th, td {
    //                padding: 10px;
    //                text-align: left;
    //                border: 1px solid black;
    //            }
    //        </style>
    //    </head>
    //    <body>
    //        ${printContent}
    //    </body>
    //    </html>
    //`);
    //            printWindow.document.close();
    //            printWindow.print();

    //            // Prepare the data object to be sent to the server
    //            const dataToSend = {
    //                order: orderData,
    //                customerId: customerId,
    //                employeeId: employeeId,
    //                isCreditOrder: isCreditOrder, // Always include isCreditOrder
    //                amountPaid: amountPaid // Include amountPaid as null or a value
    //            };

    //            console.log(orderData);
    //            console.log(dataToSend);

    //            $.ajax({
    //                url: 'order.aspx/takeOrder',
    //                data: JSON.stringify(dataToSend),
    //                dataType: "json",
    //                type: 'POST',
    //                contentType: "application/json; charset=utf-8", // Add charset for proper encoding
    //                success: function (response) {
    //                    alert(response.d); // Display the success message from the server
    //                },
    //                error: function (response) {
    //                    alert('Error placing the order: ' + response.responseText);
    //                }
    //            });
    //        });


    //    });



        $(document).ready(function () {
            let selectedItems = {}; // Object to store selected items
            $('#takeOrder').hide();
            // Generic function to handle AJAX requests
            function handleAjaxRequest(url, dropdownSelector) {
                const search = $(dropdownSelector).val();

                $.ajax({
                    url: url,
                    data: JSON.stringify({ 'search': search }),
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        const data = response.d;
                        const container = $('#orderslist');
                        container.empty();

                        data.forEach(item => {
                            // Check if item is already selected
                            const isChecked = selectedItems[item.ItemID] ? 'checked' : '';
                            const itemHtml = `
                        <div class="col-lg-4 col-sm-4">
                            <div class="productset flex-fill">
                                <div class="productsetcontent">
                                    <input type="checkbox" class="item-checkbox" data-item-id="${item.ItemID}" data-item-name="${item.ItemName}" data-item-quantity="${item.QuantityRemaining}" data-item-price="${item.Price || '0'}" data-stock-id="${item.StockID}" ${isChecked} />
                                    <h3>${item.ItemName}</h3>
                                    <h4>${item.QuantityRemaining}</h4>
                                    <h4>${item.Price || 'N/A'}</h4>
                                </div>
                            </div>
                        </div>
                    `;
                            container.append(itemHtml);
                        });

                        $('.item-checkbox').change(function () {
                            const itemID = $(this).data('item-id');
                            const itemName = $(this).data('item-name');
                            const stockID = $(this).data('stock-id');
                            if ($(this).is(':checked')) {
                                selectedItems[itemID] = {
                                    name: itemName,
                                    stockID: stockID,
                                    maxQuantity: $(this).data('item-quantity'),
                                    price: parseFloat($(this).data('item-price')),
                                    quantity: 1 // default quantity
                                };
                            } else {
                                delete selectedItems[itemID];
                           
                            }
                            updateSelectedItems();
                            toggleTakeOrderButton();
                        });
                    },
                    error: function (response) {
                        alert('Error: ' + response.responseText);
                    }
                });
            }

            // Handle category drop-down change
            $('#catdrop').change(function () {
                handleAjaxRequest('order.aspx/orderlist', '#catdrop');
            });

            // Handle drink drop-down change
            $('#drinkdrop').change(function () {
                handleAjaxRequest('order.aspx/drinkdrop', '#drinkdrop');
            });

            function updateSelectedItems() {
                const selectedItemsContainer = $('#selectedItemsList');
                selectedItemsContainer.empty();

                let overallTotalPrice = 0;

                for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
                    const { name, stockID, maxQuantity, price, quantity } = itemDetails;

                    const selectedItemHtml = `
                <div class="selected-item">
                    <h5>${name}</h5>
                    <div>
                        Quantity: <input type="number" class="quantity-input" value="${quantity}" min="1" max="${maxQuantity}" data-item-id="${itemID}" />
                        Price per unit: $<span class="price">${price.toFixed(2)}</span>
                        <button class="increment-btn">+</button>
                        <button class="decrement-btn">-</button>
                        <span class="total-price">Total: $${(quantity * price).toFixed(2)}</span>
                        <button class="remove-item btn btn-danger">Remove</button>
                    </div>
                </div>
            `;

                    selectedItemsContainer.append(selectedItemHtml);
                    overallTotalPrice += quantity * price;
                }

                $('#totalPrice').text(overallTotalPrice.toFixed(2));

                $('.quantity-input').change(function () {
                    const itemID = $(this).data('item-id');
                    const newQuantity = parseInt($(this).val());
                    selectedItems[itemID].quantity = newQuantity;
                    updateTotalPrice($(this).parent());
                    updateOverallTotalPrice();
                });

                $('.increment-btn').click(function (e) {
                    e.preventDefault();
                    const quantityInput = $(this).siblings('.quantity-input');
                    const maxQuantity = parseInt(quantityInput.attr('max'));
                    const currentQuantity = parseInt(quantityInput.val());
                    const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
                    quantityInput.val(newQuantity);
                    const itemID = quantityInput.data('item-id');
                    selectedItems[itemID].quantity = newQuantity;
                    updateTotalPrice($(this).parent());
                    updateOverallTotalPrice();
                });

                $('.decrement-btn').click(function (e) {
                    e.preventDefault();
                    const quantityInput = $(this).siblings('.quantity-input');
                    const currentQuantity = parseInt(quantityInput.val());
                    if (currentQuantity > 1) {
                        quantityInput.val(currentQuantity - 1);
                        const itemID = quantityInput.data('item-id');
                        selectedItems[itemID].quantity = currentQuantity - 1;
                        updateTotalPrice($(this).parent());
                        updateOverallTotalPrice();
                    }
                });

                $('.remove-item').click(function (e) {
                    e.preventDefault();
                    const itemID = $(this).siblings('.quantity-input').data('item-id');
                    $(this).closest('.selected-item').remove();
                    delete selectedItems[itemID];
                    updateOverallTotalPrice();
                    $(`.item-checkbox[data-item-id="${itemID}"]`).prop('checked', false);
                });
            }

            function updateTotalPrice(parentElement) {
                const quantity = parseInt(parentElement.find('.quantity-input').val());
                const pricePerUnit = parseFloat(parentElement.find('.price').text());
                const totalPrice = (quantity * pricePerUnit).toFixed(2);
                parentElement.find('.total-price').text(`Total: $${totalPrice}`);
            }

            function updateOverallTotalPrice() {
                let total = 0;
                $('#selectedItemsList .selected-item').each(function () {
                    const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
                    total += totalPrice;
                });
                $('#totalPrice').text(total.toFixed(2));
            }
            function toggleTakeOrderButton() {
                if (Object.keys(selectedItems).length > 0) {
                    $('#takeOrder').show();  // Show the button if there are selected items
                } else {
                    $('#takeOrder').hide();  // Hide the button if no items are selected
                }
            }

            $('#clearSelection').click(function (e) {
                e.preventDefault(); // Prevent default button action
                $('#selectedItemsList').empty();
                $('#totalPrice').text('0.00');
                selectedItems = {}; // Clear selected items object
                $('.item-checkbox').prop('checked', false);
                toggleTakeOrderButton();
            });

            // Toggle visibility of credit order details
            $('#isCreditOrder').change(function () {
                if ($(this).is(':checked')) {
                    $('#creditDetails').show();
                } else {
                    $('#creditDetails').hide();
                }
            });

            $('#takeOrder').click(function (e) {
                e.preventDefault(); // Prevent page refresh

                const isCreditOrder = $('#isCreditOrder').is(':checked'); // Check if order is credit

                // Conditionally assign values based on isCreditOrder
                const customerId = isCreditOrder ? $('#customerID').val() : null;
                const employeeId = isCreditOrder ? $('#employeeID').val() : null;
                const bookingId = isCreditOrder ? $('#bookingID').val() : null;
                const amountPaid = isCreditOrder ? parseFloat($('#amountPaid').val()) || 0 : null; // Get amount paid or null if not credit order

                const totalPrice = parseFloat($('#totalPrice').text()) || 0; // Get total price

           
                // Prepare the data object to be sent to the server
                const orderData = [];
                for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
                    orderData.push({
                        ItemID: itemID,
                        StockID: itemDetails.stockID, // Include StockID
                        Quantity: itemDetails.quantity,
                        SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2)
                    });
                }

                const dataToSend = {
                    order: orderData,
                    customerId: customerId,
                    employeeId: employeeId,
                    isCreditOrder: isCreditOrder, // Always include isCreditOrder
                    amountPaid: amountPaid // Include amountPaid as null or a value
                };

           
                console.log(dataToSend);

                $.ajax({
                    url: 'order.aspx/takeOrder',
                    data: JSON.stringify(dataToSend),
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json; charset=utf-8", // Add charset for proper encoding
                    success: function (response) {
                        alert(response.d); // Display the success message from the server

                        // Print the receipt
                        let printContent = `
                <img src="assets/img/logo.png" alt="SomCoffe Logo"/>
                <h2>SomCoffe</h2>
                <h2>SomCoffe Kismayo, Somalia</h2>
                <h2>EVC: *712*0614020290*${totalPrice.toFixed(2)}#</h2>
                <h2>E-DAHAB: *712*0624020290*${totalPrice.toFixed(2)}#</h2>
                <hr>
                <p>Customer ID: ${customerId || 'N/A'}</p>
                <p>Employee ID: ${employeeId || 'N/A'}</p>
                <p>Booking ID: ${bookingId || 'N/A'}</p>
                <p>Total Price: $${totalPrice.toFixed(2)}</p>
                <table  cellpadding="5" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>`;

                        let receiptTotalPrice = 0;
                        Object.values(selectedItems).forEach(itemDetails => {
                            receiptTotalPrice += itemDetails.quantity * itemDetails.price;
                            printContent += `
                    <tr>
                        <td>${itemDetails.name}</td>
                        <td>${itemDetails.quantity}</td>
                        <td>$${itemDetails.price.toFixed(2)}</td>
                        <td>$${(itemDetails.quantity * itemDetails.price).toFixed(2)}</td>
                    </tr>`;
                        });

                        printContent += `
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="3">Total Price</th>
                            <th>$${receiptTotalPrice.toFixed(2)}</th>
                        </tr>
                    </tfoot>
                </table>`;

                        if (amountPaid > 0) {
                            printContent += `
                <p>Amount Paid: $${amountPaid.toFixed(2)}</p>
                <p>Remaining Amount: $${(receiptTotalPrice - amountPaid).toFixed(2)}</p>`;
                        }

                        printContent += `
                <br><br><br>
                <h3>Thank you for your Order!</h3>`;

                        const printWindow = window.open('', '', 'height=400,width=600');
                        printWindow.document.write('<html><head><title>Order Receipt</title>');
                        printWindow.document.write('</head><body>');
                        printWindow.document.write(printContent);
                        printWindow.document.write('</body></html>');
                        printWindow.document.close();
                        printWindow.focus();
                        printWindow.print();
                    },
                    error: function (response) {
                        alert('Error placing the order: ' + response.responseText);
                    }
                });
            });

        });





        //$(document).ready(function () {
        //    let selectedItems = {}; // Object to store selected items

        //    // Function to update selected items display
        //    function updateSelectedItems() {
        //        const selectedItemsContainer = $('#selectedItemsList');
        //        selectedItemsContainer.empty();

        //        let overallTotalPrice = 0;

        //        for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
        //            const { name, stockID, maxQuantity, price, quantity } = itemDetails;

        //            const selectedItemHtml = `
        //        <div class="selected-item">
        //            <h5>${name}</h5>
        //            <div>
        //                Quantity: <input type="number" class="quantity-input" value="${quantity}" min="1" max="${maxQuantity}" data-item-id="${itemID}" />
        //                Price per unit: $<span class="price">${price.toFixed(2)}</span>
        //                <button class="increment-btn">+</button>
        //                <button class="decrement-btn">-</button>
        //                <span class="total-price">Total: $${(quantity * price).toFixed(2)}</span>
        //                <button class="remove-item btn btn-danger">Remove</button>
        //            </div>
        //        </div>
        //    `;

        //            selectedItemsContainer.append(selectedItemHtml);
        //            overallTotalPrice += quantity * price;
        //        }

        //        $('#totalPrice').text(overallTotalPrice.toFixed(2));

        //        // Attach events to quantity inputs, increment and decrement buttons, and remove buttons
        //        $('.quantity-input').change(function () {
        //            const itemID = $(this).data('item-id');
        //            const newQuantity = parseInt($(this).val());
        //            selectedItems[itemID].quantity = newQuantity;
        //            updateTotalPrice($(this).parent());
        //            updateOverallTotalPrice();
        //        });

        //        $('.increment-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const maxQuantity = parseInt(quantityInput.attr('max'));
        //            const currentQuantity = parseInt(quantityInput.val());
        //            const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
        //            quantityInput.val(newQuantity);
        //            const itemID = quantityInput.data('item-id');
        //            selectedItems[itemID].quantity = newQuantity;
        //            updateTotalPrice($(this).parent());
        //            updateOverallTotalPrice();
        //        });

        //        $('.decrement-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const currentQuantity = parseInt(quantityInput.val());
        //            if (currentQuantity > 1) {
        //                quantityInput.val(currentQuantity - 1);
        //                const itemID = quantityInput.data('item-id');
        //                selectedItems[itemID].quantity = currentQuantity - 1;
        //                updateTotalPrice($(this).parent());
        //                updateOverallTotalPrice();
        //            }
        //        });

        //        $('.remove-item').click(function (e) {
        //            e.preventDefault();
        //            const itemID = $(this).siblings('.quantity-input').data('item-id');
        //            $(this).closest('.selected-item').remove();
        //            delete selectedItems[itemID];
        //            updateOverallTotalPrice();
        //            $(`.item-checkbox[data-item-id="${itemID}"]`).prop('checked', false);
        //        });
        //    }

        //    // Function to update total price for an item
        //    function updateTotalPrice(parentElement) {
        //        const quantity = parseInt(parentElement.find('.quantity-input').val());
        //        const pricePerUnit = parseFloat(parentElement.find('.price').text());
        //        const totalPrice = (quantity * pricePerUnit).toFixed(2);
        //        parentElement.find('.total-price').text(`Total: $${totalPrice}`);
        //    }

        //    // Function to update overall total price
        //    function updateOverallTotalPrice() {
        //        let total = 0;
        //        $('#selectedItemsList .selected-item').each(function () {
        //            const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
        //            total += totalPrice;
        //        });
        //        $('#totalPrice').text(total.toFixed(2));
        //    }

        //    // Generic function to handle AJAX requests
        //    function handleAjaxRequest(url, dropdownSelector) {
        //        const search = $(dropdownSelector).val();

        //        $.ajax({
        //            url: url,
        //            data: JSON.stringify({ 'search': search }),
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {
        //                const data = response.d;
        //                const container = $('#orderslist');
        //                container.empty();

        //                data.forEach(item => {
        //                    const isChecked = selectedItems[item.ItemID] ? 'checked' : '';
        //                    const itemHtml = `
        //                <div class="col-lg-4 col-sm-4">
        //                    <div class="productset flex-fill">
        //                        <div class="productsetcontent">
        //                            <input type="checkbox" class="item-checkbox" data-item-id="${item.ItemID}" data-item-name="${item.ItemName}" data-item-quantity="${item.QuantityRemaining}" data-item-price="${item.Price || '0'}" data-stock-id="${item.StockID}" ${isChecked} />
        //                            <h3>${item.ItemName}</h3>
        //                            <h4>${item.QuantityRemaining}</h4>
        //                            <h4>${item.Price || 'N/A'}</h4>
        //                        </div>
        //                    </div>
        //                </div>
        //            `;
        //                    container.append(itemHtml);
        //                });

        //                $('.item-checkbox').change(function () {
        //                    const itemID = $(this).data('item-id');
        //                    const itemName = $(this).data('item-name');
        //                    const stockID = $(this).data('stock-id');
        //                    if ($(this).is(':checked')) {
        //                        selectedItems[itemID] = {
        //                            name: itemName,
        //                            stockID: stockID,
        //                            maxQuantity: $(this).data('item-quantity'),
        //                            price: parseFloat($(this).data('item-price')),
        //                            quantity: 1 // default quantity
        //                        };
        //                    } else {
        //                        delete selectedItems[itemID];
        //                    }
        //                    updateSelectedItems();
        //                });
        //            },
        //            error: function (response) {
        //                alert(response.responseText);
        //            }
        //        });
        //    }

        //    // Handle category drop-down change
        //    $('#catdrop').change(function () {
        //        handleAjaxRequest('order.aspx/orderlist', '#catdrop');
        //    });

        //    // Handle drink drop-down change
        //    $('#drinkdrop').change(function () {
        //        handleAjaxRequest('order.aspx/drinkdrop', '#drinkdrop');
        //    });

        //    // Handle clear selection button
        //    $('#clearSelection').click(function (e) {
        //        e.preventDefault();
        //        $('#selectedItemsList').empty();
        //        $('#totalPrice').text('0.00');
        //        selectedItems = {}; // Clear selected items object
        //        $('.item-checkbox').prop('checked', false);
        //    });

        //    // Toggle visibility of credit order details
        //    $('#isCreditOrder').change(function () {
        //        if ($(this).is(':checked')) {
        //            $('#creditDetails').show();
        //        } else {
        //            $('#creditDetails').hide();
        //        }
        //    });

        //    // Handle order submission
        //    $('#takeOrder').click(function (e) {
        //        e.preventDefault();

        //        const isCreditOrder = $('#isCreditOrder').is(':checked'); // Check if order is credit

        //        const customerId = isCreditOrder ? $('#customerID').val() : null;
        //        const employeeId = isCreditOrder ? $('#employeeID').val() : null;
        //        const bookingId = isCreditOrder ? $('#bookingID').val() : null;
        //        const amountPaid = isCreditOrder ? parseFloat($('#amountPaid').val()) || 0 : null;

        //        const totalPrice = parseFloat($('#totalPrice').text()) || 0;

        //        // Prepare data to be sent
        //        const orderData = {
        //            items: Object.entries(selectedItems).map(([itemID, itemDetails]) => ({
        //                ItemID: itemID,
        //                StockID: itemDetails.stockID,
        //                Quantity: itemDetails.quantity,
        //                SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2)
        //            })),
        //            totalPrice: totalPrice.toFixed(2),
        //            customerId: customerId,
        //            employeeId: employeeId,
        //            bookingId: bookingId,
        //            isCreditOrder: isCreditOrder,
        //            amountPaid: amountPaid ? amountPaid.toFixed(2) : null
        //        };
        //        console.log(orderData);
        //        $.ajax({
        //            url: 'order.aspx/TakeOrder', // Update this URL to your server endpoint for saving the order
        //            data: JSON.stringify(orderData),
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {
        //                // Handle success response
        //                alert('Order has been saved successfully!');

        //                // Print the receipt
        //                let printContent = `
        //            <img src="assets/img/logo.png" alt="SomCoffe Logo"/>
        //            <h2>SomCoffe</h2>
        //            <h2>SomCoffe Kismayo, Somalia</h2>
        //            <h2>EVC: *712*0614020290*${totalPrice.toFixed(2)}#</h2>
        //            <h2>E-DAHAB: *712*0624020290*${totalPrice.toFixed(2)}#</h2>
        //            <hr>
        //            <p>Customer ID: ${customerId || 'N/A'}</p>
        //            <p>Employee ID: ${employeeId || 'N/A'}</p>
        //            <p>Booking ID: ${bookingId || 'N/A'}</p>
        //            <p>Total Price: $${totalPrice.toFixed(2)}</p>
        //        `;

        //                printContent += `
        //            <table>
        //                <thead>
        //                    <tr>
        //                        <th>Item Name</th>
        //                        <th>Quantity</th>
        //                        <th>Price</th>
        //                        <th>Total</th>
        //                    </tr>
        //                </thead>
        //                <tbody>`;

        //                let totalPrice = 0;

        //                Object.values(selectedItems).forEach(itemDetails => {
        //                    totalPrice += itemDetails.quantity * itemDetails.price;
        //                    printContent += `
        //                <tr>
        //                    <td>${itemDetails.name}</td>
        //                    <td>${itemDetails.quantity}</td>
        //                    <td>$${itemDetails.price.toFixed(2)}</td>
        //                    <td>$${(itemDetails.quantity * itemDetails.price).toFixed(2)}</td>
        //                </tr>`;
        //                });

        //                printContent += `
        //                </tbody>
        //                <tfoot>
        //                    <tr>
        //                        <th colspan="3">Total Price</th>
        //                        <th>$${totalPrice.toFixed(2)}</th>
        //                    </tr>
        //                </tfoot>
        //            </table>`;

        //                if (amountPaid > 0) {
        //                    printContent += `
        //            <p>Amount Paid: $${amountPaid.toFixed(2)}</p>
        //            <p>Remaining Amount: $${(totalPrice - amountPaid).toFixed(2)}</p>`;
        //                }

        //                printContent += `
        //            <br><br><br>
        //            <h3>Thank you for your Order!</h3>`;

        //                const printWindow = window.open('', '', 'height=400,width=600');
        //                printWindow.document.write('<html><head><title>Order Receipt</title>');
        //                printWindow.document.write('</head><body >');
        //                printWindow.document.write(printContent);
        //                printWindow.document.write('</body></html>');
        //                printWindow.document.close();
        //                printWindow.focus();
        //                printWindow.print();
        //            },
        //            error: function (response) {
        //                alert('Error saving order: ' + response.responseText);
        //            }
        //        });
        //    });
        //});


 


        $(document).ready(function () {



            $(function () {


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



            });

        });
        $(document).ready(function () {



            $(function () {


                $.ajax({
                    type: "POST",
                    url: "items.aspx/getcat",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var catdrop1 = $("[id*=catdrop1]");
                        catdrop1.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            catdrop1.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });



            });

        });
    //    $(document).ready(function () {
    //        let selectedItems = {}; // Object to store selected items

    //        $('#catdrop1').change(function () {
    //            var search = $(this).val();

    //            $.ajax({
    //                url: 'order.aspx/orderlist',
    //                data: JSON.stringify({ 'search': search }),
    //                dataType: "json",
    //                type: 'POST',
    //                contentType: "application/json",
    //                success: function (response) {
    //                    const data = response.d;

    //                    const container = $('#orderslist1');
    //                    container.empty();

    //                    data.forEach(item => {


    //                        // Check if item is already selected
    //                        const isChecked = selectedItems[item.ItemID] ? 'checked' : '';
    //                        const itemHtml = `
    //    <div class="col-lg-4 col-sm-4">
    //        <div class="productset flex-fill">
    //            <div class="productsetcontent">
    //                <input type="checkbox" class="item-checkbox"
    //                    data-item-id="${item.ItemID}"
    //                    data-item-name="${item.ItemName}"
    //                    data-item-quantity="${item.QuantityRemaining}"
    //                    data-item-price="${item.Price || '0'}"
    //                   data-stock-id="${item.StockID}"
    //                          data-order-id="${item.OrderID}"
    //                    data-order-item-id="${item.OrderItemID || ''}" ${isChecked} />
    //           <h3>${item.ItemName}</h3>
    //                <h4>${item.QuantityRemaining}</h4>
    //                <h4>${item.Price || 'N/A'}</h4>
    //            </div>
    //        </div>
    //    </div>
    //`;
    //                        container.append(itemHtml);
    //                    });

    //                    $('.item-checkbox').change(function () {
    //                        const itemID = $(this).data('item-id');
    //                        const itemName = $(this).data('item-name');
    //                        const stockID = $(this).data('stock-id');
    //                        const orderItemID = $(this).data('order-item-id');
    //                        const orderID = $(this).data('order-id'); // Corrected here

    //                        if ($(this).is(':checked')) {
    //                            selectedItems[itemID] = {
    //                                name: itemName,
    //                                stockID: stockID || null,
    //                                orderID: orderID || null, // Corrected here
    //                                orderItemID: orderItemID || null,
    //                                maxQuantity: $(this).data('item-quantity'),
    //                                price: parseFloat($(this).data('item-price')),
    //                                quantity: 1 // default quantity
    //                            };
    //                        } else {
    //                            delete selectedItems[itemID];
    //                        }
    //                        updateSelectedItems();
    //                    });



    //                },
    //                error: function (response) {
    //                    alert(response.responseText);
    //                }
    //            });
    //        });

    //        function updateSelectedItems() {
    //            const selectedItemsContainer = $('#selectedItemsList1');
    //            selectedItemsContainer.empty(); // Clears previous selection to prevent duplicates

    //            let overallTotalPrice = 0;




    //            for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
    //                const { name, stockID, OrderItemID, OrderID, maxQuantity, price, quantity } = itemDetails;

    //                const selectedItemHtml = `
    //            <div class="selected-item">
    //                <h5>${name}</h5>

    //                <div>
    //                    Quantity: <input type="number" class="quantity-input" value="${quantity}" min="1" max="${maxQuantity}" data-item-id="${itemID}" />
    //                    Price per unit: $<span class="price">${price.toFixed(2)}</span>
    //                    <button class="increment-btn">+</button>

    //                    <button class="decrement-btn">-</button>
    //                    <span class="total-price">Total: $${(quantity * price).toFixed(2)}</span>
    //                    <button class="remove-item btn btn-danger">Remove</button>
    //                </div>
    //            </div>
    //        `;

    //                selectedItemsContainer.append(selectedItemHtml);
    //                overallTotalPrice += quantity * price;
    //            }

    //            $('#totalPrice1').text(overallTotalPrice.toFixed(2));

    //            attachEventHandlers();
    //        }

    //        function attachEventHandlers() {
    //            $('.quantity-input').change(function () {
    //                const itemID = $(this).data('item-id');
    //                const newQuantity = parseInt($(this).val());
    //                selectedItems[itemID].quantity = newQuantity;
    //                updateTotalPrice($(this).parent());
    //                updateOverallTotalPrice();
    //            });

    //            $('.increment-btn').click(function (e) {
    //                e.preventDefault();
    //                const quantityInput = $(this).siblings('.quantity-input');
    //                const maxQuantity = parseInt(quantityInput.attr('max'));
    //                const currentQuantity = parseInt(quantityInput.val());
    //                const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
    //                quantityInput.val(newQuantity);
    //                const itemID = quantityInput.data('item-id');
    //                selectedItems[itemID].quantity = newQuantity;
    //                updateTotalPrice($(this).parent());
    //                updateOverallTotalPrice();
    //            });

    //            $('.decrement-btn').click(function (e) {
    //                e.preventDefault();
    //                const quantityInput = $(this).siblings('.quantity-input');
    //                const currentQuantity = parseInt(quantityInput.val());
    //                if (currentQuantity > 1) {
    //                    quantityInput.val(currentQuantity - 1);
    //                    const itemID = quantityInput.data('item-id');
    //                    selectedItems[itemID].quantity = currentQuantity - 1;
    //                    updateTotalPrice($(this).parent());
    //                    updateOverallTotalPrice();
    //                }
    //            });

    //            $('.remove-item').click(function (e) {
    //                e.preventDefault();
    //                const itemID = $(this).siblings('.quantity-input').data('item-id');
    //                $(this).closest('.selected-item').remove();
    //                delete selectedItems[itemID];
    //                updateOverallTotalPrice();
    //                $(`.item-checkbox[data-item-id="${itemID}"]`).prop('checked', false);
    //            });
    //        }

    //        function updateTotalPrice(parentElement) {
    //            const quantity = parseInt(parentElement.find('.quantity-input').val());
    //            const pricePerUnit = parseFloat(parentElement.find('.price').text());
    //            const totalPrice = (quantity * pricePerUnit).toFixed(2);
    //            parentElement.find('.total-price').text(`Total: $${totalPrice}`);
    //        }

    //        function updateOverallTotalPrice() {
    //            let total = 0;
    //            $('#selectedItemsList1 .selected-item').each(function () {
    //                const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
    //                total += totalPrice;
    //            });
    //            $('#totalPrice1').text(total.toFixed(2));
    //        }
    //        $('#clearSelectionBtn').click(function (e) {
    //            e.preventDefault(); // Prevent default button action
    //            $('#selectedItemsList1').empty();
    //            $('#totalPrice1').text('0.00');
    //            selectedItems = {}; // Clear selected items object
    //            $('.item-checkbox').prop('checked', false);
    //        });
    //        $('#takeOrderBtn').click(function (e) {
    //            e.preventDefault(); // Prevent page refresh
    //            console.log(selectedItems);
    //            const orderData = [];
    //            const customerId = $('#customerID').val() || null; // Get CustomerID or null if empty
    //            const employeeId = $('#employeeID').val() || null; // Get EmployeeID or null if empty
    //            const orderin = $('#orderin').val() || null; // Get BookingID or null if empty
    //            const TotalAmount = $('#totalPrice1').text() || null;
    //            alert(TotalAmount);
    //            for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
    //                orderData.push({
    //                    ItemID: itemID,
    //                    OrderItemID: itemDetails.OrderItemID || null, // Ensure OrderItemID is passed
    //                    orderID: itemDetails.orderID,
    //                    StockID: itemDetails.StockID, // Include StockID
    //                    Quantity: itemDetails.quantity,
    //                    SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2),
    //                    orderin: orderin,
    //                    TotalAmount: TotalAmount
    //                });
    //            }
    //            console.log(orderData);
    //            $.ajax({
    //                url: 'order.aspx/takeOrder7',
    //                data: JSON.stringify({
    //                    orders: orderData,
    //                }),
    //                dataType: "json",
    //                type: 'POST',
    //                contentType: "application/json",
    //                success: function (response) {
    //                    alert(response.d); // Display the success message from the server
    //                },
    //                error: function (response) {
    //                    alert('Error placing the order: ' + response.responseText);
    //                }
    //            });
    //        });







    //        $("#todaystocktbl").on("click", ".edit-button", function (event) {
    //            event.preventDefault(); // Prevent default behavior

    //            var row = $(this).closest("tr");
    //            var id = $(this).data("id");

    //            var orderid = row.find("td:nth-child(1)").text();
    //            $("#orderin").val(orderid);


    //            $.ajax({
    //                url: 'order.aspx/updateorder',
    //                data: JSON.stringify({ 'id': id }),
    //                dataType: "json",
    //                type: 'POST',
    //                contentType: "application/json",
    //                success: function (response) {
    //                    const data = response.d;
    //                    console.log(data);

    //                    const selectedItemsContainer = $('#selectedItemsList1');
    //                    let overallTotalPrice = parseFloat($('#totalPrice1').text()) || 0;

    //                    data.forEach(item => {
    //                        const price = parseFloat(item.Price); // Convert Price to a number

    //                        if (isNaN(price)) {
    //                            console.error(`Invalid price for item ${item.ItemName}`);
    //                            return; // Skip this item if the price is not valid
    //                        }

    //                        // Check if the item already exists in the list
    //                        const existingItemElement = selectedItemsContainer.find(`.quantity-input[data-item-id="${item.ItemID}"]`);
    //                        if (existingItemElement.length > 0) {
    //                            // Update the quantity and total price for the existing item
    //                            existingItemElement.empty();
    //                            const newQuantity = parseInt(existingItemElement.val()) + item.Quantity;
    //                            existingItemElement.val(newQuantity);
    //                            const parentElement = existingItemElement.parent();
    //                            selectedItems[item.ItemID].quantity = newQuantity;
    //                            updateTotalPrice(parentElement);
    //                        } else {
    //                            // Append new item
    //                            selectedItems[item.ItemID] = {
    //                                name: item.ItemName,
    //                                maxQuantity: item.QuantityRemaining, // This could be your saved quantity or max available
    //                                price: price,
    //                                quantity: item.Quantity,
    //                                OrderItemID: item.OrderItemID, // Assign OrderItemID here
    //                                StockID: item.StockID,
    //                                OrderID: item.OrderID
    //                            };

    //                            console.log(selectedItems);

    //                            const selectedItemHtml = `
    //            <div class="selected-item">
    //                <h5>${item.ItemName}</h5>
    //                <div>
    //                    Quantity: <input type="number" class="quantity-input" value="${item.Quantity}" min="1" max="${item.QuantityRemaining}" data-item-id="${item.ItemID}" />
    //                    Price per unit: $<span class="price">${price.toFixed(2)}</span>
    //                    <button class="increment-btn">+</button>
    //                    <button class="decrement-btn">-</button>
    //                    <span class="total-price">Total: $${(item.Quantity * price).toFixed(2)}</span>
    //                    <button class="remove-item btn btn-danger">Remove</button>
    //                </div>
    //            </div>
    //            `;
    //                            console.log(selectedItems);
    //                            selectedItemsContainer.append(selectedItemHtml);
    //                            overallTotalPrice += item.Quantity * price;
    //                        }
    //                    });

    //                    $('#totalPrice1').text(overallTotalPrice.toFixed(2));

    //                    // Re-attach event handlers as done before
    //                    attachEventHandlers();
    //                },
    //                error: function (response) {
    //                    alert(response.responseText);
    //                }
    //            });

    //            $('#catmodal').modal('show');
    //        });
    //    });


        $(document).ready(function () {



            $(function () {


                $.ajax({
                    type: "POST",
                    url: "order.aspx/getemployee",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var itemdrop = $("[id*=employeeID]");
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
                    url: "order.aspx/getemployee",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var itemdrop = $("[id*=employeeID1]");
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
                    url: "add_details.aspx/getcust",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var itemdrop = $("[id*=customerID]");
                        itemdrop.empty().append('<option selected="selected" value="0">Please select</option>');
                        $.each(r.d, function () {
                            itemdrop.append($("<option></option>").val(this['Value']).html(this['Text']));
                        });
                    }
                });



            });

        });


        $(document).ready(function () {
            let selectedItems = {}; // Object to store selected items

            // Generic function to handle AJAX requests
            function handleAjaxRequest(url, dropdownSelector) {
                const search = $(dropdownSelector).val();

                $.ajax({
                    url: url,
                    data: JSON.stringify({ search: search }),
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        const data = response.d;
                        const container = $('#orderslist1');
                        container.empty();
                        console.log(data);
                        data.forEach(item => {
                     
                            const isChecked = selectedItems[item.ItemID] ? 'checked' : '';
                            const itemHtml = `
                        <div class="col-lg-4 col-sm-4">
                            <div class="productset flex-fill">
                                <div class="productsetcontent">
                                    <input type="checkbox" class="item-checkbox" 
                                        data-item-id="${item.ItemID}" 
                                        data-item-name="${item.ItemName}" 
                                        data-item-quantity="${item.QuantityRemaining}" 
                                        data-item-price="${item.Price || '0'}" 
                                        data-stock-id="${item.StockID}" 
                                        data-order-id="${item.OrderID}" 
                                        data-order-item-id="${item.OrderItemID || ''}" ${isChecked} />
                                    <h3>${item.ItemName}</h3>
                                    <h4>${item.QuantityRemaining}</h4>
                                    <h4>${item.Price || 'N/A'}</h4>
                                </div>
                            </div>
                        </div>`;
                            container.append(itemHtml);
                        });

                  

                        attachCheckboxChangeHandlers();
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });
            }

            // Handle category drop-down change
            $('#catdrop1').change(function () {
                handleAjaxRequest('order.aspx/orderlist', '#catdrop1');
            });

            // Handle drink drop-down change
            $('#drinkdrop1').change(function () {
                handleAjaxRequest('order.aspx/drinkdrop', '#drinkdrop1');
            });

            function attachCheckboxChangeHandlers() {
                $('.item-checkbox').change(function () {
                    const itemID = $(this).data('item-id');
                    const itemName = $(this).data('item-name');
                    const StockID = $(this).data('stock-id');
                    const orderItemID = $(this).data('order-item-id');
                    const orderID = $(this).data('order-id');
                    const maxQuantity = $(this).data('item-quantity');
                    const price = parseFloat($(this).data('item-price'));

               
                    if ($(this).is(':checked')) {
                        selectedItems[itemID] = {
                            name: itemName,
                            StockID: StockID || null,
                            orderID: orderID || null,
                            orderItemID: orderItemID || null,
                            maxQuantity: maxQuantity,
                            price: price,
                            quantity: 1 // default quantity
                        };
                    } else {
                        delete selectedItems[itemID];
                    }
                    updateSelectedItems();
                });
            }

            function updateSelectedItems() {
                const selectedItemsContainer = $('#selectedItemsList1');
                selectedItemsContainer.empty(); // Clears previous selection to prevent duplicates

                let overallTotalPrice = 0;

                for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
                    const { name, StockID, orderItemID, orderID, maxQuantity, price, quantity } = itemDetails;

                    const selectedItemHtml = `
                <div class="selected-item">
                    <h5>${name}</h5>
                    <div>
                        Quantity: <input type="number" class="quantity-input" value="${quantity}" min="1" max="${maxQuantity}" data-item-id="${itemID}" />
                        Price per unit: $<span class="price">${price.toFixed(2)}</span>
                        <button class="increment-btn">+</button>
                        <button class="decrement-btn">-</button>
                        <span class="total-price">Total: $${(quantity * price).toFixed(2)}</span>
                        <button class="remove-item btn btn-danger">Remove</button>
                    </div>
                </div>`;
                    selectedItemsContainer.append(selectedItemHtml);
                    overallTotalPrice += quantity * price;
                }

                $('#totalPrice1').text(overallTotalPrice.toFixed(2));
                attachEventHandlers();
            }

            function attachEventHandlers() {
                $('.quantity-input').change(function () {
                    const itemID = $(this).data('item-id');
                    const newQuantity = parseInt($(this).val());
                    selectedItems[itemID].quantity = newQuantity;
                    updateTotalPrice($(this).parent());
                    updateOverallTotalPrice();
                });

                $('.increment-btn').click(function (e) {
                    e.preventDefault();
                    const quantityInput = $(this).siblings('.quantity-input');
                    const maxQuantity = parseInt(quantityInput.attr('max'));
                    const currentQuantity = parseInt(quantityInput.val());
                    const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
                    quantityInput.val(newQuantity);
                    const itemID = quantityInput.data('item-id');
                    selectedItems[itemID].quantity = newQuantity;
                    updateTotalPrice($(this).parent());
                    updateOverallTotalPrice();
                });

                $('.decrement-btn').click(function (e) {
                    e.preventDefault();
                    const quantityInput = $(this).siblings('.quantity-input');
                    const currentQuantity = parseInt(quantityInput.val());
                    if (currentQuantity > 1) {
                        quantityInput.val(currentQuantity - 1);
                        const itemID = quantityInput.data('item-id');
                        selectedItems[itemID].quantity = currentQuantity - 1;
                        updateTotalPrice($(this).parent());
                        updateOverallTotalPrice();
                    }
                });

                $('.remove-item').click(function (e) {
                    e.preventDefault();
                    const itemID = $(this).siblings('.quantity-input').data('item-id');
                    $(this).closest('.selected-item').remove();
                    delete selectedItems[itemID];
                    updateOverallTotalPrice();
                    $(`.item-checkbox[data-item-id="${itemID}"]`).prop('checked', false);
                });
            }

            function updateTotalPrice(parentElement) {
                const quantity = parseInt(parentElement.find('.quantity-input').val());
                const pricePerUnit = parseFloat(parentElement.find('.price').text());
                const totalPrice = (quantity * pricePerUnit).toFixed(2);
                parentElement.find('.total-price').text(`Total: $${totalPrice}`);
            }

            function updateOverallTotalPrice() {
                let total = 0;
                $('#selectedItemsList1 .selected-item').each(function () {
                    const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
                    total += totalPrice;
                });
                $('#totalPrice1').text(total.toFixed(2));
            }

            $('#clearSelectionBtn').click(function (e) {
                e.preventDefault(); // Prevent default button action
                $('#selectedItemsList1').empty();
                $('#totalPrice1').text('0.00');
                selectedItems = {}; // Clear selected items object
                $('.item-checkbox').prop('checked', false);
            });

            // Toggle visibility of credit order details
            $('#isCreditOrder1').change(function () {
                if ($(this).is(':checked')) {
                    $('#creditDetails1').show();
                } else {
                    $('#creditDetails1').hide();
                }
            });

     
            $('#takeOrderBtn').click(function (e) {
                e.preventDefault(); // Prevent page refresh
                console.log(selectedItems);

                const orderData = [];
                const customerId = $('#customerID1').val() || null; // Get CustomerID or null if empty
                const employeeId = $('#employeeID1').val() || null; // Get EmployeeID or null if empty
                const orderin = $('#orderin').val() || null; // Get BookingID or null if empty
                const TotalAmount = $('#totalPrice1').text() || null;
                const amountPaid = isCreditOrder ? parseFloat($('#amountPaid1').val()) || 0 : null;

                for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
                    orderData.push({
                        ItemID: itemID,
                        OrderItemID: itemDetails.OrderItemID || null, // Ensure OrderItemID is passed
                        orderID: itemDetails.orderID,
                        StockID: itemDetails.StockID, // Include StockID
                        Quantity: itemDetails.quantity,
                        SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2),
                        orderin: orderin,
                        TotalAmount: TotalAmount
                    });
                }
                console.log(orderData);
                alert(customerId);
                alert(employeeId);
                alert(amountPaid
);
         
                $.ajax({
                    url: 'order.aspx/takeorder7',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ orders: orderData, customerId: customerId, employeeId: employeeId, amountPaid: amountPaid }),
                    success: function (response) {
                    
                        alert("Order placed successfully");
                    },
                    error: function (error) {
                        console.log('Error placing order:', error);
                    }
                });
            });
            $("#todaystocktbl").on("click", ".edit-button", function (event) {
                    event.preventDefault(); // Prevent default behavior

                    var row = $(this).closest("tr");
                    var id = $(this).data("id");

                    var orderid = row.find("td:nth-child(1)").text();
                    $("#orderin").val(orderid);

                    $('#totalPrice1').empty();
                    $.ajax({
                        url: 'order.aspx/updateorder',
                        data: JSON.stringify({ 'id': id }),
                        dataType: "json",
                        type: 'POST',
                        contentType: "application/json",
                        success: function (response) {
                            const data = response.d;
                      

                            console.log(data);
                            document.getElementById('amountPaid1').value = data[0].CreditAmount;


                       
                            const selectedItemsContainer = $('#selectedItemsList1');
                            selectedItemsContainer.empty();
                            let overallTotalPrice = parseFloat($('#totalPrice1').text()) || 0;

                            data.forEach(item => {
                                const price = parseFloat(item.Price); // Convert Price to a number

                                if (isNaN(price)) {
                                    console.error(`Invalid price for item ${item.ItemName}`);
                                    return; // Skip this item if the price is not valid
                                }

                                // Check if the item already exists in the list
                                const existingItemElement = selectedItemsContainer.find(`.quantity-input[data-item-id="${item.ItemID}"]`);
                                if (existingItemElement.length > 0) {
                                    // Update the quantity and total price for the existing item
                                    existingItemElement.empty();
                                    const newQuantity = parseInt(existingItemElement.val()) + item.Quantity;
                                    existingItemElement.val(newQuantity);
                                    const parentElement = existingItemElement.parent();
                                    selectedItems[item.ItemID].quantity = newQuantity;
                                    updateTotalPrice(parentElement);
                                } else {
                                    // Append new item
                                    selectedItems[item.ItemID] = {
                                        name: item.ItemName,
                                        maxQuantity: item.QuantityRemaining, // This could be your saved quantity or max available
                                        price: price,
                                        quantity: item.Quantity,
                                        OrderItemID: item.OrderItemID, // Assign OrderItemID here
                                        StockID: item.StockID,
                                        OrderID: item.OrderID
                                    };

                          

                                    const selectedItemHtml = `
                        <div class="selected-item">
                            <h5>${item.ItemName}</h5>
                            <div>
                                Quantity: <input type="number" class="quantity-input" value="${item.Quantity}" min="1" max="${item.QuantityRemaining}" data-item-id="${item.ItemID}" />
                                Price per unit: $<span class="price">${price.toFixed(2)}</span>
                                <button class="increment-btn">+</button>
                                <button class="decrement-btn">-</button>
                                <span class="total-price">Total: $${(item.Quantity * price).toFixed(2)}</span>
                                <button class="remove-item btn btn-danger">Remove</button>
                            </div>
                        </div>
                        `;
                                
                                    selectedItemsContainer.append(selectedItemHtml);
                                    overallTotalPrice += item.Quantity * price;
                                }
                            });

                            $('#totalPrice1').text(overallTotalPrice.toFixed(2));

                            // Re-attach event handlers as done before
                            attachEventHandlers();
                        },
                        error: function (response) {
                            alert(response.responseText);
                        }
                    });

                    $('#catmodal').modal('show');
                });

   
        });




    


        //$(document).ready(function () {
        //    let selectedItems = {}; // Object to store selected items


        //    // Generic function to handle AJAX requests
        //    function handleAjaxRequest(url, dropdownSelector) {
        //        const search = $(dropdownSelector).val();

        //        $.ajax({
        //            url: url,
        //            data: JSON.stringify({ 'search': search }),
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {
        //                const data = response.d;
        //                const container = $('#orderslist1');
        //                container.empty();

        //                data.forEach(item => {
        //                    const isChecked = selectedItems[item.ItemID] ? 'checked' : '';
        //                    const itemHtml = `
        //                <div class="col-lg-4 col-sm-4">
        //                    <div class="productset flex-fill">
        //                        <div class="productsetcontent">
        //                            <input type="checkbox" class="item-checkbox" 
        //                                data-item-id="${item.ItemID}" 
        //                                data-item-name="${item.ItemName}" 
        //                                data-item-quantity="${item.QuantityRemaining}" 
        //                                data-item-price="${item.Price || '0'}" 
        //                                data-stock-id="${item.StockID}" 
        //                                data-order-id="${item.OrderID}" 
        //                                data-order-item-id="${item.OrderItemID || ''}" ${isChecked} />
        //                            <h3>${item.ItemName}</h3>
        //                            <h4>${item.QuantityRemaining}</h4>
        //                            <h4>${item.Price || 'N/A'}</h4>
        //                        </div>
        //                    </div>
        //                </div>
        //            `;
        //                    container.append(itemHtml);
        //                });

        //                attachCheckboxChangeHandlers();
        //            },
        //            error: function (response) {
        //                alert(response.responseText);
        //            }
        //        });
        //    }

        //    // Handle category drop-down change
        //    $('#catdrop1').change(function () {
        //        handleAjaxRequest('order.aspx/orderlist', '#catdrop1');
        //    });

        //    // Handle drink drop-down change
        //    $('#drinkdrop1').change(function () {
        //        handleAjaxRequest('order.aspx/drinkdrop', '#drinkdrop1');
        //    });


        //    function attachCheckboxChangeHandlers() {
        //        $('.item-checkbox').change(function () {
        //            const itemID = $(this).data('item-id');
        //            const itemName = $(this).data('item-name');
        //            const stockID = $(this).data('stock-id');
        //            const orderItemID = $(this).data('order-item-id');
        //            const orderID = $(this).data('order-id');
        //            const maxQuantity = $(this).data('item-quantity');
        //            const price = parseFloat($(this).data('item-price'));

        //            if ($(this).is(':checked')) {
        //                selectedItems[itemID] = {
        //                    name: itemName,
        //                    stockID: stockID || null,
        //                    orderID: orderID || null,
        //                    orderItemID: orderItemID || null,
        //                    maxQuantity: maxQuantity,
        //                    price: price,
        //                    quantity: 1 // default quantity
        //                };
        //            } else {
        //                delete selectedItems[itemID];
        //            }
        //            updateSelectedItems();
        //        });
        //    }

        //    function updateSelectedItems() {
        //        const selectedItemsContainer = $('#selectedItemsList1');
        //        selectedItemsContainer.empty(); // Clears previous selection to prevent duplicates

        //        let overallTotalPrice = 0;

        //        for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
        //            const { name, stockID, orderItemID, orderID, maxQuantity, price, quantity } = itemDetails;

        //            const selectedItemHtml = `
        //        <div class="selected-item">
        //            <h5>${name}</h5>
        //            <div>
        //                Quantity: <input type="number" class="quantity-input" value="${quantity}" min="1" max="${maxQuantity}" data-item-id="${itemID}" />
        //                Price per unit: $<span class="price">${price.toFixed(2)}</span>
        //                <button class="increment-btn">+</button>
        //                <button class="decrement-btn">-</button>
        //                <span class="total-price">Total: $${(quantity * price).toFixed(2)}</span>
        //                <button class="remove-item btn btn-danger">Remove</button>
        //            </div>
        //        </div>
        //    `;

        //            selectedItemsContainer.append(selectedItemHtml);
        //            overallTotalPrice += quantity * price;
        //        }

        //        $('#totalPrice1').text(overallTotalPrice.toFixed(2));
        //        attachEventHandlers();
        //    }

        //    function attachEventHandlers() {
        //        $('.quantity-input').change(function () {
        //            const itemID = $(this).data('item-id');
        //            const newQuantity = parseInt($(this).val());
        //            selectedItems[itemID].quantity = newQuantity;
        //            updateTotalPrice($(this).parent());
        //            updateOverallTotalPrice();
        //        });

        //        $('.increment-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const maxQuantity = parseInt(quantityInput.attr('max'));
        //            const currentQuantity = parseInt(quantityInput.val());
        //            const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
        //            quantityInput.val(newQuantity);
        //            const itemID = quantityInput.data('item-id');
        //            selectedItems[itemID].quantity = newQuantity;
        //            updateTotalPrice($(this).parent());
        //            updateOverallTotalPrice();
        //        });

        //        $('.decrement-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const currentQuantity = parseInt(quantityInput.val());
        //            if (currentQuantity > 1) {
        //                quantityInput.val(currentQuantity - 1);
        //                const itemID = quantityInput.data('item-id');
        //                selectedItems[itemID].quantity = currentQuantity - 1;
        //                updateTotalPrice($(this).parent());
        //                updateOverallTotalPrice();
        //            }
        //        });

        //        $('.remove-item').click(function (e) {
        //            e.preventDefault();
        //            const itemID = $(this).siblings('.quantity-input').data('item-id');
        //            $(this).closest('.selected-item').remove();
        //            delete selectedItems[itemID];
        //            updateOverallTotalPrice();
        //            $(`.item-checkbox[data-item-id="${itemID}"]`).prop('checked', false);
        //        });
        //    }

        //    function updateTotalPrice(parentElement) {
        //        const quantity = parseInt(parentElement.find('.quantity-input').val());
        //        const pricePerUnit = parseFloat(parentElement.find('.price').text());
        //        const totalPrice = (quantity * pricePerUnit).toFixed(2);
        //        parentElement.find('.total-price').text(`Total: $${totalPrice}`);
        //    }

        //    function updateOverallTotalPrice() {
        //        let total = 0;
        //        $('#selectedItemsList1 .selected-item').each(function () {
        //            const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
        //            total += totalPrice;
        //        });
        //        $('#totalPrice1').text(total.toFixed(2));
        //    }

        //    $('#clearSelectionBtn').click(function (e) {
        //        e.preventDefault(); // Prevent default button action
        //        $('#selectedItemsList1').empty();
        //        $('#totalPrice1').text('0.00');
        //        selectedItems = {}; // Clear selected items object
        //        $('.item-checkbox').prop('checked', false);
        //    });

        //    // Toggle visibility of credit order details
        //    $('#isCreditOrder1').change(function () {
        //        if ($(this).is(':checked')) {
        //            $('#creditDetails1').show();
        //        } else {
        //            $('#creditDetails1').hide();
        //        }
        //    });

        //    $('#takeOrderBtn').click(function (e) {
        //        e.preventDefault(); // Prevent page refresh
        //        console.log(selectedItems);

        //        const orderData = [];
        //        const customerId = $('#customerID').val() || null; // Get CustomerID or null if empty
        //        const employeeId = $('#employeeID').val() || null; // Get EmployeeID or null if empty
        //        const orderin = $('#orderin').val() || null; // Get BookingID or null if empty
        //        const TotalAmount = $('#totalPrice1').text() || null;

        //        alert(TotalAmount);

        //        for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
        //            orderData.push({
        //                ItemID: itemID,
        //                OrderItemID: itemDetails.orderItemID || null, // Ensure OrderItemID is passed
        //                orderID: itemDetails.orderID,
        //                StockID: itemDetails.stockID, // Include StockID
        //                Quantity: itemDetails.quantity,
        //                SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2),
        //                orderin: orderin,
        //                TotalAmount: TotalAmount
        //            });
        //        }
        //        console.log(orderData);

        //        $.ajax({
        //            url: 'order.aspx/takeorder7',
        //            type: 'POST',
        //            contentType: 'application/json',
        //            data: JSON.stringify({ orderData: orderData, customerId: customerId, employeeId: employeeId }),
        //            success: function (response) {
        //                console.log('Order placed successfully.');
        //            },
        //            error: function (error) {
        //                console.log('Error placing order:', error);
        //            }
        //        });
        //    });
        //    $("#todaystocktbl").on("click", ".edit-button", function (event) {
        //        event.preventDefault(); // Prevent default behavior

        //        var row = $(this).closest("tr");
        //        var id = $(this).data("id");

        //        var orderid = row.find("td:nth-child(1)").text();
        //        $("#orderin").val(orderid);

        //        $('#totalPrice1').empty();
        //        $.ajax({
        //            url: 'order.aspx/updateorder',
        //            data: JSON.stringify({ 'id': id }),
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {
        //                const data = response.d;
        //                console.log(data);

        //                const selectedItemsContainer = $('#selectedItemsList1');
        //                selectedItemsContainer.empty();
        //                let overallTotalPrice = parseFloat($('#totalPrice1').text()) || 0;

        //                data.forEach(item => {
        //                    const price = parseFloat(item.Price); // Convert Price to a number

        //                    if (isNaN(price)) {
        //                        console.error(`Invalid price for item ${item.ItemName}`);
        //                        return; // Skip this item if the price is not valid
        //                    }

        //                    // Check if the item already exists in the list
        //                    const existingItemElement = selectedItemsContainer.find(`.quantity-input[data-item-id="${item.ItemID}"]`);
        //                    if (existingItemElement.length > 0) {
        //                        // Update the quantity and total price for the existing item
        //                        existingItemElement.empty();
        //                        const newQuantity = parseInt(existingItemElement.val()) + item.Quantity;
        //                        existingItemElement.val(newQuantity);
        //                        const parentElement = existingItemElement.parent();
        //                        selectedItems[item.ItemID].quantity = newQuantity;
        //                        updateTotalPrice(parentElement);
        //                    } else {
        //                        // Append new item
        //                        selectedItems[item.ItemID] = {
        //                            name: item.ItemName,
        //                            maxQuantity: item.QuantityRemaining, // This could be your saved quantity or max available
        //                            price: price,
        //                            quantity: item.Quantity,
        //                            OrderItemID: item.OrderItemID, // Assign OrderItemID here
        //                            StockID: item.StockID,
        //                            OrderID: item.OrderID
        //                        };

        //                        console.log(selectedItems);

        //                        const selectedItemHtml = `
        //            <div class="selected-item">
        //                <h5>${item.ItemName}</h5>
        //                <div>
        //                    Quantity: <input type="number" class="quantity-input" value="${item.Quantity}" min="1" max="${item.QuantityRemaining}" data-item-id="${item.ItemID}" />
        //                    Price per unit: $<span class="price">${price.toFixed(2)}</span>
        //                    <button class="increment-btn">+</button>
        //                    <button class="decrement-btn">-</button>
        //                    <span class="total-price">Total: $${(item.Quantity * price).toFixed(2)}</span>
        //                    <button class="remove-item btn btn-danger">Remove</button>
        //                </div>
        //            </div>
        //            `;
        //                        console.log(selectedItems);
        //                        selectedItemsContainer.append(selectedItemHtml);
        //                        overallTotalPrice += item.Quantity * price;
        //                    }
        //                });

        //                $('#totalPrice1').text(overallTotalPrice.toFixed(2));

        //                // Re-attach event handlers as done before
        //                attachEventHandlers();
        //            },
        //            error: function (response) {
        //                alert(response.responseText);
        //            }
        //        });

        //        $('#catmodal').modal('show');
        //    });
        //});














        //$(document).ready(function () {
        //    let selectedItems = {}; // Object to store selected items

        //    // Generic function to handle AJAX requests
        //    function handleAjaxRequest(url, dropdownSelector) {
        //        const search = $(dropdownSelector).val();

        //        $.ajax({
        //            url: url,
        //            data: JSON.stringify({ 'search': search }),
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {
        //                const data = response.d;
        //                const container = $('#orderslist');
        //                container.empty();

        //                data.forEach(item => {
        //                    // Check if item is already selected
        //                    const isChecked = selectedItems[item.ItemID] ? 'checked' : '';
        //                    const itemHtml = `
        //                <div class="col-lg-4 col-sm-4">
        //                    <div class="productset flex-fill">
        //                        <div class="productsetcontent">
        //                            <input type="checkbox" class="item-checkbox" data-item-id="${item.ItemID}" data-item-name="${item.ItemName}" data-item-quantity="${item.QuantityRemaining}" data-item-price="${item.Price || '0'}" data-stock-id="${item.StockID}" ${isChecked} />
        //                            <h3>${item.ItemName}</h3>
        //                            <h4>${item.QuantityRemaining}</h4>
        //                            <h4>${item.Price || 'N/A'}</h4>
        //                        </div>
        //                    </div>
        //                </div>
        //            `;
        //                    container.append(itemHtml);
        //                });

        //                $('.item-checkbox').change(function () {
        //                    const itemID = $(this).data('item-id');
        //                    const itemName = $(this).data('item-name');
        //                    const stockID = $(this).data('stock-id');
        //                    if ($(this).is(':checked')) {
        //                        selectedItems[itemID] = {
        //                            name: itemName,
        //                            stockID: stockID,
        //                            maxQuantity: $(this).data('item-quantity'),
        //                            price: parseFloat($(this).data('item-price')),
        //                            quantity: 1 // default quantity
        //                        };
        //                    } else {
        //                        delete selectedItems[itemID];
        //                    }
        //                    updateSelectedItems();
        //                });
        //            },
        //            error: function (response) {
        //                alert('Error: ' + response.responseText);
        //            }
        //        });
        //    }

        //    // Handle category drop-down change
        //    $('#catdrop1').change(function () {
        //        handleAjaxRequest('order.aspx/orderlist', '#catdrop1');
        //    });

        //    // Handle drink drop-down change
        //    $('#drinkdrop1').change(function () {
        //        handleAjaxRequest('order.aspx/drinkdrop', '#drinkdrop1');
        //    });

        //    function updateSelectedItems() {
        //        const selectedItemsContainer = $('#selectedItemsList1');
        //        selectedItemsContainer.empty();

        //        let overallTotalPrice = 0;

        //        for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
        //            const { name, stockID, maxQuantity, price, quantity } = itemDetails;

        //            const selectedItemHtml = `
        //        <div class="selected-item">
        //            <h5>${name}</h5>
        //            <div>
        //                Quantity: <input type="number" class="quantity-input" value="${quantity}" min="1" max="${maxQuantity}" data-item-id="${itemID}" />
        //                Price per unit: $<span class="price">${price.toFixed(2)}</span>
        //                <button class="increment-btn">+</button>
        //                <button class="decrement-btn">-</button>
        //                <span class="total-price">Total: $${(quantity * price).toFixed(2)}</span>
        //                <button class="remove-item btn btn-danger">Remove</button>
        //            </div>
        //        </div>
        //    `;

        //            selectedItemsContainer.append(selectedItemHtml);
        //            overallTotalPrice += quantity * price;
        //        }

        //        $('#totalPrice1').text(overallTotalPrice.toFixed(2));

        //        $('.quantity-input').change(function () {
        //            const itemID = $(this).data('item-id');
        //            const newQuantity = parseInt($(this).val());
        //            selectedItems[itemID].quantity = newQuantity;
        //            updateTotalPrice($(this).parent());
        //            updateOverallTotalPrice();
        //        });

        //        $('.increment-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const maxQuantity = parseInt(quantityInput.attr('max'));
        //            const currentQuantity = parseInt(quantityInput.val());
        //            const newQuantity = Math.min(currentQuantity + 1, maxQuantity);
        //            quantityInput.val(newQuantity);
        //            const itemID = quantityInput.data('item-id');
        //            selectedItems[itemID].quantity = newQuantity;
        //            updateTotalPrice($(this).parent());
        //            updateOverallTotalPrice();
        //        });

        //        $('.decrement-btn').click(function (e) {
        //            e.preventDefault();
        //            const quantityInput = $(this).siblings('.quantity-input');
        //            const currentQuantity = parseInt(quantityInput.val());
        //            if (currentQuantity > 1) {
        //                quantityInput.val(currentQuantity - 1);
        //                const itemID = quantityInput.data('item-id');
        //                selectedItems[itemID].quantity = currentQuantity - 1;
        //                updateTotalPrice($(this).parent());
        //                updateOverallTotalPrice();
        //            }
        //        });

        //        $('.remove-item').click(function (e) {
        //            e.preventDefault();
        //            const itemID = $(this).siblings('.quantity-input').data('item-id');
        //            $(this).closest('.selected-item').remove();
        //            delete selectedItems[itemID];
        //            updateOverallTotalPrice();
        //            $(`.item-checkbox[data-item-id="${itemID}"]`).prop('checked', false);
        //        });
        //    }

        //    function updateTotalPrice(parentElement) {
        //        const quantity = parseInt(parentElement.find('.quantity-input').val());
        //        const pricePerUnit = parseFloat(parentElement.find('.price').text());
        //        const totalPrice = (quantity * pricePerUnit).toFixed(2);
        //        parentElement.find('.total-price').text(`Total: $${totalPrice}`);
        //    }

        //    function updateOverallTotalPrice() {
        //        let total = 0;
        //        $('#selectedItemsList .selected-item').each(function () {
        //            const totalPrice = parseFloat($(this).find('.total-price').text().replace('Total: $', ''));
        //            total += totalPrice;
        //        });
        //        $('#totalPrice').text(total.toFixed(2));
        //    }

        //    $('#clearSelection1').click(function (e) {
        //        e.preventDefault(); // Prevent default button action
        //        $('#selectedItemsList').empty();
        //        $('#totalPrice').text('0.00');
        //        selectedItems = {}; // Clear selected items object
        //        $('.item-checkbox').prop('checked', false);
        //    });

        //    // Toggle visibility of credit order details
        //    $('#isCreditOrder1').change(function () {
        //        if ($(this).is(':checked')) {
        //            $('#creditDetails').show();
        //        } else {
        //            $('#creditDetails').hide();
        //        }
        //    });

        //    $('#takeOrder').click(function (e) {
        //        e.preventDefault(); // Prevent page refresh

        //        const isCreditOrder = $('#isCreditOrder1').is(':checked'); // Check if order is credit

        //        // Conditionally assign values based on isCreditOrder
        //        const customerId = isCreditOrder ? $('#customerID').val() : null;
        //        const employeeId = isCreditOrder ? $('#employeeID').val() : null;
        //        const bookingId = isCreditOrder ? $('#bookingID').val() : null;
        //        const amountPaid = isCreditOrder ? parseFloat($('#amountPaid').val()) || 0 : null; // Get amount paid or null if not credit order

        //        const totalPrice = parseFloat($('#totalPrice').text()) || 0; // Get total price


        //        // Prepare the data object to be sent to the server
        //        const orderData = [];
        //        for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
        //            orderData.push({
        //                ItemID: itemID,
        //                StockID: itemDetails.stockID, // Include StockID
        //                Quantity: itemDetails.quantity,
        //                SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2)
        //            });
        //        }

        //        const dataToSend = {
        //            order: orderData,
        //            customerId: customerId,
        //            employeeId: employeeId,
        //            isCreditOrder: isCreditOrder, // Always include isCreditOrder
        //            amountPaid: amountPaid // Include amountPaid as null or a value
        //        };


        //        console.log(dataToSend);

        //        $.ajax({
        //            url: 'order.aspx/takeOrder8',
        //            data: JSON.stringify(dataToSend),
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json; charset=utf-8", // Add charset for proper encoding
        //            success: function (response) {
        //                alert(response.d); // Display the success message from the server

        //                // Print the receipt
        //                let printContent = `
        //        <img src="assets/img/logo.png" alt="SomCoffe Logo"/>
        //        <h2>SomCoffe</h2>
        //        <h2>SomCoffe Kismayo, Somalia</h2>
        //        <h2>EVC: *712*0614020290*${totalPrice.toFixed(2)}#</h2>
        //        <h2>E-DAHAB: *712*0624020290*${totalPrice.toFixed(2)}#</h2>
        //        <hr>
        //        <p>Customer ID: ${customerId || 'N/A'}</p>
        //        <p>Employee ID: ${employeeId || 'N/A'}</p>
        //        <p>Booking ID: ${bookingId || 'N/A'}</p>
        //        <p>Total Price: $${totalPrice.toFixed(2)}</p>
        //        <table  cellpadding="5" cellspacing="0">
        //            <thead>
        //                <tr>
        //                    <th>Item Name</th>
        //                    <th>Quantity</th>
        //                    <th>Price</th>
        //                    <th>Total</th>
        //                </tr>
        //            </thead>
        //            <tbody>`;

        //                let receiptTotalPrice = 0;
        //                Object.values(selectedItems).forEach(itemDetails => {
        //                    receiptTotalPrice += itemDetails.quantity * itemDetails.price;
        //                    printContent += `
        //            <tr>
        //                <td>${itemDetails.name}</td>
        //                <td>${itemDetails.quantity}</td>
        //                <td>$${itemDetails.price.toFixed(2)}</td>
        //                <td>$${(itemDetails.quantity * itemDetails.price).toFixed(2)}</td>
        //            </tr>`;
        //                });

        //                printContent += `
        //            </tbody>
        //            <tfoot>
        //                <tr>
        //                    <th colspan="3">Total Price</th>
        //                    <th>$${receiptTotalPrice.toFixed(2)}</th>
        //                </tr>
        //            </tfoot>
        //        </table>`;

        //                if (amountPaid > 0) {
        //                    printContent += `
        //        <p>Amount Paid: $${amountPaid.toFixed(2)}</p>
        //        <p>Remaining Amount: $${(receiptTotalPrice - amountPaid).toFixed(2)}</p>`;
        //                }

        //                printContent += `
        //        <br><br><br>
        //        <h3>Thank you for your Order!</h3>`;

        //                const printWindow = window.open('', '', 'height=400,width=600');
        //                printWindow.document.write('<html><head><title>Order Receipt</title>');
        //                printWindow.document.write('</head><body>');
        //                printWindow.document.write(printContent);
        //                printWindow.document.write('</body></html>');
        //                printWindow.document.close();
        //                printWindow.focus();
        //                printWindow.print();
        //            },
        //            error: function (response) {
        //                alert('Error placing the order: ' + response.responseText);
        //            }
        //        });
        //    });

        //});































        //        $('#takeOrder').click(function (e) {
        //            e.preventDefault(); // Prevent page refresh

        //            const orderData = [];
        //            const customerId = $('#customerID').val() || null; // Get CustomerID or null if empty
        //            const employeeId = $('#employeeID').val() || null; // Get EmployeeID or null if empty
        //            const bookingId = $('#bookingID').val() || null; // Get BookingID or null if empty
        //            const isCreditOrder = $('#isCreditOrder').is(':checked'); // Check if order is credit
        //            const amountPaid = parseFloat($('#amountPaid').val()) || 0; // Get amount paid or 0 if empty
        //            const totalPrice = parseFloat($('#totalPrice').text()) || 0; // Get total price

        //            let printContent = `
        //    <img src="assets/img/logo.png" alt="SomCoffe Logo"/>
        //    <h2>SomCoffe</h2>
        //    <h2>SomCoffe Kismayo, Somalia</h2>
        //    <h2>EVC: *712*0614020290*${totalPrice.toFixed(2)}#</h2>
        //    <h2>E-DAHAB: *712*0624020290*${totalPrice.toFixed(2)}#</h2>
        //    <hr>
        //    <p>Customer ID: ${customerId || 'N/A'}</p>
        //    <p>Employee ID: ${employeeId || 'N/A'}</p>
        //    <p>Booking ID: ${bookingId || 'N/A'}</p>
        //    <p>Credit Order: ${isCreditOrder ? 'Yes' : 'No'}</p>
        //    <p>Amount Paid: $${amountPaid.toFixed(2)}</p>
        //    <table border="1" cellpadding="5" cellspacing="0">
        //        <thead>
        //            <tr>
        //                <th>Item Name</th>
        //                <th>Quantity</th>
        //                <th>Price per Unit</th>
        //                <th>SubTotal</th>
        //            </tr>
        //        </thead>
        //        <tbody>`;

        //            for (const [itemID, itemDetails] of Object.entries(selectedItems)) {
        //                orderData.push({
        //                    ItemID: itemID,
        //                    StockID: itemDetails.stockID, // Include StockID
        //                    Quantity: itemDetails.quantity,
        //                    SubTotalAmount: (itemDetails.quantity * itemDetails.price).toFixed(2)
        //                });

        //                // Add item details to the print content
        //                printContent += `
        //        <tr>
        //            <td>${itemDetails.name}</td>
        //            <td>${itemDetails.quantity}</td>
        //            <td>$${itemDetails.price.toFixed(2)}</td>
        //            <td>$${(itemDetails.quantity * itemDetails.price).toFixed(2)}</td>
        //        </tr>`;
        //            }

        //            printContent += `
        //        </tbody>
        //    </table>
        //    <p>Total: $${totalPrice.toFixed(2)}</p>
        //`;

        //            // Open a new window for printing
        //            const printWindow = window.open('', '_blank');
        //            printWindow.document.write(`
        //    <html>
        //    <head>
        //        <title>Print Order</title>
        //        <style>
        //            table {
        //                width: 100%;
        //                border-collapse: collapse;
        //            }
        //            th, td {
        //                padding: 10px;
        //                text-align: left;
        //                border: 1px solid black;
        //            }
        //        </style>
        //    </head>
        //    <body>
        //        ${printContent}
        //    </body>
        //    </html>
        //`);
        //            printWindow.document.close();
        //            printWindow.print();

        //            // Prepare the data object to be sent to the server
        //            let dataToSend = {
        //                order: orderData,
        //                customerId: customerId,
        //                employeeId: employeeId,
        //                bookingId: bookingId,
        //                isCreditOrder: isCreditOrder,
        //                amountPaid: amountPaid
        //            };


        //            console.log(orderData);
        //            console.log(dataToSend);

        //            $.ajax({
        //                url: 'order.aspx/takeOrder',
        //                data: JSON.stringify(dataToSend),
        //                dataType: "json",
        //                type: 'POST',
        //                contentType: "application/json",
        //                success: function (response) {
        //                    alert(response.d); // Display the success message from the server
        //                },
        //                error: function (response) {
        //                    alert('Error placing the order: ' + response.responseText);
        //                }
        //            });
        //        });


    </script>
</asp:Content>
