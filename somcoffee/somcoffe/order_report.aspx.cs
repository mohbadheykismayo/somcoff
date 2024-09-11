using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static somcoffe.items;

namespace somcoffe
{
    public partial class order_report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class dailyorderreport
        {
            public string OrderDate;
            public string TotalCombinedAmountPerDay;
            public string TotalAmountPerDay;
            public string totalcredits;

        }
        [WebMethod]
        public static dailyorderreport[] dailyorder()
        {
            List<dailyorderreport> details = new List<dailyorderreport>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
   SELECT 
    CAST(Orders.OrderDateTime AS DATE) AS OrderDate, 
    SUM(COALESCE(Credits.CreditAmount, 0)) AS TotalCredits, 
    SUM(COALESCE(Orders.TotalAmount, 0)) AS TotalAmountPerDay,
    SUM(COALESCE(Orders.TotalAmount, 0)) - SUM(COALESCE(Credits.CreditAmount, 0)) AS TotalCombinedAmountPerDay
FROM 
    Orders
LEFT JOIN 
    Credits ON Orders.OrderID = Credits.OrderID

GROUP BY 
    CAST(Orders.OrderDateTime AS DATE)
ORDER BY 
    OrderDate;
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dailyorderreport field = new dailyorderreport();
                    field.OrderDate = dr["OrderDate"].ToString();
                    field.totalcredits = dr["TotalCredits"].ToString();


                    field.TotalAmountPerDay = dr["TotalAmountPerDay"].ToString();

                    field.TotalCombinedAmountPerDay = dr["TotalCombinedAmountPerDay"].ToString();




                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }

        public class orderreport
        {
            public string OrderDateTime;
            public string CustomerName;
            public string EmployeeName;

            public string CreditAmount;
            public string TotalAmount;
            public string TotalCombinedAmount;
            public string OrderID;
            public string ItemName;
            public string Quantity;
            public string SubTotalAmount;
            public string image;



        }


        [WebMethod]
        public static orderreport[] datadisplay()
        {
            List<orderreport> details = new List<orderreport>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  



		
	SELECT 
    Orders.OrderDateTime, 
    Customers.CustomerName, 
    Employees.EmployeeName, 
Credits.CreditAmount,
    Orders.TotalAmount,
COALESCE(Orders.TotalAmount, 0) - COALESCE(Credits.CreditAmount, 0) AS TotalCombinedAmount
FROM 
    Orders
LEFT JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
		LEFT JOIN 
    Credits ON Customers.CustomerID = Credits.CustomerID
LEFT JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID
LEFT JOIN 
    Bookings ON Orders.BookingID = Bookings.BookingID;

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    orderreport field = new orderreport();
                    field.OrderDateTime = dr["OrderDateTime"].ToString();

                    field.CustomerName = dr["CustomerName"].ToString();

                    field.EmployeeName = dr["EmployeeName"].ToString();

                    field.CreditAmount = dr["CreditAmount"].ToString();

                    field.TotalAmount = dr["TotalAmount"].ToString();
                    field.TotalCombinedAmount = dr["TotalCombinedAmount"].ToString();


                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }




        [WebMethod]
        public static orderreport[] dailyreports(string id)
        {
            List<orderreport> details = new List<orderreport>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  

	

	SELECT 
    DISTINCT(Orders.OrderID), 
    Orders.OrderDateTime, 
    Customers.CustomerName, 
    Employees.EmployeeName, 
    COALESCE(Credits.CreditAmount, 0) AS CreditAmount,
    COALESCE(Orders.TotalAmount, 0) AS TotalAmount,
    COALESCE(Orders.TotalAmount, 0) - COALESCE(Credits.CreditAmount, 0) AS TotalCombinedAmount
FROM 
    Orders
		inner JOIN 
    Order_Items ON Orders.OrderID = Order_Items.OrderID
LEFT JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN 
    Credits ON Orders.OrderID = Credits.OrderID
LEFT JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID

WHERE 
    CAST(Orders.OrderDateTime AS DATE) = @id;
        ", con);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    orderreport field = new orderreport();
                    field.OrderDateTime = dr["OrderDateTime"].ToString();

                    field.CustomerName = dr["CustomerName"].ToString();

                    field.EmployeeName = dr["EmployeeName"].ToString();

                    field.CreditAmount = dr["CreditAmount"].ToString();

                    field.TotalAmount = dr["TotalAmount"].ToString();
                    field.TotalCombinedAmount = dr["TotalCombinedAmount"].ToString();

                    field.OrderID = dr["OrderID"].ToString();
                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }







