using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMagicWeb88
{
    public partial class _Default : Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Artist_id"] != null)
            //{
            //    lblSuccess.Text = "success";
            //}
            //else
            //{
            //    Response.Write("<script>alert('You are not allowed to visit this page');</script>");
            //    Response.Redirect("~/HomePage.aspx");
            //}
        }

        
    }
}