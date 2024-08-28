

using Microsoft.Ajax.Utilities;
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
using static somcoffe.add_details;
using static somcoffe.items;

namespace somcoffe
{
    public partial class add_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string deletebooking(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM BookingS WHERE BookingID = @id";

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
        public static string updatebooking(string id, string price, string duration, string date, string custid, string roomid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    DateTime bookdate;
                    if (!DateTime.TryParse(date, out bookdate))
                    {
                        return "Error: Invalid date format";
                    }

                    // Update the item in the Items table
                    string catquery = "UPDATE Bookings SET CustomerID = @custid,RoomID =@roomid ,BookingDateTime = @date,  Duration = @duration,TotalBookingAmount = @price WHERE BookingID = @id;";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@duration", duration);
                        cmd.Parameters.AddWithValue("@date", bookdate);
                        cmd.Parameters.AddWithValue("@custid", custid);
                        cmd.Parameters.AddWithValue("@roomid", roomid);

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
        public static string deleteroom(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM Rooms WHERE RoomID = @id";

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
        public static string deletecust(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM Customers WHERE CustomerID = @id";

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
        public static string updatecust(string custname, string number, string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update the item in the Items table
                    string catquery = "UPDATE Customers SET CustomerName = @custname, ContactInfo = @number WHERE CustomerID = @id;";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@custname", custname);
                        cmd.Parameters.AddWithValue("@number", number);
                        ;
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
        public static string updaterooms(string room, string amount, string capa, string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update the item in the Items table
                    string catquery = "UPDATE Rooms SET RoomName = @room, Capacity = @capa,PricePerHour = @amount WHERE RoomID = @id;";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@room", room);
                        cmd.Parameters.AddWithValue("@amount", amount);
                        cmd.Parameters.AddWithValue("@capa", capa);
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







        public class customers
        {
            public string CustomerID;
            public string CustomerName;
            public string ContactInfo;
        }

        public class employ
        {
            public string EmployeeID;
            public string EmployeeName;
            public string ContactInfo;
            public string username;
            public string password;
        }


        [WebMethod]
        public static customers[] displaycustomer()
        {
            List<customers> details = new List<customers>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
       select * from Customers

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    customers field = new customers();
                    field.CustomerID = dr["CustomerID"].ToString();
                    field.CustomerName = dr["CustomerName"].ToString();


                    field.ContactInfo = dr["ContactInfo"].ToString();



                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }


        [WebMethod]
        public static employ[] displayemployees()
        {
            List<employ> details = new List<employ>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
    	select * from Employees

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    employ field = new employ();
                    field.EmployeeID = dr["EmployeeID"].ToString();
                    field.EmployeeName = dr["EmployeeName"].ToString();


                    field.ContactInfo = dr["ContactInfo"].ToString();


                    field.username = dr["username"].ToString();


                    field.password = dr["password"].ToString();



                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }



        [WebMethod]
        public static string submitstock(string custname, string number)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string catquery = "INSERT INTO Customers (CustomerName, ContactInfo) VALUES (@custname, @number);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@custname", custname);
                        cmd.Parameters.AddWithValue("@number", number);


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
        public static string submitroom(string room, string capa, string amount)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();


                    // Adjust the query to insert the parsed date
                    string catquery = "INSERT INTO Rooms (RoomName, Capacity,PricePerHour) VALUES (@room, @capa ,@amount);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@room", room);
                        cmd.Parameters.AddWithValue("@capa", capa);
                        cmd.Parameters.AddWithValue("@amount", amount);


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

        public class rooms
        {
            public string RoomName;
            public string Capacity;
            public string PricePerHour;
            public string RoomID;
        }


        [WebMethod]
        public static rooms[] displayrooms()
        {
            List<rooms> details = new List<rooms>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
       select * from Rooms

        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    rooms field = new rooms();
                    field.RoomName = dr["RoomName"].ToString();
                    field.Capacity = dr["Capacity"].ToString();
                    field.RoomID = dr["RoomID"].ToString();

                    field.PricePerHour = dr["PricePerHour"].ToString();



                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }



        [WebMethod]
        public static string submitbooking(string price, string duration, string date, string custid, string roomid)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    // Parse the date string to DateTime format
                    DateTime bookdate;
                    if (!DateTime.TryParse(date, out bookdate))
                    {
                        return "Error: Invalid date format";
                    }

                    // Adjust the query to insert the parsed date
                    string catquery = "INSERT INTO Bookings (CustomerID, RoomID,BookingDateTime,Duration,TotalBookingAmount) VALUES (@custid, @roomid ,@date,@duration,@price);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@price", price);
                        cmd.Parameters.AddWithValue("@duration", duration);
                        cmd.Parameters.AddWithValue("@date", bookdate);
                        cmd.Parameters.AddWithValue("@custid", custid);
                        cmd.Parameters.AddWithValue("@roomid", roomid);

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
        public static List<ListItem> getcust()
        {
            string query = "select CustomerID,CustomerName from Customers";
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
                                Value = sdr["CustomerID"].ToString(),
                                Text = sdr["CustomerName"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }



        [WebMethod]
        public static List<ListItem> getroom()
        {
            string query = "select RoomID,RoomName from Rooms";
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
                                Value = sdr["RoomID"].ToString(),
                                Text = sdr["RoomName"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return customers;
                }
            }
        }


        public class booking
        {
            public string BookingID;
            public string CustomerName;
            public string RoomName;

            public string BookingDateTime;
            public string Duration;
            public string TotalBookingAmount;
        }


        [WebMethod]
        public static booking[] displaybooking()
        {
            List<booking> details = new List<booking>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  

	select Bookings.BookingID,Customers.CustomerName,Rooms.RoomName,Bookings.BookingDateTime,Bookings.Duration,Bookings.TotalBookingAmount from Bookings
	inner join Customers on Bookings.CustomerID = Customers.CustomerID
		inner join Rooms on Bookings.RoomID = Rooms.RoomID


        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {





                    booking field = new booking();
                    field.BookingID = dr["BookingID"].ToString();
                    field.CustomerName = dr["CustomerName"].ToString();
                    field.RoomName = dr["RoomName"].ToString();
                    field.BookingDateTime = dr["BookingDateTime"].ToString();

                    field.Duration = dr["Duration"].ToString();

                    field.TotalBookingAmount = dr["TotalBookingAmount"].ToString();


                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }


    }
}