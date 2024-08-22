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
    }
}