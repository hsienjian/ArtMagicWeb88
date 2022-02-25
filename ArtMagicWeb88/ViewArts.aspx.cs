using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ArtMagicWeb88
{
    public partial class ViewArts : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ListofArt_OnItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ImageButtonClick")
            {
                string artID = ((HiddenField)e.Item.FindControl("HiddenID")).Value;
                con.Open();
                string artSelected = "SELECT * FROM ART WHERE artID='" + artID + "'";
                SqlCommand artFound = new SqlCommand(artSelected, con);
                SqlDataReader artDetails = artFound.ExecuteReader();
                if (artDetails.HasRows)
                {
                    while (artDetails.Read())
                    {
                        string artIDPicked = artDetails["artID"].ToString();
                        Response.Redirect("ArtDetail.aspx?art=" + artIDPicked);
                    }
                }
            }
        }

        protected void ListofArt_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}