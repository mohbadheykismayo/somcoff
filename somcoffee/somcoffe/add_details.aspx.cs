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


        public class customers
        {
            public string CustomerID;
            public string CustomerName;
            public string ContactInfo;
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
        public static string submitstock(string custname, string number )
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
        public static string submitbooking(string price, string duration, string date,string custid, string  roomid)
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