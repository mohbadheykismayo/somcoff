using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static somcoffe.add_category;

namespace somcoffe
{
    public partial class items : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class itemclass
        {
            public string ItemID;
            public string ItemName;
            public string CategoryID;
            public string CategoryName;
            public string Section;
            public string Price;



        }

        [WebMethod]
        public static itemclass[] datadisplay()
        {
            List<itemclass> details = new List<itemclass>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
        select * from Items
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    itemclass field = new itemclass();
                    field.ItemID = dr["ItemID"].ToString();

                    field.ItemName = dr["ItemName"].ToString();

                    field.CategoryID = dr["CategoryID"].ToString();

                    field.Section = dr["Section"].ToString();

                    field.Price = dr["Price"].ToString();


                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static List<ListItem> getcat()
        {
            string query = "  select * from Categories";
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
                                Value = sdr["CategoryId"].ToString(),
                                Text = sdr["CategoryName"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }

        [WebMethod]
        public static string submititem(string itemname, string price, string section, string catdrop)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into patient table
                    string catquery = "INSERT INTO Items (ItemName,CategoryID,Section,Price) VALUES (@itemname,@catdrop,@section,@price);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@itemname", itemname);
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@section", section);
                        cmd.Parameters.AddWithValue("@catdrop", catdrop);

                        cmd.ExecuteNonQuery();

                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions and return the error message
                return "Error in submitdata method: " + ex.Message;
            }
        }


        [WebMethod]
        public static string updateitem(string itemname, string price, string section, string id, string catdrop)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update the item in the Items table
                    string catquery = "UPDATE Items SET ItemName = @itemname, CategoryID = @catdrop, Section = @section, Price = @price WHERE ItemID = @id;";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@itemname", itemname);
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@section", section);
                        cmd.Parameters.AddWithValue("@catdrop", catdrop);
                        cmd.Parameters.AddWithValue("@id", id);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions and return the error message
                return "Error in submititem method: " + ex.Message;
            }
        }

        public class itemstock
        {
            public string ItemName;
            public string StockDate;
            public string QuantityAvailable;
            public string QuantitySold;
            public string QuantityRemaining;
            public string StockID;


        }
                  [WebMethod]
        public static itemstock[] displaystock()
        {
            List<itemstock> details = new List<itemstock>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
          select Items.ItemName,Item_Stock.StockID, Item_Stock.StockDate,Item_Stock.QuantityAvailable,Item_Stock.QuantitySold,Item_Stock.QuantityRemaining from Item_Stock
	inner join Items  on Items.ItemID = Item_Stock.ItemID

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    itemstock field = new itemstock();
                    field.ItemName = dr["ItemName"].ToString();
                    field.StockID = dr["StockID"].ToString();
                    

                    field.StockDate = dr["StockDate"].ToString();

                    field.QuantityAvailable = dr["QuantityAvailable"].ToString();

                    field.QuantitySold = dr["QuantitySold"].ToString();

                    field.QuantityRemaining = dr["QuantityRemaining"].ToString();


                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }






        [WebMethod]
        public static itemstock[] displaytodaystock()
        {
            List<itemstock> details = new List<itemstock>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
  
	SELECT 
    Items.ItemName,
    Item_Stock.StockID,
    Item_Stock.StockDate,
    Item_Stock.QuantityAvailable,
    Item_Stock.QuantitySold,
    Item_Stock.QuantityRemaining
FROM 
    Item_Stock
INNER JOIN 
    Items ON Items.ItemID = Item_Stock.ItemID
WHERE 
    CONVERT(DATE, Item_Stock.StockDate) = CONVERT(DATE, GETDATE());


        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    itemstock field = new itemstock();
                    field.ItemName = dr["ItemName"].ToString();
                    field.StockID = dr["StockID"].ToString();


                    field.StockDate = dr["StockDate"].ToString();

                    field.QuantityAvailable = dr["QuantityAvailable"].ToString();

                    field.QuantitySold = dr["QuantitySold"].ToString();

                    field.QuantityRemaining = dr["QuantityRemaining"].ToString();


                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }

        [WebMethod]
        public static List<ListItem> getitem()
        {
            string query = "SELECT ItemID, ItemName \r\nFROM Items\r\nWHERE ItemID NOT IN (\r\n    SELECT ItemID \r\n    FROM Item_Stock\r\n);\r\n";
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
                                Value = sdr["ItemID"].ToString(),
                                Text = sdr["ItemName"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }

        [WebMethod]
        public static string submitstock(string itemdrop, string qtya)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                

                    // Adjust the query to insert the parsed date
                    string catquery = "INSERT INTO Item_Stock (ItemID, QuantityAvailable, QuantityRemaining) VALUES (@itemdrop, @qtya, @qtya);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@itemdrop", itemdrop);
                        cmd.Parameters.AddWithValue("@qtya", qtya);
         // Insert the parsed DateTime object

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (SqlException sqlEx)
            {
                return $"SQL Error: {sqlEx.Message}";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }







        [WebMethod]
        public static string updateitemstock(string id, string qty)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

               

                    // Adjust the query to insert the parsed date
                    string catquery = "UPDATE Item_Stock SET QuantityAvailable = @qtya WHERE StockID = @id;";


                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                 
                        cmd.Parameters.AddWithValue("@qtya", qty);
                        cmd.Parameters.AddWithValue("@id", id);  // Insert the parsed DateTime object

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (SqlException sqlEx)
            {
                return $"SQL Error: {sqlEx.Message}";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }
















        [WebMethod]
        public static string startnextday()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string catquery = "\r\n\r\n\r\n-- First, we need to get the aggregated results from the SELECT query\r\n-- We will use these results to update the Item_Stock table\r\n\r\n" +
                        "-- Aggregated results query\r\nWITH AggregatedStock AS (\r\n    SELECT \r\n        Items.ItemID,       -- Include ItemID to match with the INSERT\r\n        MAX(Items.Price) AS Price,\r\n  " +
                        "      MAX(Item_Stock.StockDate) AS StockDate,\r\n   " +
                        "     SUM(Item_Stock.QuantitySold) AS QuantitySold,\r\n   " +
                        "     SUM(Item_Stock.QuantityRemaining) AS QuantityRemaining\r\n    FROM \r\n     " +
                        "   Item_Stock\r\n    INNER JOIN \r\n        Items ON Items.ItemID = Item_Stock.ItemID\r\n   " +
                        " GROUP BY \r\n        Items.ItemID\r\n)\r\n\r\n" +
                        "-- Use the aggregated results to insert into the Item_Stock table\r\n" +
                        "INSERT INTO Item_Stock (ItemID, StockDate, QuantityAvailable, QuantitySold, QuantityRemaining)\r\nSELECT \r\n    ItemID,\r\n    GETDATE(),      " +
                        "      -- Set StockDate to the current date and time\r\n    0,                   -- Reset QuantityAvailable to 0\r\n    QuantitySold,        -- Use aggregated QuantitySold\r\n " +
                        "   QuantityRemaining    -- Use aggregated QuantityRemaining\r\nFROM \r\n    AggregatedStock;\r\n\r\n\r\n";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
           

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (SqlException sqlEx)
            {
                return $"SQL Error: {sqlEx.Message}";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }


    }
}