using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static somcoffe.add_details;
using static somcoffe.items;

namespace somcoffe
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }




        [WebMethod]
        public static List<ListItem> getemployee()
        {
            string query = "select EmployeeID,EmployeeName from Employees";
            string constr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    List<ListItem> customers = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(new ListItem
                            {
                                Value = sdr["EmployeeID"].ToString(),
                                Text = sdr["EmployeeName"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }


        public class orderslist
        {
            public string ItemName;
            public string QuantitySold;
            public string QuantityRemaining;
            public string Price;
            public string ItemID;
            public string StockID;
            public string OrderItemID;
            public string OrderID;
            public string Quantity;
            public string EmployeeName;
            public string CreditAmount;
            public string CustomerName;
            public string image;


        }
        [WebMethod]
        public static orderslist[] orderlist(string search)
        {
            List<orderslist> details = new List<orderslist>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@" 	
	 SELECT 
   Items.image,
    Items.ItemName,
    MAX(Items.ItemID) AS ItemID,
    MAX(Item_Stock.StockID) AS  StockID,
    MAX(Items.Price) AS Price,
    MAX(Item_Stock.StockDate) AS StockDate,
    SUM(Item_Stock.QuantitySold) AS QuantitySold,
    SUM(Item_Stock.QuantityRemaining) AS QuantityRemaining
FROM 
    Item_Stock
INNER JOIN 
    Items ON Items.ItemID = Item_Stock.ItemID
	WHERE 
Items.CategoryID = @search   AND CAST(Item_Stock.StockDate AS DATE) = CAST(DATEADD(HOUR, 10, GETDATE()) AS DATE)
GROUP BY 
    Items.ItemName,
   Items.image
", con);
                cmd.Parameters.AddWithValue("@search", search);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        orderslist field = new orderslist();
                        field.ItemName = dr["ItemName"].ToString();
                        field.QuantitySold = dr["QuantitySold"].ToString();
                        field.QuantityRemaining = dr["QuantityRemaining"].ToString();
                        field.Price = dr["Price"].ToString();
                        field.ItemID = dr["ItemID"].ToString();
                        field.StockID = dr["StockID"].ToString();



                        // Check if the image column is DBNull before converting
                        if (dr["image"] != DBNull.Value)
                        {
                            byte[] imageBytes = (byte[])dr["image"];
                            string base64Image = Convert.ToBase64String(imageBytes);
                            field.image = "data:image/png;base64," + base64Image; // Adjust MIME type if needed
                        }
                        else
                        {
                            // Assign a default image or leave it as null/empty
                            field.image = "data:image/png;base64,default-image-base64"; // Use a base64 placeholder if desired
                        }


                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }













        [WebMethod]
        public static orderslist[] drinkdrop(string search)
        {
            List<orderslist> details = new List<orderslist>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@" 	

		 SELECT 
Items.image,
    Items.ItemName,
    MAX(Items.ItemID) AS ItemID,
    MAX(Item_Stock.StockID) AS  StockID,
    MAX(Items.Price) AS Price,
    MAX(Item_Stock.StockDate) AS StockDate,
    SUM(Item_Stock.QuantitySold) AS QuantitySold,
    SUM(Item_Stock.QuantityRemaining) AS QuantityRemaining
FROM 
    Item_Stock
INNER JOIN 
    Items ON Items.ItemID = Item_Stock.ItemID
	WHERE 
Items.Section = @search   AND CAST(Item_Stock.StockDate AS DATE) = CAST(DATEADD(HOUR, 10, GETDATE()) AS DATE)
GROUP BY 
    Items.ItemName,
   Items.image

", con);
                cmd.Parameters.AddWithValue("@search", search);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        orderslist field = new orderslist();
                        field.ItemName = dr["ItemName"].ToString();
                        field.QuantitySold = dr["QuantitySold"].ToString();
                        field.QuantityRemaining = dr["QuantityRemaining"].ToString();
                        field.Price = dr["Price"].ToString();
                        field.ItemID = dr["ItemID"].ToString();
                        field.StockID = dr["StockID"].ToString();

                        // Check if the image column is DBNull before converting
                        if (dr["image"] != DBNull.Value)
                        {
                            byte[] imageBytes = (byte[])dr["image"];
                            string base64Image = Convert.ToBase64String(imageBytes);
                            field.image = "data:image/png;base64," + base64Image; // Adjust MIME type if needed
                        }
                        else
                        {
                            // Assign a default image or leave it as null/empty
                            field.image = "data:image/png;base64,default-image-base64"; // Use a base64 placeholder if desired
                        }




                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }




        [WebMethod]
        public static string removeItem(string orderItemID, string quantity, string stockid, string itemID, string employ)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    int price;

                    // Retrieve the SubTotalAmount for the item
                    string selecttotal = "SELECT SubTotalAmount FROM Order_Items WHERE OrderItemID = @orderItemID";

                    using (SqlCommand cmd2 = new SqlCommand(selecttotal, con))
                    {
                        cmd2.Parameters.AddWithValue("@orderItemID", orderItemID);

                        object result = cmd2.ExecuteScalar();
                        price = result != null ? Convert.ToInt32(result) : 0;
                    }

                    // Insert the deleted item information into the deleteditems table
                    string insertQuery = @"INSERT INTO deleteditems (name ,ItemID, Quantity, SubTotalAmount)
                                   VALUES (@employ,@ItemID, @Quantity, @SubTotalAmount)";

                    using (SqlCommand cmd3 = new SqlCommand(insertQuery, con))
                    {
                        cmd3.Parameters.AddWithValue("@ItemID", itemID);
                        cmd3.Parameters.AddWithValue("@Quantity", quantity);
                        cmd3.Parameters.AddWithValue("@employ", employ);
                        
                        cmd3.Parameters.AddWithValue("@SubTotalAmount", price);

                        cmd3.ExecuteNonQuery();
                    }

                    // Delete the item from the Order_Items table
                    string deleteQuery = "DELETE FROM Order_Items WHERE OrderItemID = @orderItemID";

                    using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@orderItemID", orderItemID);

                        cmd.ExecuteNonQuery();
                    }

                    // Update the Item_Stock table based on StockID and ItemID
                    string updateStockQuery = @"UPDATE Item_Stock 
                                         SET QuantityRemaining = QuantityRemaining + @Quantity,
                                             QuantitySold = QuantitySold - @Quantity
                                         WHERE StockID = @stockid";

                    using (SqlCommand cmd1 = new SqlCommand(updateStockQuery, con))
                    {
                        cmd1.Parameters.AddWithValue("@Quantity", quantity);
                        cmd1.Parameters.AddWithValue("@stockid", stockid);

                        cmd1.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Return a detailed error message
                return $"Error: {ex.Message} at line {ex.StackTrace}";
            }
        }






        [WebMethod]
        public static string TakeOrder(List<OrderItem> order, int? customerId, decimal? amountPaid, int? employeeId)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int orderId = 0;
            decimal totalAmount = 0;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();

                // Calculate the total amount for the order
                foreach (var item in order)
                {
                    totalAmount += item.SubTotalAmount;
                }

                // Insert the order into the Orders table
                using (SqlCommand cmd = new SqlCommand(@"INSERT INTO Orders (CustomerID, EmployeeID, OrderDateTime, TotalAmount)
                                                    OUTPUT INSERTED.OrderID
                                                    VALUES (@CustomerID, @EmployeeID,  DATEADD(HOUR, 10, GETDATE()), @TotalAmount)", conn))
                {
                    cmd.Parameters.AddWithValue("@CustomerID", customerId.HasValue ? (object)customerId.Value : DBNull.Value);
                    cmd.Parameters.AddWithValue("@EmployeeID", employeeId.HasValue ? (object)employeeId.Value : DBNull.Value);

                    cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);

                    orderId = (int)cmd.ExecuteScalar();
                }







                // Check if employeeId is not null before executing the SQL command
                if (customerId.HasValue)
                {
                    using (SqlCommand cmd1 = new SqlCommand(@"INSERT INTO Credits (CustomerID, CreditAmount, IssuedByEmployeeID, OrderID)
                                              VALUES (@CustomerID, @creditamount, @EmployeeID, @OrderID)", conn))
                    {
                        cmd1.Parameters.AddWithValue("@CustomerID", customerId.HasValue ? (object)customerId.Value : DBNull.Value);
                        cmd1.Parameters.AddWithValue("@EmployeeID", employeeId.HasValue ? (object)employeeId.Value : DBNull.Value);
                        cmd1.Parameters.AddWithValue("@creditamount", amountPaid.HasValue ? (object)amountPaid.Value : DBNull.Value);
                        cmd1.Parameters.AddWithValue("@OrderID", orderId);

                        cmd1.ExecuteScalar();
                    }
                }














                // Insert each item into the Order_Items table and update Item_Stock
                foreach (var item in order)
                {
                    // Insert into Order_Items table
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Order_Items (OrderID, ItemID,StockID, Quantity, SubTotalAmount) VALUES (@OrderID, @ItemID,@StockID ,@Quantity, @SubTotalAmount)", conn))
                    {
                        cmd.Parameters.AddWithValue("@OrderID", orderId);
                        cmd.Parameters.AddWithValue("@ItemID", item.ItemID);
                        cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                        cmd.Parameters.AddWithValue("@SubTotalAmount", item.SubTotalAmount);
                        cmd.Parameters.AddWithValue("@StockID", item.StockID);
                        cmd.ExecuteNonQuery();
                    }

                    // Update Item_Stock table based on StockID and ItemID
                    using (SqlCommand cmd = new SqlCommand(@"UPDATE Item_Stock 
                                                        SET QuantityRemaining = QuantityRemaining - @Quantity ,
                                                          QuantitySold = QuantitySold + @Quantity
                                                        WHERE ItemID = @ItemID AND StockID = @StockID", conn))
                    {
                        cmd.Parameters.AddWithValue("@ItemID", item.ItemID);
                        cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                        cmd.Parameters.AddWithValue("@StockID", item.StockID); // Ensure you pass StockID from client-side

                        cmd.ExecuteNonQuery();
                    }
                }
            }

            return "Order has been successfully placed with OrderID: " + orderId;
        }
        public class OrderItem
        {
            public int ItemID { get; set; }
            public int Quantity { get; set; }
            public decimal SubTotalAmount { get; set; }
            public int StockID { get; set; }
        }

        public class orderstock
        {
            public string OrderID;
            public string OrderDateTime;
        }


        [WebMethod]
        public static orderstock[] stockorder()
        {
            List<orderstock> details = new List<orderstock>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
  


SELECT DISTINCT(Orders.OrderID), Orders.OrderDateTime 
FROM Orders
INNER JOIN Order_Items ON Orders.OrderID = Order_Items.OrderID
WHERE CONVERT(date, Orders.OrderDateTime) = CONVERT(date, DATEADD(HOUR, 10, GETDATE()))
ORDER BY Orders.OrderDateTime DESC;


        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    orderstock field = new orderstock();
                    field.OrderID = dr["OrderID"].ToString();
                    field.OrderDateTime = dr["OrderDateTime"].ToString();





                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }



























        [WebMethod]
        public static orderslist[] updateorder(string id)
        {
            List<orderslist> details = new List<orderslist>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@" 	
	 	
SELECT 
    Order_Items.ItemID,
    MIN(Order_Items.OrderItemID) AS OrderItemID,
    SUM(Order_Items.Quantity) AS Quantity,
    MIN(Orders.OrderID) AS OrderID,
    SUM(Order_Items.SubTotalAmount) AS SubTotalAmount,
    MIN(Items.ItemName) AS ItemName,
    SUM(Item_Stock.QuantitySold) AS QuantitySold,
    MIN(Item_Stock.QuantityRemaining) AS QuantityRemaining,
    MIN(Items.Price) AS Price,
    MIN(Item_Stock.StockID) AS StockID,
    SUM(Credits.CreditAmount) AS CreditAmount,
    MIN(Customers.CustomerName) AS CustomerName,
    MIN(Employees.EmployeeName) AS EmployeeName
FROM Orders 
LEFT JOIN Order_Items ON Orders.OrderID = Order_Items.OrderID
LEFT JOIN Items ON Order_Items.ItemID = Items.ItemID
LEFT JOIN Item_Stock ON Order_Items.StockID = Item_Stock.StockID
LEFT JOIN Credits ON Orders.OrderID = Credits.OrderID
LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE Order_Items.OrderID = @id
GROUP BY Order_Items.ItemID



", con);
                cmd.Parameters.AddWithValue("@id", id);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        orderslist field = new orderslist();
                        field.ItemName = dr["ItemName"].ToString();
                        field.QuantitySold = dr["QuantitySold"].ToString();
                        field.QuantityRemaining = dr["QuantityRemaining"].ToString();
                        field.Price = dr["Price"].ToString();
                        field.ItemID = dr["ItemID"].ToString();
                        field.StockID = dr["StockID"].ToString();
                        field.OrderItemID = dr["OrderItemID"].ToString();
                        field.OrderID = dr["OrderID"].ToString();
                        field.Quantity = dr["Quantity"].ToString();
                        field.EmployeeName = dr["EmployeeName"].ToString();
                        field.CreditAmount = dr["CreditAmount"].ToString();
                        field.CustomerName = dr["CustomerName"].ToString();






                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }





        [WebMethod]
        public static string takeOrder7(OrderData[] orders, int customerId, int employeeId, decimal amountPaid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Begin a transaction
                    using (SqlTransaction transaction = con.BeginTransaction())
                    {
                        try
                        {
                            foreach (var order in orders)
                            {
                                if (order.OrderItemID != null)
                                {
                                    // Get the previous quantity for the order item
                                    int previousQuantity;
                                    using (SqlCommand cmd = new SqlCommand(@"
                            SELECT Quantity
                            FROM Order_Items
                            WHERE OrderItemID = @OrderItemID;", con, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@OrderItemID", order.OrderItemID);
                                        previousQuantity = (int)cmd.ExecuteScalar();
                                    }

                                    // Calculate the difference in quantity
                                    int quantityDifference = order.Quantity - previousQuantity;

                                    // Update the order item
                                    using (SqlCommand cmd = new SqlCommand(@"
                            UPDATE Order_Items
                            SET Quantity = @Quantity,
                                SubTotalAmount = @SubTotalAmount
                            WHERE OrderItemID = @OrderItemID;", con, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
                                        cmd.Parameters.AddWithValue("@SubTotalAmount", order.SubTotalAmount);
                                        cmd.Parameters.AddWithValue("@OrderItemID", order.OrderItemID);
                                        cmd.ExecuteNonQuery();
                                    }

                                    // Update the stock based on the quantity difference
                                    using (SqlCommand cmd = new SqlCommand(@"
                            UPDATE Item_Stock
                            SET QuantitySold = QuantitySold + @QuantityDifference,
                                QuantityRemaining = QuantityRemaining - @QuantityDifference
                            WHERE StockID = @StockID AND ItemID = @ItemID;", con, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@QuantityDifference", quantityDifference);
                                        cmd.Parameters.AddWithValue("@StockID", order.StockID);
                                        cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
                                        cmd.ExecuteNonQuery();
                                    }
                                }
                                else
                                {
                                    // Insert new order item
                                    using (SqlCommand cmd = new SqlCommand(@"
                            INSERT INTO Order_Items (OrderID, ItemID, StockID, Quantity, SubTotalAmount)
                            VALUES (@OrderID, @ItemID, @StockID, @Quantity, @SubTotalAmount);", con, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@OrderID", order.orderin);
                                        cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
                                        cmd.Parameters.AddWithValue("@StockID", order.StockID);
                                        cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
                                        cmd.Parameters.AddWithValue("@SubTotalAmount", order.SubTotalAmount);
                                        cmd.ExecuteNonQuery();
                                    }

                                    // Update stock for the new order item
                                    using (SqlCommand cmd = new SqlCommand(@"
                            UPDATE Item_Stock
                            SET QuantitySold = QuantitySold + @Quantity,
                                QuantityRemaining = QuantityRemaining - @Quantity
                            WHERE StockID = @StockID AND ItemID = @ItemID;", con, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
                                        cmd.Parameters.AddWithValue("@StockID", order.StockID);
                                        cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
                                        cmd.ExecuteNonQuery();
                                    }
                                }
                                // Update the order in the Orders table
                                using (SqlCommand cmd5 = new SqlCommand(@"
                            UPDATE Orders 
                            SET 
                                OrderDateTime = DATEADD(HOUR, 10, GETDATE()), 
                            
                                TotalAmount = @TotalAmount
                            WHERE OrderID = @OrderID;", con, transaction))
                                {
                                    cmd5.Parameters.AddWithValue("@OrderID", order.orderin);
                             
                                    cmd5.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);
                                    cmd5.ExecuteNonQuery();
                                }
                                // Update customer credit if customerId or employeeId is provided
                                if (customerId != 0 || employeeId != 0)
                                {
                                    // Update the order in the Orders table
                                    using (SqlCommand cmd = new SqlCommand(@"
                            UPDATE Orders 
                            SET EmployeeID = @EmployeeID, 
                                OrderDateTime = DATEADD(HOUR, 10, GETDATE()), 
                                CustomerID = @CustomerID,
                                TotalAmount = @TotalAmount
                            WHERE OrderID = @OrderID;", con, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@OrderID", order.orderin);
                                        cmd.Parameters.AddWithValue("@EmployeeID", employeeId);
                                        cmd.Parameters.AddWithValue("@CustomerID", customerId);
                                        cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);
                                        cmd.ExecuteNonQuery();
                                    }

                                    // Insert or update the credit entry
                                    int creditID;
                                    using (SqlCommand cmd = new SqlCommand(@"
                            SELECT CreditID
                            FROM Credits
                            WHERE OrderID = @OrderID;", con, transaction))
                                    {
                                        cmd.Parameters.AddWithValue("@OrderID", order.orderin);
                                        object result = cmd.ExecuteScalar();
                                        creditID = result != null ? (int)result : 0;
                                    }

                                    if (creditID > 0)
                                    {
                                        using (SqlCommand cmd = new SqlCommand(@"
                                UPDATE Credits 
                                SET CreditAmount = @CreditAmount, 
                                    IssuedByEmployeeID = @EmployeeID 
                                WHERE CreditID = @CreditID;", con, transaction))
                                        {
                                            cmd.Parameters.AddWithValue("@CreditID", creditID);
                                            cmd.Parameters.AddWithValue("@CreditAmount", amountPaid);
                                            cmd.Parameters.AddWithValue("@EmployeeID", employeeId);
                                            cmd.ExecuteNonQuery();
                                        }
                                    }
                                    else
                                    {
                                        using (SqlCommand cmd = new SqlCommand(@"
                                INSERT INTO Credits (CustomerID, CreditAmount, IssuedByEmployeeID, OrderID)
                                VALUES (@CustomerID, @CreditAmount, @EmployeeID, @OrderID);", con, transaction))
                                        {
                                            cmd.Parameters.AddWithValue("@CustomerID", customerId);
                                            cmd.Parameters.AddWithValue("@CreditAmount", amountPaid);
                                            cmd.Parameters.AddWithValue("@EmployeeID", employeeId);
                                            cmd.Parameters.AddWithValue("@OrderID", order.orderin);
                                            cmd.ExecuteNonQuery();
                                        }
                                    }
                                }
                            }

                            // Commit the transaction after processing all items
                            transaction.Commit();
                            return "Order processed successfully!";
                        }
                        catch (Exception ex)
                        {
                            // Rollback the transaction if an error occurs
                            transaction.Rollback();
                            return "Error: " + ex.Message;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }






        //[WebMethod]
        //public static string takeOrder7(OrderData[] orders, int customerId, int employeeId, int amountPaid)
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            con.Open();

        //            // Begin a transaction
        //            using (SqlTransaction transaction = con.BeginTransaction())
        //            {
        //                try
        //                {
        //                    foreach (var order in orders)
        //                    {
        //                        if (order.OrderItemID != null)
        //                        {
        //                            // Get the previous quantity for the order item
        //                            int previousQuantity;
        //                            using (SqlCommand cmd = new SqlCommand(@"
        //                        SELECT Quantity
        //                        FROM Order_Items
        //                        WHERE OrderItemID = @OrderItemID;", con, transaction))
        //                            {
        //                                cmd.Parameters.AddWithValue("@OrderItemID", order.OrderItemID);
        //                                previousQuantity = (int)cmd.ExecuteScalar();
        //                            }

        //                            // Calculate the difference in quantity
        //                            int quantityDifference = order.Quantity - previousQuantity;

        //                            // Update the order item
        //                            using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Order_Items
        //                        SET Quantity = @Quantity,
        //                            SubTotalAmount = @SubTotalAmount
        //                        WHERE OrderItemID = @OrderItemID;", con, transaction))
        //                            {
        //                                cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
        //                                cmd.Parameters.AddWithValue("@SubTotalAmount", order.SubTotalAmount);
        //                                cmd.Parameters.AddWithValue("@OrderItemID", order.OrderItemID);
        //                                cmd.ExecuteNonQuery();
        //                            }

        //                            // Update the stock based on the quantity difference
        //                            using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Item_Stock
        //                        SET QuantitySold = QuantitySold + @QuantityDifference,
        //                            QuantityRemaining = QuantityRemaining - @QuantityDifference
        //                        WHERE StockID = @StockID AND ItemID = @ItemID;", con, transaction))
        //                            {
        //                                cmd.Parameters.AddWithValue("@QuantityDifference", quantityDifference);
        //                                cmd.Parameters.AddWithValue("@StockID", order.StockID);
        //                                cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
        //                                cmd.ExecuteNonQuery();
        //                            }
        //                        }
        //                        else
        //                        {
        //                            // Insert new order item
        //                            using (SqlCommand cmd = new SqlCommand(@"
        //                        INSERT INTO Order_Items (OrderID, ItemID, StockID, Quantity, SubTotalAmount)
        //                        VALUES (@OrderID, @ItemID, @StockID, @Quantity, @SubTotalAmount);", con, transaction))
        //                            {
        //                                cmd.Parameters.AddWithValue("@OrderID", order.orderin);
        //                                cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
        //                                cmd.Parameters.AddWithValue("@StockID", order.StockID);
        //                                cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
        //                                cmd.Parameters.AddWithValue("@SubTotalAmount", order.SubTotalAmount);
        //                                cmd.ExecuteNonQuery();
        //                            }

        //                            // Update stock for the new order item
        //                            using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Item_Stock
        //                        SET QuantitySold = QuantitySold + @Quantity,
        //                            QuantityRemaining = QuantityRemaining - @Quantity
        //                        WHERE StockID = @StockID AND ItemID = @ItemID;", con, transaction))
        //                            {
        //                                cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
        //                                cmd.Parameters.AddWithValue("@StockID", order.StockID);
        //                                cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
        //                                cmd.ExecuteNonQuery();
        //                            }
        //                        }

        //                        // Update customer credit if customerId or employeeId is provided (including when they are 0)
        //                        if (customerId != 0 || employeeId != 0)
        //                        {
        //                            // Update the order in the Orders table
        //                            using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Orders 
        //                        SET EmployeeID = @EmployeeID, 
        //                            OrderDateTime = GETDATE(), 
        //                            CustomerID = @CustomerID,
        //                            TotalAmount = @TotalAmount
        //                        WHERE OrderID = @OrderID;", con, transaction))
        //                            {
        //                                cmd.Parameters.AddWithValue("@OrderID", order.orderin);
        //                                cmd.Parameters.AddWithValue("@EmployeeID", employeeId);
        //                                cmd.Parameters.AddWithValue("@CustomerID", customerId);
        //                                cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);
        //                                cmd.ExecuteNonQuery();
        //                            }





        //                                using (SqlCommand cmd1 = new SqlCommand(@"INSERT INTO Credits (CustomerID, CreditAmount, IssuedByEmployeeID, OrderID)
        //                                      VALUES (@CustomerID, @creditamount, @EmployeeID, @OrderID)", con))
        //                                {
        //                                cmd1.Parameters.AddWithValue("@EmployeeID", employeeId);
        //                                cmd1.Parameters.AddWithValue("@CustomerID", customerId);
        //                                cmd1.Parameters.AddWithValue("@CreditAmount", amountPaid);
        //                                cmd1.Parameters.AddWithValue("@OrderID", order.orderin);

        //                                cmd1.ExecuteScalar();
        //                                }









        //                            int creditID;
        //                            using (SqlCommand cmd = new SqlCommand(@"
        //                        SELECT CreditID
        //                        FROM Credits
        //                        WHERE OrderID = @OrderID;", con, transaction))
        //                            {
        //                                cmd.Parameters.AddWithValue("@OrderID", order.orderin);
        //                                object result = cmd.ExecuteScalar();
        //                                creditID = result != null ? (int)result : 0;
        //                            }

        //                            if (creditID > 0)
        //                            {
        //                                using (SqlCommand cmd = new SqlCommand(@"
        //                            UPDATE Credits 
        //                            SET CreditAmount = @CreditAmount, 
        //                                IssuedByEmployeeID = @EmployeeID 
        //                            WHERE CreditID = @CreditID;", con, transaction))
        //                                {
        //                                    cmd.Parameters.AddWithValue("@CreditID", creditID);
        //                                    cmd.Parameters.AddWithValue("@CreditAmount", amountPaid);
        //                                    cmd.Parameters.AddWithValue("@EmployeeID", employeeId);
        //                                    cmd.ExecuteNonQuery();
        //                                }
        //                            }
        //                        }
        //                    }

        //                    // Commit the transaction after processing all items
        //                    transaction.Commit();
        //                    return "Order processed successfully!";
        //                }
        //                catch (Exception ex)
        //                {
        //                    // Rollback the transaction if an error occurs
        //                    transaction.Rollback();
        //                    return "Error: " + ex.Message;
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return "Error: " + ex.Message;
        //    }
        //}







        //[WebMethod]
        //public static string takeOrder7(OrderData[] orders, int? customerId, int? employeeId, int? amountPaid)
        //{
        //    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(cs))
        //        {
        //            con.Open();

        //            // Begin a transaction
        //            SqlTransaction transaction = con.BeginTransaction();

        //            try
        //            {
        //                foreach (var order in orders)
        //                {
        //                    if (order.OrderItemID != null)
        //                    {
        //                        // Get the previous quantity for the order item
        //                        int previousQuantity;
        //                        using (SqlCommand cmd = new SqlCommand(@"
        //                        SELECT Quantity
        //                        FROM Order_Items
        //                        WHERE OrderItemID = @OrderItemID;", con, transaction))
        //                        {
        //                            cmd.Parameters.AddWithValue("@OrderItemID", order.OrderItemID);
        //                            previousQuantity = (int)cmd.ExecuteScalar();
        //                        }

        //                        // Calculate the difference in quantity
        //                        int quantityDifference = order.Quantity - previousQuantity;

        //                        // Update the order item
        //                        using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Order_Items
        //                        SET Quantity = @Quantity,
        //                            SubTotalAmount = @SubTotalAmount
        //                        WHERE OrderItemID = @OrderItemID;", con, transaction))
        //                        {
        //                            cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
        //                            cmd.Parameters.AddWithValue("@SubTotalAmount", order.SubTotalAmount);
        //                            cmd.Parameters.AddWithValue("@OrderItemID", order.OrderItemID);
        //                            cmd.ExecuteNonQuery();
        //                        }


        //                        // Update the order 
        //                        using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Orders
        //                        SET TotalAmount = @TotalAmount

        //                        WHERE OrderID = @OrderID;", con, transaction))
        //                        {

        //                            cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);
        //                            cmd.Parameters.AddWithValue("@OrderID", order.orderin);
        //                            cmd.ExecuteNonQuery();
        //                        }
        //                        // Update the stock based on the quantity difference
        //                        using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Item_Stock
        //                        SET QuantitySold = QuantitySold + @QuantityDifference,
        //                            QuantityRemaining = QuantityRemaining - @QuantityDifference
        //                        WHERE StockID = @StockID ;", con, transaction))
        //                        {
        //                            cmd.Parameters.AddWithValue("@QuantityDifference", quantityDifference);
        //                            cmd.Parameters.AddWithValue("@StockID", order.StockID);
        //                            cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
        //                            cmd.ExecuteNonQuery();
        //                        }

        //                        // Update the order in the Orders table
        //                        using (SqlCommand cmd = new SqlCommand(@"UPDATE Orders 
        //                                SET EmployeeID = @EmployeeID, 
        //                                    OrderDateTime = GETDATE(), 
        //                                    TotalAmount = @TotalAmount
        //                                OUTPUT INSERTED.OrderID
        //                                WHERE CustomerID = @CustomerID", con))
        //                        {
        //                            cmd.Parameters.AddWithValue("@CustomerID", customerId.HasValue ? (object)customerId.Value : DBNull.Value);
        //                            cmd.Parameters.AddWithValue("@EmployeeID", employeeId.HasValue ? (object)employeeId.Value : DBNull.Value);
        //                            cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);

        //                            cmd.ExecuteScalar();
        //                        }


        //                        // Check if customerId is not null before executing the SQL command
        //                        if (customerId.HasValue)
        //                        {
        //                            using (SqlCommand cmd1 = new SqlCommand(@"UPDATE Credits 
        //        SET CreditAmount = @creditamount, 
        //            IssuedByEmployeeID = @EmployeeID 
        //        WHERE CustomerID = @CustomerID 
        //        AND OrderID = @OrderID", con))
        //                            {
        //                                cmd1.Parameters.AddWithValue("@CustomerID", customerId.HasValue ? (object)customerId.Value : DBNull.Value);
        //                                cmd1.Parameters.AddWithValue("@EmployeeID", employeeId.HasValue ? (object)employeeId.Value : DBNull.Value);
        //                                cmd1.Parameters.AddWithValue("@creditamount", amountPaid.HasValue ? (object)amountPaid.Value : DBNull.Value);
        //                                cmd1.Parameters.AddWithValue("@OrderID", order.orderin);

        //                                cmd1.ExecuteNonQuery();
        //                            }
        //                        }





        //                    }
        //                    else
        //                    {
        //                        // Insert new order item
        //                        using (SqlCommand cmd = new SqlCommand(@"
        //                        INSERT INTO Order_Items (OrderID, ItemID, Quantity, SubTotalAmount)
        //                        VALUES (@OrderID, @ItemID, @Quantity, @SubTotalAmount);", con, transaction))
        //                        {
        //                            cmd.Parameters.AddWithValue("@OrderID", order.orderin);
        //                            cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
        //                            cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
        //                            cmd.Parameters.AddWithValue("@SubTotalAmount", order.SubTotalAmount);
        //                            cmd.ExecuteNonQuery();
        //                        }

        //                        // Update the order 
        //                        using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Orders
        //                        SET TotalAmount = @TotalAmount

        //                        WHERE OrderID = @OrderID;", con, transaction))
        //                        {

        //                            cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);
        //                            cmd.Parameters.AddWithValue("@OrderID", order.orderin);
        //                            cmd.ExecuteNonQuery();
        //                        }
        //                        // Update stock for the new order item
        //                        using (SqlCommand cmd = new SqlCommand(@"
        //                        UPDATE Item_Stock
        //                        SET QuantitySold = QuantitySold + @Quantity,
        //                            QuantityRemaining = QuantityRemaining - @Quantity
        //                        WHERE StockID = @StockID AND ItemID = @ItemID;", con, transaction))
        //                        {
        //                            cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
        //                            cmd.Parameters.AddWithValue("@StockID", order.StockID);
        //                            cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
        //                            cmd.ExecuteNonQuery();
        //                        }
        //                    }


        //                    // Update the order in the Orders table
        //                    using (SqlCommand cmd = new SqlCommand(@"UPDATE Orders 
        //                                SET EmployeeID = @EmployeeID, 
        //                                    OrderDateTime = GETDATE(), 
        //                                    TotalAmount = @TotalAmount
        //                                OUTPUT INSERTED.OrderID
        //                                WHERE CustomerID = @CustomerID", con))
        //                    {
        //                        cmd.Parameters.AddWithValue("@CustomerID", customerId.HasValue ? (object)customerId.Value : DBNull.Value);
        //                        cmd.Parameters.AddWithValue("@EmployeeID", employeeId.HasValue ? (object)employeeId.Value : DBNull.Value);
        //                        cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);

        //                        cmd.ExecuteScalar();
        //                    }




        //                    // Check if customerId is not null before executing the SQL command
        //                    if (customerId.HasValue)
        //                    {
        //                        using (SqlCommand cmd1 = new SqlCommand(@"UPDATE Credits 
        //        SET CreditAmount = @creditamount, 
        //            IssuedByEmployeeID = @EmployeeID 
        //        WHERE CustomerID = @CustomerID 
        //        AND OrderID = @OrderID", con))
        //                        {
        //                            cmd1.Parameters.AddWithValue("@CustomerID", customerId.HasValue ? (object)customerId.Value : DBNull.Value);
        //                            cmd1.Parameters.AddWithValue("@EmployeeID", employeeId.HasValue ? (object)employeeId.Value : DBNull.Value);
        //                            cmd1.Parameters.AddWithValue("@creditamount", amountPaid.HasValue ? (object)amountPaid.Value : DBNull.Value);
        //                            cmd1.Parameters.AddWithValue("@OrderID", order.orderin);

        //                            cmd1.ExecuteNonQuery();
        //                        }
        //                    }



        //                }

        //                // Commit the transaction after processing all items
        //                transaction.Commit();
        //            }
        //            catch (Exception ex)
        //            {
        //                // Rollback the transaction if an error occurs
        //                transaction.Rollback();
        //                return "Error: " + ex.Message;
        //            }
        //        }

        //        return "Order processed successfully!";
        //    }
        //    catch (Exception ex)
        //    {
        //        return "Error: " + ex.Message;
        //    }
        //}


        public class OrderData
        {
            public int? OrderItemID { get; set; }
            public int orderin { get; set; }
            public int ItemID { get; set; }
            public int StockID { get; set; }
            public int Quantity { get; set; }
            public decimal SubTotalAmount { get; set; }
            public decimal TotalAmount { get; set; }
            public int customerId { get; set; }
            public int employeeId { get; set; }



        }





    }
}