using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EEEx
{
    public partial class JobProvider : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusLbl.Text = "HI, " + Session["Company Name"].ToString();
        }
    }
}