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
    public partial class JobsSeeker : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BindVJForm()
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();

            sql = "Select Job.[Job Id],Job.[Job Name],Job.[Category],Job.[Salary],Job.[Description],Job.[Job Provider Id],[Job Provider].[Company Name],[Job Provider].[Phone] from Job INNER JOIN [Job Provider] ON Job.[Job Provider Id] = [Job Provider].[username] where Job.[Status]='Available'";
            command = new SqlCommand(sql, cnn);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            VJFormView.DataSource = dt;
            VJFormView.DataBind();
            cnn.Close();
        }
        protected void VJBtn_Click(object sender, EventArgs e)
        {
            MultiViewJob.ActiveViewIndex = 1;
            BindVJForm();
        }

        protected void VAJBtn_Click(object sender, EventArgs e)
        {
            MultiViewJob.ActiveViewIndex = 2;
            BindVAJForm();
        }

        protected void VJFormView_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            VJFormView.PageIndex = e.NewPageIndex;
            BindVJForm();
        }

        protected void ApplyBtn_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command,command1;
            cnn.Open();

            sql = "Insert into Application (JobId,SeekerId,Status) values(@jobid,@seekerid,@status) "; 
            command = new SqlCommand(sql, cnn);
            HiddenField jobid = (HiddenField)VJFormView.FindControl("JobId");
            command.Parameters.AddWithValue("@jobid",jobid.Value);
            command.Parameters.AddWithValue("@seekerid", Session["Username"]);
            command.Parameters.AddWithValue("@status", "Pending");

            sql = "Select * from Application where SeekerId=@seekerid and JobId=@jobid";
            command1 = new SqlCommand(sql, cnn);
            command1.Parameters.AddWithValue("@seekerid", Session["Username"]);
            command1.Parameters.AddWithValue("@jobid",jobid.Value);
            SqlDataAdapter sda1 = new SqlDataAdapter(command1);
            DataTable dt1 = new DataTable();
            sda1.Fill(dt1);
            if (dt1.Rows.Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Failed : Already applied')", true);
            }
            else
            {
                sql = "Update Job set [Application Count]=[Application Count]+1 where [Job Id]=@jobid";
                command1 = new SqlCommand(sql, cnn);
                command1.Parameters.AddWithValue("@jobid", jobid.Value);
                SqlDataAdapter sda2 = new SqlDataAdapter(command1);
                DataTable dt2 = new DataTable();
                sda2.Fill(dt2);
                command.ExecuteNonQuery();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Applied Successfully')", true);
            }            
            cnn.Close();
        }

        protected void BindVAJForm()
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();

            sql = "Select Application.Status,Application.ApplicationId,Job.[Job Id],Job.[Job Name],Job.[Category],Job.[Salary],Job.[Description],Job.[Job Provider Id],[Job Provider].[Company Name],[Job Provider].[Phone] from Application INNER JOIN Job ON Job.[Job Id] = Application.JobId INNER JOIN [Job Provider] ON Job.[Job Provider Id] = [Job Provider].[username] where Application.SeekerId=@seekerid and Application.Status !='Rejected'";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@seekerid", Session["username"]);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            VAJFormView.DataSource = dt;
            VAJFormView.DataBind();
            cnn.Close();
        }
        protected void VAJFormView_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            VAJFormView.PageIndex = e.NewPageIndex;
            BindVAJForm();
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command, command1;
            cnn.Open();
            sql = "Delete Application where ApplicationId=@appid";
            command = new SqlCommand(sql, cnn);
            HiddenField appid = (HiddenField)VAJFormView.FindControl("ApplicationId");
            command.Parameters.AddWithValue("@appid", appid.Value);
            command.ExecuteNonQuery();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Application Cancelled')", true);
            cnn.Close();
            Response.Redirect("JobsSeeker.aspx");
        }

        protected void BindRejectedView()
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();

            sql = "Select Application.Status,Application.ApplicationId,Job.[Job Id],Job.[Job Name],Job.[Category],Job.[Salary],Job.[Description],Job.[Job Provider Id],[Job Provider].[Company Name],[Job Provider].[Phone] from Application INNER JOIN Job ON Job.[Job Id] = Application.JobId INNER JOIN [Job Provider] ON Job.[Job Provider Id] = [Job Provider].[username] where Application.SeekerId=@seekerid and Application.Status='Rejected'";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@seekerid", Session["username"]);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            RejectFV.DataSource = dt;
            RejectFV.DataBind();
            cnn.Close();
        }
        protected void RejectBtn_Click(object sender, EventArgs e)
        {
            MultiViewJob.ActiveViewIndex = 0;
            BindRejectedView();
        }

        protected void RejectFV_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            RejectFV.PageIndex = e.NewPageIndex;
            BindRejectedView();
        }
    }
}