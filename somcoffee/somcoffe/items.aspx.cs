using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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
            public string image;
            


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
    left join Categories on Items.CategoryID = Categories.CategoryID
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    itemclass field = new itemclass();
                    field.ItemID = dr["ItemID"].ToString();
                    field.CategoryName = dr["CategoryName"].ToString();
                    field.ItemName = dr["ItemName"].ToString();
                    field.CategoryID = dr["CategoryID"].ToString();
                    field.Section = dr["Section"].ToString();
                    field.Price = dr["Price"].ToString();

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


        //string itemname, string price, string section, string catdrop

        [WebMethod]
        public static string submititem(FileData data)
        {
            // Save image file to server
            string filePath = HttpContext.Current.Server.MapPath("~/Files/");
            if (!Directory.Exists(filePath))
            {
                Directory.CreateDirectory(filePath);
            }

            string fileName = Path.GetFileName(data.Name);
            string imageFilePath = Path.Combine(filePath, fileName);
            File.WriteAllBytes(imageFilePath, Convert.FromBase64String(data.Data));

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into Items table
                    string catquery = "INSERT INTO Items (ItemName, CategoryID, Section, Price, image) VALUES (@itemname, @catdrop, @section, @price, @image);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@itemname", data.itemname);
                        cmd.Parameters.AddWithValue("@price", data.price);
                        cmd.Parameters.AddWithValue("@section", data.section);

                        // Check if catdrop is null or empty and use DBNull if it is
                        if (string.IsNullOrEmpty(data.catdrop))
                        {
                            cmd.Parameters.AddWithValue("@catdrop", DBNull.Value);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("@catdrop", data.catdrop);
                        }

                        cmd.Parameters.AddWithValue("@image", File.ReadAllBytes(imageFilePath));
                        cmd.ExecuteNonQuery();
                    }
                }

                File.Delete(imageFilePath);

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions and return the error message
                return "Error in submititem method: " + ex.Message;
            }
        }

        public class FileData
        {
            public string Data { get; set; }
            public string ContentType { get; set; }
            public string ItemID;
            public string itemname;
            public string catdrop;
            public string CategoryName;
            public string section;
            public string price;

            public string Name { get; set; }










        }

        [WebMethod]
        public static string Updateitem(Itemee data1)
        {
            if (data1.Name != null)
            {
                byte[] bytes = Convert.FromBase64String(data1.Data);
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

                try
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        con.Open();

                        // Update the item in the Items table
                        string catquery = "UPDATE Items SET ItemName = @itemname, CategoryID = @catdrop, Section = @section,image=@image, Price = @price WHERE ItemID = @id;";
                        using (SqlCommand cmd = new SqlCommand(catquery, con))
                        {
                            cmd.Parameters.AddWithValue("@itemname", data1.itemname);
                            cmd.Parameters.AddWithValue("@price", data1.price);
                            cmd.Parameters.AddWithValue("@section", data1.section);
                            cmd.Parameters.AddWithValue("@catdrop", data1.catdrop);
                            cmd.Parameters.AddWithValue("@id", data1.id);
                            cmd.Parameters.AddWithValue("@image", bytes);

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
            return "File name is null.";
        }

        public class Itemee
        {
            public string id { get; set; }
            public string Data { get; set; }
            public string Name { get; set; }
            public string itemname { get; set; }
            public string price { get; set; }
            public string section { get; set; }
            public string catdrop { get; set; }
            public string image { get; set; }

        }


        public class itemstock
        {
            public string ItemName;
            public string StockDate;
            public string QuantityAvailable;
            public string QuantitySold;
            public string QuantityRemaining;
            public string StockID;
            public string image;

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

        SELECT 
		 Items.image,
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
    Item_Stock.StockDate IS NULL;


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

        [WebMethod]
        public static string deletetodaystock(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM Item_Stock WHERE StockID = @id";

                    using (SqlCommand cmd = new SqlCommand(jobQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                throw new Exception("Error deleting job", ex);
            }
        }





        [WebMethod]
        public static string deleteitem(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM Items WHERE ItemID = @id";

                    using (SqlCommand cmd = new SqlCommand(jobQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                throw new Exception("Error deleting job", ex);
            }
        }



        public class itemm
        {
            public string id { get; set; }
            public string Data { get; set; }
            public string Name { get; set; }


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
    Items.image,
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
        public static string updatetodaystock(string id, string qty)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();



                    // Adjust the query to insert the parsed date
                    string catquery = "UPDATE Item_Stock SET QuantityAvailable = @qtya,QuantityRemaining = @qtya  WHERE StockID = @id;";


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
        public static string startstockitem( string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string catquery = "\r\n\r\n\r\n\r\nWITH AggregatedStock AS (\r\n    SELECT \r\n        Items.ItemID," +
                        "                  \r\n        MAX(Items.Price) AS Price,     \r\n        MAX(Item_Stock.StockDate) AS StockDate,  \r\n  " +
                        "      SUM(Item_Stock.QuantitySold) AS QuantitySold,\r\n        SUM(Item_Stock.QuantityRemaining) AS QuantityRemaining\r\n " +
                        "   FROM \r\n        Item_Stock\r\n    INNER JOIN \r\n        Items ON Items.ItemID = Item_Stock.ItemID\r\n    WHERE\r\n    " +
                        "    Item_Stock.StockID = @id       \r\n    GROUP BY \r\n        Items.ItemID\r\n)\r\n\r\n\r\nINSERT " +
                        "INTO Item_Stock (ItemID, StockDate, QuantityAvailable, QuantitySold, QuantityRemaining)\r\nSELECT \r\n    ItemID,\r\n    GETDATE(),     " +
                        "       \r\n    0,                 \r\n    0,            \r\n    0       \r\nFROM \r\n    AggregatedStock;";
                  
                    
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);

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
                    string catquery = "WITH AggregatedStock AS (\r\n    SELECT \r\n        Items.ItemID,      " +
                        " \r\n        MAX(Items.Price) AS Price,\r\n        MAX(Item_Stock.StockDate) AS StockDate,\r\n    " +
                        "    SUM(Item_Stock.QuantitySold) AS QuantitySold,\r\n        SUM(Item_Stock.QuantityRemaining) AS QuantityRemaining\r\n   " +
                        " FROM \r\n        Item_Stock\r\n    INNER JOIN \r\n        Items ON Items.ItemID = Item_Stock.ItemID\r\n    GROUP BY \r\n   " +
                        "     Items.ItemID\r\n)\r\n\r\n\r\nINSERT INTO Item_Stock (ItemID, StockDate, QuantityAvailable, QuantitySold, QuantityRemaining)\r\nSELECT \r\n    ItemID,\r\n    GETDATE(),     " +
                        "     \r\n    0,                 \r\n    0,      \r\n    0   \r\nFROM \r\n    AggregatedStock;\r\n";
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