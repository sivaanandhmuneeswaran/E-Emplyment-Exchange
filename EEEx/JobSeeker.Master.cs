﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EEEx
{
    public partial class JobSeeker : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StatusLbl.Text = "Hi, " + Session["Firstname"];
        }
    }
}