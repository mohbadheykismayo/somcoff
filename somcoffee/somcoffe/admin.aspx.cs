using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static somcoffe.add_details;

namespace somcoffe
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class deyn
        {
            public string EmployeeName;
            public string CustomerName;
            public string CreditAmount;
            public string OrderDateTime;
            public string TotalAmount;
            public string OrderID;











        }

        [WebMethod]
        public static deyn[] displaydeyn()
        {
            List<deyn> details = new List<deyn>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
select Orders.OrderID,   Customers.CustomerName,Employees.EmployeeName,Credits.CreditAmount,Orders.OrderDateTime,Orders.TotalAmount  from Credits
inner join Customers on Credits.CustomerID = Credits.CustomerID
inner join Employees on Credits.IssuedByEmployeeID = Employees.EmployeeID
inner join Orders on Credits.OrderID= Orders.OrderID

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    deyn field = new deyn();
                    field.EmployeeName = dr["EmployeeName"].ToString();
                    field.CustomerName = dr["CustomerName"].ToString();
                    field.CreditAmount = dr["CreditAmount"].ToString();
                    field.OrderDateTime = dr["OrderDateTime"].ToString();
                    field.TotalAmount = dr["TotalAmount"].ToString();

                    field.OrderID = dr["OrderID"].ToString();





                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }








        public class tuur
        {
            public string ItemName;
            public string quantity;
            public string SubTotalAmount;
            public string date;

        }



        [WebMethod]
        public static tuur[] displaydelete()
        {
            List<tuur> details = new List<tuur>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
	select items.ItemName, deleteditems.quantity , deleteditems.SubTotalAmount ,deleteditems.date  from deleteditems
	inner join	Items on deleteditems.ItemID = Items.ItemID 

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    tuur field = new tuur();
                    field.ItemName = dr["ItemName"].ToString();
                    field.quantity = dr["quantity"].ToString();
                    field.SubTotalAmount = dr["SubTotalAmount"].ToString();
                    field.date = dr["date"].ToString();
               




                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }







        [WebMethod]
        public static string deleteemploy(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM Employees WHERE EmployeeID = @id";

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
                throw new Exception("Lama Tuuri Karo");
            }
        }





        [WebMethod]
        public static string updateemploy(string employname, string number, string username, string password, string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update the item in the Items table
                    string catquery = "UPDATE Employees SET EmployeeName = @employname, ContactInfo = @number,username = @username, password = @password WHERE EmployeeID = @id;";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@employname", employname);
                        cmd.Parameters.AddWithValue("@number", number);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);
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



        [WebMethod]
        public static string submitemploy(string employname, string number, string username, string password)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string catquery = "INSERT INTO Employees (EmployeeName, ContactInfo,username,password) VALUES (@employname, @number ,@username,@password);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@employname", employname);
                        cmd.Parameters.AddWithValue("@number", number);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);



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