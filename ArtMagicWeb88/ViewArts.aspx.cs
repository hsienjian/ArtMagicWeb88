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
            
            
            if (Session["Cus_id"] != null)
            {

                
                con.Open();
                SqlCommand cmdImageupload = new SqlCommand("SELECT * FROM [Product] P, [ArtistAccount] A WHERE A.Artist_id = A.Artist_id", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdImageupload;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ListofArt.DataSource = ds;
                ListofArt.DataBind();
                con.Close();
            }
            else
            {
                Response.Write("You are not allowed to visit this page");
            }
        }

        

        protected void ListofArt_OnItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ImageButtonClick")
            {
                string productId = ((HiddenField)e.Item.FindControl("HiddenID")).Value;
                con.Open();
                string artSelected = "SELECT * FROM Product WHERE productId='" + productId + "'";
                SqlCommand artFound = new SqlCommand(artSelected, con);
                SqlDataReader artDetails = artFound.ExecuteReader();
                if (artDetails.HasRows)
                {
                    while (artDetails.Read())
                    {
                        string artIDPicked = artDetails["productId"].ToString();
                        Response.Redirect("ArtDetail.aspx?product=" + artIDPicked);
                    }
                }
            }
        }

        
        
    }
}