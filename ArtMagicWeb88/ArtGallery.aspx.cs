using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ArtworkWebSite2021.Customer
{
    public partial class ArtGallery : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER_ID"] != null)
            {
                HomeImage.ImageUrl = "../gallery/Lotta%20on%20Twitter.jpg";
                welcomeMsg.Text = "WELCOME TO ART GALLERY '21";
                con.Open();
                SqlCommand cmdImageupload = new SqlCommand("SELECT * FROM [Art] A, [Artist] T WHERE A.artistID = T.artistID", con);
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

        protected void SearchFeature_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(SearchFeature.SelectedValue.Equals("All Arts"))
            {
                SqlCommand cmdImageupload = new SqlCommand("SELECT * FROM [Art] A, [Artist] T WHERE A.artistID = T.artistID", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdImageupload;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ListofArt.DataSource = ds;
                ListofArt.DataBind();
                con.Close();
            }
            else if (SearchFeature.SelectedValue.Equals("High to Low Price"))
            {
                SqlCommand cmdImageupload = new SqlCommand("SELECT * FROM [Art] A, [Artist] T WHERE A.artistID = T.artistID ORDER BY A.artPrice DESC", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdImageupload;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ListofArt.DataSource = ds;
                ListofArt.DataBind();
                con.Close();
            }
            else if (SearchFeature.SelectedValue.Equals("Low to High Price"))
            {
                SqlCommand cmdImageupload = new SqlCommand("SELECT * FROM [Art] A, [Artist] T WHERE A.artistID = T.artistID ORDER BY A.artPrice ASC", con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdImageupload;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                ListofArt.DataSource = ds;
                ListofArt.DataBind();
                con.Close();
            }
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

        protected void SearchArt_Click(object sender, EventArgs e)
        {
            string findresult = txtSearch.Text;
            if (!findresult.Equals(""))
            {
                con.Open();
                SqlCommand searchArt = new SqlCommand("SELECT * FROM [Art] A, [Artist] T WHERE A.artistID = T.artistID AND (UPPER(A.artName) LIKE UPPER('%" + findresult + "%') OR UPPER(T.name) LIKE UPPER('%" + findresult + "%'))", con);
                if (searchArt != null)
                {
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = searchArt;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    ListofArt.DataSource = ds;
                    ListofArt.DataBind();
                    con.Close();
                }
                else
                {
                    txtSearch.Text = "No Result Found.";
                }
                
            }
        }
    }
}