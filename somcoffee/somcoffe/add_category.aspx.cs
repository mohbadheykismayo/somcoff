using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace somcoffe
{
    public partial class add_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public class category {
            public string CategoryName;
            public string CategoryId;
        }

        [WebMethod]
        public static category[] datadisplay()
        {
            List<category> details = new List<category>();
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"  
        select * from Categories
        ", con);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    category field = new category();
                    field.CategoryName = dr["CategoryName"].ToString();

                    field.CategoryId = dr["CategoryId"].ToString();
                

                    details.Add(field);
                }
            } // Connection will be automatically closed here

            return details.ToArray();
        }



        [WebMethod]
        public static string submitcategory(string catname)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Insert into patient table
                    string catquery = "INSERT INTO Categories (CategoryName) VALUES (@name);";
                    using (SqlCommand cmd = new SqlCommand(catquery, con))
                    {
                        cmd.Parameters.AddWithValue("@name", catname);
      
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
        public static string updatecategory(string id, string catname)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Update jobs table
                    string jobQuery = "UPDATE [Categories] SET " +
                          "[CategoryName] = @CategoryName" +
                           " WHERE [CategoryID] = @id";





                    using (SqlCommand cmd = new SqlCommand(jobQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@CategoryName", catname);
                

                        cmd.ExecuteNonQuery();
                    }
                }

                return "true";
            }
            catch (Exception ex)
            {
                // Handle exceptions
                return "Error in updating method: " + ex.Message;
            }
        }
        [WebMethod]
        public static string deletecategory(string id)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Delete job from jobs table
                    string jobQuery = "DELETE FROM [Categories] WHERE [CategoryID] = @id";

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
    }
}