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
    public partial class Signup : System.Web.UI.Page
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


                DDLState0.DataSource = dt;
                DDLState0.DataTextField = "Name";
                DDLState0.DataValueField = "Id";
                DDLState0.DataBind();
                DDLState0.Items.Insert(0, new ListItem("Select", "0".ToString()));


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
                cnn.Close();
            }
        }

        protected void EnableJSV(object sender, EventArgs e)
        {
            SignUpMV.ActiveViewIndex = 0;
        }

        protected void EnableJPV(object sender, EventArgs e)
        {
            SignUpMV.ActiveViewIndex = 1;
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
            sql = "Insert into JobSeeker values(@user,@fn,@ln,@pass,@addr,@city,@state,@pin,@appct,@gender,@degree,@field,@resume,@cert,@dob)";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@user", EmailTB.Text);
            command.Parameters.AddWithValue("@fn", FNTB.Text);
            command.Parameters.AddWithValue("@ln", LNTB.Text);
            command.Parameters.AddWithValue("@pass", PassTB.Text);
            command.Parameters.AddWithValue("@addr", AddrTB.Text);
            command.Parameters.AddWithValue("@city", DDLCity.SelectedIndex);
            command.Parameters.AddWithValue("@state", DDLState.SelectedIndex);
            command.Parameters.AddWithValue("@pin", Convert.ToInt32(PinTB.Text));
            command.Parameters.AddWithValue("@appct", 0);
            if(RBMale.Checked==true)
                command.Parameters.AddWithValue("@gender","Male" );
            if(RBFemale.Checked==true)
                command.Parameters.AddWithValue("@gender", "Female");
            command.Parameters.AddWithValue("@degree", DDLDegree.SelectedIndex);
            command.Parameters.AddWithValue("@field", DDLField.SelectedIndex);
            command.Parameters.AddWithValue("@resume", ResumeTB.Text);
            command.Parameters.AddWithValue("@cert", CertificateTB.Text);
            command.Parameters.AddWithValue("@dob", DOBTB.Text);
            try {
                command.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("Login.aspx");
            }
            catch(Exception ex)
            {
                errorlbl.Text = " Username already exists";
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

        protected void DDLState0_SelectedIndexChanged(object sender, EventArgs e)
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
            command.Parameters.AddWithValue("@stateId", DDLState0.SelectedIndex);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DDLCity0.DataSource = dt;
            DDLCity0.DataTextField = "Name";
            DDLCity0.DataValueField = "Id";
            DDLCity0.DataBind();
            DDLCity0.Items.Insert(0, new ListItem("Select", "0".ToString()));
            cnn.Close();
        }

        protected void Register0(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();
            sql = "Insert into [Job Provider] values(@user,@cn,@pass,@phone,@addr,@city,@state,@pin,@jobct)";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@user", EmailTB0.Text);
            command.Parameters.AddWithValue("@cn", CNTB.Text);
            command.Parameters.AddWithValue("@phone", PhoneTB0.Text);
            command.Parameters.AddWithValue("@pass", PassTB0.Text);
            command.Parameters.AddWithValue("@addr", AddrTB0.Text);
            command.Parameters.AddWithValue("@city", DDLCity0.SelectedIndex);
            command.Parameters.AddWithValue("@state", DDLState0.SelectedIndex);
            command.Parameters.AddWithValue("@pin", Convert.ToInt32(PinTB0.Text));
            command.Parameters.AddWithValue("@jobct", 0);
            try
            {
                command.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("Login.aspx");
            }
            catch (Exception ex)
            {
                ErrorLbl0.Text = " Username already exists";
            }
            
        }
    }
}