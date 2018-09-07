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
    public partial class SeekerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connetionString;
                SqlConnection cnn;
                connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
                String sql;
                cnn = new SqlConnection(connetionString);
                SqlCommand command;
                cnn.Open();

                sql = "Select * from State";
                command = new SqlCommand(sql, cnn);
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DDLState.DataSource = dt;
                DDLState.DataTextField = "Name";
                DDLState.DataValueField = "Id";
                DDLState.DataBind();
                DDLState.Items.Insert(0, new ListItem("Select", "0".ToString()));
                sql = "Select * from Degree";
                command = new SqlCommand(sql, cnn);
                SqlDataAdapter sda1 = new SqlDataAdapter(command);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                DDLDegree.DataSource = dt1;
                DDLDegree.DataTextField = "Value";
                DDLDegree.DataValueField = "Id";
                DDLDegree.DataBind();
                DDLDegree.Items.Insert(0, new ListItem("Select", "0".ToString()));

                sql = "Select * from JobSeeker where username=@user";
                command = new SqlCommand(sql, cnn);
                command.Parameters.AddWithValue("@user", Session["Username"]);
                SqlDataAdapter sda2 = new SqlDataAdapter(command);
                DataTable dt2 = new DataTable();
                sda1.Fill(dt2);
                FNTB.Text = dt2.Rows[0]["First Name"].ToString();
                LNTB.Text = dt2.Rows[0]["Last Name"].ToString();
                AddrTB.Text = dt2.Rows[0]["Address"].ToString();
                PinTB.Text = dt2.Rows[0]["Pincode"].ToString();
                ResumeTB.Text= dt2.Rows[0]["Resume"].ToString();
                CertificateTB.Text= dt2.Rows[0]["Certificate"].ToString();
                cnn.Close();
            }
        }

        protected void DDLState_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();
            sql = "Select * from City where [State Id] = @stateId";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@stateId", DDLState.SelectedIndex);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDLCity.DataSource = dt;
            DDLCity.DataTextField = "Name";
            DDLCity.DataValueField = "Id";
            DDLCity.DataBind();
            DDLCity.Items.Insert(0, new ListItem("Select", "0".ToString()));
            cnn.Close();
        }

        protected void DDLDegree_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();
            sql = "Select * from Field where [Degree Id] = @degreeId";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@degreeId", DDLDegree.SelectedIndex);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDLField.DataSource = dt;
            DDLField.DataTextField = "Value";
            DDLField.DataValueField = "Id";
            DDLField.DataBind();
            DDLField.Items.Insert(0, new ListItem("Select", "0".ToString()));
            cnn.Close();
        }

        protected void Register(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();
            sql = "Update JobSeeker set [First Name]=@fn,[Last Name]=@ln,Address=@addr,City=@city,State=@state,Pincode=@pin,Degree=@degree,Field=@field,Resume=@resume,Certificate=@cert where username=@user";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@fn", FNTB.Text);
            command.Parameters.AddWithValue("@ln", LNTB.Text);
            command.Parameters.AddWithValue("@addr", AddrTB.Text);
            command.Parameters.AddWithValue("@city", DDLCity.SelectedIndex);
            command.Parameters.AddWithValue("@state", DDLState.SelectedIndex);
            command.Parameters.AddWithValue("@pin", Convert.ToInt32(PinTB.Text));
            command.Parameters.AddWithValue("@degree", DDLDegree.SelectedIndex);
            command.Parameters.AddWithValue("@field", DDLField.SelectedIndex);
            command.Parameters.AddWithValue("@resume", ResumeTB.Text);
            command.Parameters.AddWithValue("@cert", CertificateTB.Text);
            try
            {
                command.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("JobSeeker.aspx");
            }
            catch (Exception ex)
            {
            }
        }
    }
}