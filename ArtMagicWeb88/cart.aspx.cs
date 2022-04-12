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
    public partial class cart : System.Web.UI.Page
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
                lblNumOfCart.Text = countCartItems(userID) + " Artworks";
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
            string query = "Delete Cart Where productId=@productId AND Cus_id=@Cus_id ";
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
            string countNumItems = countCartItems(userID).ToString();
            Label lbl = Master.FindControl("lblCartNum") as Label;
            lbl.Text = countNumItems;
            lblNumOfCart.Text = countNumItems + " Product Item";
        }

        protected DataTable bindDataCartTable(string Cus_id)
        {
            createConnection();
            string query =
                "Select Product.productId, Product.ProductName,  Product.data, Product.Price, Product.description, Cart.productId From Product " +
                "INNER JOIN Cart ON Product.productId = Cart.productId AND Cart.Cus_id = @Cus_id";
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
            lvCart.DataSource = bindDataCartTable(userID);
            lvCart.DataBind();
        }

        //protected void lvCart_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        //{
        //    DataPager pager = lvCart.FindControl("DataPager1") as DataPager;
        //    pager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        //    this.bindData();
        //}

        protected int countCartItems(string Cus_id)
        {
            createConnection();
            string query = "Select Count(*) from Cart where Cus_id= @Cus_id";
            SqlCommand cmdSelect = new SqlCommand(query, conn);
            cmdSelect.Parameters.AddWithValue("@Cus_id", Cus_id);
            int numberOfItems = int.Parse(cmdSelect.ExecuteScalar().ToString());
            conn.Close();

            return numberOfItems;
        }



    }
}