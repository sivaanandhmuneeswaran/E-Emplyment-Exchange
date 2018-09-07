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
    public partial class ViewSelectedApplicant : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            sql = "Select Application.ApplicationId,JobSeeker.username,State.Name as SName,City.Name as CName,Degree.Value as DValue,Field.Value as FValue,JobSeeker.[First Name],JobSeeker.[Last Name],JobSeeker.[Address],JobSeeker.[City],JobSeeker.[State],JobSeeker.[Pincode],JobSeeker.[Gender],JobSeeker.[Degree],JobSeeker.[Field],JobSeeker.[Resume],JobSeeker.[Certificate],JobSeeker.[DOB],Application.Status from JobSeeker INNER JOIN Application ON JobSeeker.[username] = Application.SeekerId INNER JOIN State ON State.Id=JobSeeker.State INNER JOIN City ON City.Id=JobSeeker.City INNER JOIN Degree ON Degree.Id=JobSeeker.Degree INNER JOIN Field ON Field.Id=JobSeeker.Field where Application.Status='Accepted' ";
            command = new SqlCommand(sql, cnn);
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
    }
}