using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static somcoffe.items;

namespace somcoffe
{
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
Items.CategoryID = @search   AND CAST(Item_Stock.StockDate AS DATE) = CAST(GETDATE() AS DATE)
GROUP BY 
    Items.ItemName
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
Items.Section = @search   AND CAST(Item_Stock.StockDate AS DATE) = CAST(GETDATE() AS DATE)
GROUP BY 
    Items.ItemName

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






                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }


















        [WebMethod]
        public static string TakeOrder(List<OrderItem> order, int? customerId, int? amountPaid, int? employeeId)
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
                                                    VALUES (@CustomerID, @EmployeeID,  GETDATE(), @TotalAmount)", conn))
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
                        cmd1.Parameters.AddWithValue("@EmployeeID", employeeId.HasValue ? (object)customerId.Value : DBNull.Value);
                        cmd1.Parameters.AddWithValue("@creditamount", amountPaid.HasValue ? (object)amountPaid.Value : DBNull.Value);
                        cmd1.Parameters.AddWithValue("@OrderID", orderId);

                        cmd1.ExecuteScalar();
                    }
                }














                // Insert each item into the Order_Items table and update Item_Stock
                foreach (var item in order)
                {
                    // Insert into Order_Items table
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Order_Items (OrderID, ItemID, Quantity, SubTotalAmount) VALUES (@OrderID, @ItemID, @Quantity, @SubTotalAmount)", conn))
                    {
                        cmd.Parameters.AddWithValue("@OrderID", orderId);
                        cmd.Parameters.AddWithValue("@ItemID", item.ItemID);
                        cmd.Parameters.AddWithValue("@Quantity", item.Quantity);
                        cmd.Parameters.AddWithValue("@SubTotalAmount", item.SubTotalAmount);

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
  
  select * from Orders


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
	   Order_Items.OrderItemID,
    Order_Items.Quantity,
	   Orders.OrderID,
    Order_Items.SubTotalAmount,
    Items.ItemName,
    Item_Stock.QuantitySold,
   Item_Stock.QuantityRemaining,
	Items.Price,
	Item_Stock.StockID
FROM Orders 
INNER JOIN Order_Items ON Orders.OrderID = Order_Items.OrderID
INNER JOIN Items ON Order_Items.ItemID = Items.ItemID
INNER JOIN Item_Stock ON Items.ItemID = Item_Stock.ItemID
WHERE Order_Items.OrderID = @id
AND CAST(Item_Stock.StockDate AS DATE) = CAST(GETDATE() AS DATE);
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
                        






                        details.Add(field);
                    }
                }
            }

            return details.ToArray();
        }























        [WebMethod]
        public static string takeOrder7(OrderData[] orders)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Begin a transaction
                    SqlTransaction transaction = con.BeginTransaction();

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


                                // Update the order 
                                using (SqlCommand cmd = new SqlCommand(@"
                                UPDATE Orders
                                SET TotalAmount = @TotalAmount
                            
                                WHERE OrderID = @OrderID;", con, transaction))
                                {
                               
                                    cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);
                                    cmd.Parameters.AddWithValue("@OrderID", order.orderin);
                                    cmd.ExecuteNonQuery();
                                }
                                // Update the stock based on the quantity difference
                                using (SqlCommand cmd = new SqlCommand(@"
                                UPDATE Item_Stock
                                SET QuantitySold = QuantitySold + @QuantityDifference,
                                    QuantityRemaining = QuantityRemaining - @QuantityDifference
                                WHERE StockID = @StockID ;", con, transaction))
                                {
                                    cmd.Parameters.AddWithValue("@QuantityDifference", quantityDifference);
                                    cmd.Parameters.AddWithValue("@StockID", order.stockID);
                                    cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
                                    cmd.ExecuteNonQuery();
                                }
                            }
                            else
                            {
                                // Insert new order item
                                using (SqlCommand cmd = new SqlCommand(@"
                                INSERT INTO Order_Items (OrderID, ItemID, Quantity, SubTotalAmount)
                                VALUES (@OrderID, @ItemID, @Quantity, @SubTotalAmount);", con, transaction))
                                {
                                    cmd.Parameters.AddWithValue("@OrderID", order.orderin);
                                    cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
                                    cmd.Parameters.AddWithValue("@Quantity", order.Quantity);
                                    cmd.Parameters.AddWithValue("@SubTotalAmount", order.SubTotalAmount);
                                    cmd.ExecuteNonQuery();
                                }

                                // Update the order 
                                using (SqlCommand cmd = new SqlCommand(@"
                                UPDATE Orders
                                SET TotalAmount = @TotalAmount
                            
                                WHERE OrderID = @OrderID;", con, transaction))
                                {

                                    cmd.Parameters.AddWithValue("@TotalAmount", order.TotalAmount);
                                    cmd.Parameters.AddWithValue("@OrderID", order.orderin);
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
                                    cmd.Parameters.AddWithValue("@StockID", order.stockID);
                                    cmd.Parameters.AddWithValue("@ItemID", order.ItemID);
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }

                        // Commit the transaction after processing all items
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        // Rollback the transaction if an error occurs
                        transaction.Rollback();
                        return "Error: " + ex.Message;
                    }
                }

                return "Order processed successfully!";
            }
            catch (Exception ex)
            {
                return "Error: " + ex.Message;
            }
        }


        public class OrderData
        {
            public int? OrderItemID { get; set; }
            public int orderin { get; set; }
            public int ItemID { get; set; }
            public int stockID { get; set; }
            public int Quantity { get; set; }
            public decimal SubTotalAmount { get; set; }
            public decimal TotalAmount { get; set; }
            
        }





    }
}