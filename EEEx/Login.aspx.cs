using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EEEx
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Username"] = "";
            Session["Firstname"] = "";
            Session["Company Name"] = "";
        }

        protected void LoginUser(object sender, EventArgs e)
        {

            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";

            cnn = new SqlConnection(connetionString);

            cnn.Open();
            SqlCommand command;
            String sql;
            String user = UserName.Text.ToString();
            String pass = Password.Text.ToString();

            sql = "Select * from Admin where username=@UserName and password=@Password";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@UserName", user);
            command.Parameters.AddWithValue("@Password", pass);
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Session["Username"] = dt.Rows[0]["username"].ToString();
                Session["Firstname"] = dt.Rows[0]["First Name"].ToString();
                Response.Redirect("AdminHome.aspx");
            }
            else
            {
                sql = "Select * from JobSeeker where username=@UserName and password=@Password";
                command = new SqlCommand(sql, cnn);
                command.Parameters.AddWithValue("@UserName", user);
                command.Parameters.AddWithValue("@Password", pass);
                SqlDataAdapter sda1 = new SqlDataAdapter(command);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                if (dt1.Rows.Count > 0)
                {
                    Session["Username"] = dt1.Rows[0]["username"].ToString();
                    Session["Firstname"] = dt1.Rows[0]["First Name"].ToString();
                    Response.Redirect("JobSeekerHome.aspx");
                }
                else
                {
                    sql = "Select * from [Job Provider] where username=@UserName and password=@Password";
                    command = new SqlCommand(sql, cnn);
                    command.Parameters.AddWithValue("@UserName", user);
                    command.Parameters.AddWithValue("@Password", pass);
                    SqlDataAdapter sda2 = new SqlDataAdapter(command);
                    DataTable dt2 = new DataTable();
                    sda2.Fill(dt2);
                    if (dt2.Rows.Count > 0)
                    {
                        Session["Username"] = dt2.Rows[0]["username"].ToString();
                        Session["Company Name"] = dt2.Rows[0]["Company Name"].ToString();
                        Response.Redirect("JobProviderHome.aspx");
                    }
                    else
                    {
                        UserName.Text = "";
                        Password.Text = "";
                        ErrorLabel.Text = "Invalid Username or Password";
                    }
                }
            }

            cnn.Close();
        }

        protected void SignUp(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }
    }
}