using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace somcoffe
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void lognbtn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // First, check if the user is an admin
                SqlCommand cmdAdmin = new SqlCommand(@"
            SELECT * FROM admin 
            WHERE username=@username AND password=@password", con);
                cmdAdmin.Parameters.AddWithValue("@Username", TextBox2.Text);
                cmdAdmin.Parameters.AddWithValue("@Password", TextBox1.Text);

                SqlDataReader dr = cmdAdmin.ExecuteReader();

                if (dr.Read())
                {
                    // If admin credentials match
                    Session["username"] = dr["username"].ToString();
                    Session["role"] = "admin";
                    
                    Response.Redirect("order_report.aspx");
                }
                else
                {
                    dr.Close(); // Close the DataReader before executing another command

                    // Now check if the user is an employee
                    SqlCommand cmdEmployee = new SqlCommand(@"
                SELECT * FROM Employees 
                WHERE username=@username AND password=@password", con);
                    cmdEmployee.Parameters.AddWithValue("@Username", TextBox2.Text);
                    cmdEmployee.Parameters.AddWithValue("@Password", TextBox1.Text);

                    SqlDataReader drEmp = cmdEmployee.ExecuteReader();

                    if (drEmp.Read())
                    {
                        // If employee credentials match
                        Session["username"] = drEmp["username"].ToString();
                        Session["role"] = "employee";
                      
                        Response.Redirect("order.aspx"); // Redirect to employee dashboard
                    }
                    else
                    {
                        // If neither admin nor employee credentials match
                        // Add your error handling logic here
                        // For example, show a message to the user
                        //lblMessage.Text = "Invalid username or password.";
                    }
                }
            }
        }

    }
}