        [WebMethod]
        public static orderreport[] itemreport(string id)
        {
            List<orderreport> details = new List<orderreport>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  

	SELECT 
	Items.image,
	Items.ItemName,
	Order_Items.Quantity,
		Order_Items.SubTotalAmount,
    Orders.OrderDateTime, 
    Customers.CustomerName, 
    Employees.EmployeeName

 
FROM 
    Orders
LEFT JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN 
    Employees ON Orders.EmployeeID = Employees.EmployeeID

	LEFT JOIN  Order_Items ON Orders.OrderID = Order_Items.OrderID
		LEFT JOIN  Items ON Order_Items.ItemID = Items.ItemID

WHERE  Orders.OrderID = @id
        ", con);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    orderreport field = new orderreport();
                    field.ItemName = dr["ItemName"].ToString();

                    field.Quantity = dr["Quantity"].ToString();

                    field.SubTotalAmount = dr["SubTotalAmount"].ToString();

                    field.OrderDateTime = dr["OrderDateTime"].ToString();

                    field.CustomerName = dr["CustomerName"].ToString();
                    field.EmployeeName = dr["EmployeeName"].ToString();

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
            } // Connection will be automatically closed here

            return details.ToArray();
        }










        public class theitems
        {


            public string StockDate;
            public string TotalQuantityAvailable;
            public string TotalQuantitySold;
            public string TotalQuantityRemaining;
            public string ItemName;
            public string Section;
            public string Price;
            public string TotalSalesAmount;
            public string image;
        }



        [WebMethod]
        public static theitems[] itemstock()
        {
            List<theitems> details = new List<theitems>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
      SELECT 
    CAST(Item_Stock.StockDate AS DATE) AS StockDate, 

    SUM(Item_Stock.QuantityAvailable) AS TotalQuantityAvailable,
    SUM(Item_Stock.QuantitySold) AS TotalQuantitySold,
    SUM(Item_Stock.QuantityRemaining) AS TotalQuantityRemaining
FROM 
    Item_Stock
GROUP BY 
    CAST(Item_Stock.StockDate AS DATE)

ORDER BY 
    StockDate
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    theitems field = new theitems();
                    field.StockDate = dr["StockDate"].ToString();
                    field.TotalQuantityAvailable = dr["TotalQuantityAvailable"].ToString();


                    field.TotalQuantitySold = dr["TotalQuantitySold"].ToString();

                    field.TotalQuantityRemaining = dr["TotalQuantityRemaining"].ToString();




                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }





        [WebMethod]
        public static theitems[] dailystockitemreport(string id)
        {
            List<theitems> details = new List<theitems>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  




	SELECT 
    CAST(Item_Stock.StockDate AS DATE) AS StockDate, 
   Items.image,
    Items.ItemName,
    Items.Section,
    Items.Price,
    SUM(Item_Stock.QuantityAvailable) AS TotalQuantityAvailable,
    SUM(Item_Stock.QuantitySold) AS TotalQuantitySold,
    SUM(Item_Stock.QuantityRemaining) AS TotalQuantityRemaining,
    SUM(Items.Price * Item_Stock.QuantitySold) AS TotalSalesAmount
FROM 
    Item_Stock
LEFT JOIN 
    Items ON Item_Stock.ItemID = Items.ItemID
WHERE 
    CAST(Item_Stock.StockDate AS DATE) = @id
GROUP BY 
    CAST(Item_Stock.StockDate AS DATE),
    Items.ItemName,
    Items.Section,
   Items.image,
    Items.Price
ORDER BY 
    StockDate, 
    Items.Section,
    Items.Price,
    Items.image,
    Items.ItemName;
        ", con);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    theitems field = new theitems();
                    field.StockDate = dr["StockDate"].ToString();
                    field.TotalQuantityAvailable = dr["TotalQuantityAvailable"].ToString();

                    field.ItemName = dr["ItemName"].ToString();
                    field.Price = dr["Price"].ToString();
                    field.Section = dr["Section"].ToString();
                    field.TotalQuantitySold = dr["TotalQuantitySold"].ToString();

                    field.TotalQuantityRemaining = dr["TotalQuantityRemaining"].ToString();

                    field.TotalSalesAmount = dr["TotalSalesAmount"].ToString();
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
            } // Connection will be automatically closed here

            return details.ToArray();
        }


    }
}