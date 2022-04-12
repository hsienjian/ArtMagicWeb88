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
    public partial class WishList : System.Web.UI.Page
    {
        private SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        private string userID = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Session["Cus_id"].ToString();
            if (!this.IsPostBack)
            {
                
                bindData();
                //count wishlist items
                lblNumOfArtwork.Text = countWishListItems(userID) + " Artworks";
            }
        }

        protected void createConnection()
        {
            try
            {
                conn.Open();
            }
            catch (SqlException ex)
            {
                Response.Write(ex);
            }

        }

        protected void lbDelete_Command(Object sender, CommandEventArgs e)
        {
            createConnection();
            string query = "Delete WishList Where productId=@productId AND Cus_id=@Cus_id ";
            SqlCommand cmdAdd = new SqlCommand(query, conn);
            cmdAdd.Parameters.AddWithValue("@productId", e.CommandArgument.ToString());
            cmdAdd.Parameters.AddWithValue("@Cus_id", userID);
            int numDeletedRow = cmdAdd.ExecuteNonQuery();
            conn.Close();

            string title = "";
            string body = "";
            string sucess = "";
            string unsucess = "";
            if (numDeletedRow > 0)
            {
                title = "Sucess!!";
                body = "You deleted a Artwork from your WishList";
                sucess = "block";
                unsucess = "none";
            }
            else
            {
                title = "Oops...";
                body = "Delete unsucess, Cannot found the record";
                sucess = "none";
                unsucess = "block";
            }

            ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "', '" + sucess + "', '" + unsucess + "');", true);

            //bindData Again to update listview and count the items in wishlist again
            bindData();
            string countNumItems = countWishListItems(userID).ToString();
            Label lbl = Master.FindControl("lblWishListNum") as Label;
            lbl.Text = countNumItems;
            lblNumOfArtwork.Text = countNumItems + " Product Item";
        }

        //private void GetData()
        //{
        //    String myquery = "SELECT * FROM Product where Id IN(select Id from Wishlist where username='" + Session["username"].ToString() + "')";
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //    SqlCommand cmd = new SqlCommand();
        //    try
        //    {
        //        con.Open();

        //        cmd.CommandText = myquery;
        //        cmd.Connection = con;
        //        SqlDataAdapter da = new SqlDataAdapter();
        //        da.SelectCommand = cmd;
        //        DataSet ds = new DataSet();
        //        da.Fill(ds);
        //        WishList1.DataSource = ds;
        //        WishList1.DataBind();
        //    }
        //    catch (Exception e1)
        //    {
        //        lblError.Visible = true;
        //        lblError.Text = "Database connection error!";
        //        throw;
        //    }
        //    finally
        //    {
        //        con.Close();

        //    }

        //}

        //protected void WishList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (WishList1.SelectedValue.ToString() != null)
        //    {
        //        int productId = Convert.ToInt32(WishList1.SelectedRow.Cells[1].Text);
        //        string image = WishList1.SelectedRow.Cells[2].Text;
        //        string Image1 = WishList1.SelectedRow.Cells[3].Text;
        //        double price = Convert.ToDouble(WishList1.SelectedRow.Cells[4].Text); ;



        //        Server.Transfer("~/ArtworkInfo.aspx?productId=" + productId + "&image=" + image + "&Image1=" + Image1);
        //    }
        //}

        //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        DataRowView dr = (DataRowView)e.Row.DataItem;
        //        string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr["Data"]);
        //        (e.Row.FindControl("Image1") as Image).ImageUrl = imageUrl;
        //    }
        //}


        protected DataTable bindDataWishlistTable(string Cus_id)
        {
            createConnection();
            string query =
                "Select Product.productId, Product.ProductName,  Product.data, Product.description, Product.Price, WishList.productId From Product " +
                "INNER JOIN WishList ON Product.productId = WishList.productId AND WishList.Cus_id = @Cus_id";
            var command = new SqlCommand(query, conn);
            command.Parameters.AddWithValue("@Cus_id", Cus_id);
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        protected void bindData()
        {
            lvWishList.DataSource = bindDataWishlistTable(userID);
            lvWishList.DataBind();
        }

        protected void lvWishList_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            DataPager pager = lvWishList.FindControl("DataPager1") as DataPager;
            pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.bindData();
        }

        protected int countWishListItems(string Cus_id)
        {
            createConnection();
            string query = "Select Count(*) from WishList where Cus_id= @Cus_id";
            SqlCommand cmdSelect = new SqlCommand(query, conn);
            cmdSelect.Parameters.AddWithValue("@Cus_id", Cus_id);
            int numberOfItems = int.Parse(cmdSelect.ExecuteScalar().ToString());
            conn.Close();

            return numberOfItems;
        }

        //protected void WishList1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    int id = Convert.ToInt32(WishList1.DataKeys[e.RowIndex].Value);

        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        //    String query = "Delete from Wishlist where Id = " + id;
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    try
        //    {
        //        con.Open();
        //        int row = cmd.ExecuteNonQuery();

        //        if (row > 0)
        //        {
        //            Page.ClientScript.RegisterClientScriptBlock
        //                (this.GetType(), "K", "swal('Deleted!','Record is removed from Wishlist!','success')", true);
        //            //GetData();
        //        }
        //    }
        //    catch (Exception e1)
        //    {
        //        lblError.Visible = true;
        //        lblError.Text = "Database connection error!";
        //        throw;
        //    }
        //    finally
        //    {
        //        con.Close();

        //    }
        //}

    }
}