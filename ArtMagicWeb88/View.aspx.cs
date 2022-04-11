using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace ArtMagicWeb88
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Artist_id"] != null)
            {
                //Label1.Text = Session["Artist_id"].ToString();
            }
            else
            {
                Response.Write("<script>alert('You are not allowed to visit this page');</script>");
            }
        }

            protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Data"]);
                (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
            }
        }
    }
}