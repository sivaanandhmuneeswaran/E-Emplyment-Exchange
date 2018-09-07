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
    public partial class ViewApplicants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connetionString;
                SqlConnection cnn;
                connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";

                cnn = new SqlConnection(connetionString);

                cnn.Open();
                SqlCommand command;
                String sql;

                sql = "Select [Job Name] from Job where [Job Id]=@jobid";
                command = new SqlCommand(sql, cnn);
                command.Parameters.AddWithValue("@jobid", Session["currentjob"]);
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                JobDesc.Text = " Applicants for " + dt.Rows[0]["Job Name"].ToString();
                cnn.Close();
                BindApplicantFV();
            }
        }

        protected void BindApplicantFV()
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();
            sql = "Select Application.ApplicationId,JobSeeker.username,State.Name as SName,City.Name as CName,Degree.Value as DValue,Field.Value as FValue,JobSeeker.[First Name],JobSeeker.[Last Name],JobSeeker.[Address],JobSeeker.[City],JobSeeker.[State],JobSeeker.[Pincode],JobSeeker.[Gender],JobSeeker.[Degree],JobSeeker.[Field],JobSeeker.[Resume],JobSeeker.[Certificate],JobSeeker.[DOB],Application.Status from JobSeeker INNER JOIN Application ON JobSeeker.[username] = Application.SeekerId INNER JOIN Job ON Application.[JobId] = Job.[Job Id] INNER JOIN State ON State.Id=JobSeeker.State INNER JOIN City ON City.Id=JobSeeker.City INNER JOIN Degree ON Degree.Id=JobSeeker.Degree INNER JOIN Field ON Field.Id=JobSeeker.Field where Application.Status='Pending' and Job.[Job Provider Id]=@jpid";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@jpid", Session["Username"]);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ApplicantFormView.DataSource = dt;
            ApplicantFormView.DataBind();
            cnn.Close();
        }
        protected void ApplicantFormView_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            ApplicantFormView.PageIndex = e.NewPageIndex;
            BindApplicantFV();
        }

        protected void RejectBtn_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();
            sql = "Update Application set status='Rejected' where ApplicationId=@appid";
            command = new SqlCommand(sql, cnn);
            HiddenField appid = (HiddenField)ApplicantFormView.FindControl("AppId");
            command.Parameters.AddWithValue("@appid", appid.Value);
            command.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("ViewApplicants.aspx");
        }

        protected void AcceptBtn_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();
            sql = "Update Application set status='Accepted' where ApplicationId=@appid";
            command = new SqlCommand(sql, cnn);
            HiddenField appid = (HiddenField)ApplicantFormView.FindControl("AppId");
            command.Parameters.AddWithValue("@appid", appid.Value);
            command.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect("ViewApplicants.aspx");
        }
    }
}