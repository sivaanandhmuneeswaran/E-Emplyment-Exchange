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
    public partial class Jobs : System.Web.UI.Page
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

                sql = "Select * from Category";
                command = new SqlCommand(sql, cnn);
                SqlDataAdapter sda = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DDLCatg.DataSource = dt;
                DDLCatg.DataTextField = "Value";
                DDLCatg.DataValueField = "Id";
                DDLCatg.DataBind();
                DDLCatg.Items.Insert(0, new ListItem("Select", "0".ToString()));
                cnn.Close();
            }
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

            sql = "Select * from Job where Status !='Deleted' and [Job Provider Id]=@jpid";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("@jpid", Session["Username"]);
            SqlDataAdapter sda = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            VJFormView.DataSource = dt;
            VJFormView.DataBind();
            cnn.Close();
        }
        protected void VJBtn_Click(object sender, EventArgs e)
        {
            
            MultiViewJob.ActiveViewIndex = 0;
            BindVJForm();
            
        }

        protected void AJBtn_Click(object sender, EventArgs e)
        {
            MultiViewJob.ActiveViewIndex = 1;
        }

        protected void SubmitBtn_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql,sql1;
            cnn = new SqlConnection(connetionString);
            SqlCommand command,command1;
            cnn.Open();
            sql = "Insert into [Job] ([Job Name],[Category],[Salary],[Job Provider Id],[Description],[Status],[Application Count]) values(@jname,@catg,@salary,@jpid,@desc,@status,@appct)";
            command = new SqlCommand(sql, cnn);
            sql1 = "Update [Job Provider] set [Jobs Count] = [Jobs Count]+1  where username = @user";
            command.Parameters.AddWithValue("@jname", JNTB.Text);
            command.Parameters.AddWithValue("@catg", DDLCatg.SelectedIndex);
            command.Parameters.AddWithValue("@salary", SalaryTD.Text);
            command.Parameters.AddWithValue("@jpid", Session["Username"] );
            command.Parameters.AddWithValue("@desc", DescTD.Text);
            command.Parameters.AddWithValue("@status", "Available");
            command.Parameters.AddWithValue("@appct", 0);
            
            try
            {
                command1 = new SqlCommand(sql1, cnn);
                command1.Parameters.AddWithValue("@user", Session["Username"]);
                command1.ExecuteNonQuery();
                command.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect("JobProviderHome.aspx");
            }
            catch (Exception ex)
            {
            }
                
            

        }

        protected void VJFormView_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            VJFormView.PageIndex = e.NewPageIndex;
            BindVJForm();
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            connetionString = @"Data Source=DESKTOP-NCLVKS1;Initial Catalog=E-Employment ;User ID=sa;Password=allohomora";
            String sql;
            cnn = new SqlConnection(connetionString);
            SqlCommand command;
            cnn.Open();

            sql = "Update Job set Status='Deleted' where [Job Id] = @jobid";
            command = new SqlCommand(sql, cnn);
            HiddenField jobid = (HiddenField)VJFormView.FindControl("JobId");
            command.Parameters.AddWithValue("jobid",jobid.Value);
            command.ExecuteNonQuery();
            sql = "Update Application set Status='Rejected' where [JobId]=@jobid";
            command = new SqlCommand(sql, cnn);
            command.Parameters.AddWithValue("jobid", jobid.Value);
            command.ExecuteNonQuery();
            cnn.Close();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Job Deleted Successfully')", true);
            Response.Redirect("Jobs.aspx");
        }

        protected void ApplicantBtn_Click(object sender, EventArgs e)
        {
            HiddenField jobid = (HiddenField)VJFormView.FindControl("JobId");
            Session["currentjob"] = jobid.Value;
            Response.Redirect("ViewApplicants.aspx");
        }

        protected void VSABtn_Click(object sender, EventArgs e)
        {
            HiddenField jobid = (HiddenField)VJFormView.FindControl("JobId");
            Session["currentjob"] = jobid.Value;
            Response.Redirect("ViewSelectedApplicant.aspx");
        }
    }
}