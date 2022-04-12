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
    public partial class ArtDetail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        private string userID = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cus_id"] != null)
            {
                string productId = Request.QueryString["product"];
                userID = Session["Cus_id"].ToString();


                con.Open();
                string artChosen = "SELECT * FROM Product P, ArtistAccount A WHERE P.productId='" + productId + "' AND P.userid = A.Artist_id";
                SqlCommand artRecord = new SqlCommand(artChosen, con);
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = artRecord;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                FormView.DataSource = ds;
                FormView.DataBind();
                con.Close();

                if (!IsPostBack)
                {
                    LinkButton lbAddWishlist = (LinkButton)FormView.FindControl("lbAddWishlist");
                    if (countExistingItems(productId, userID))
                    {
                        lbAddWishlist.CssClass = "btn btn-secondary";
                    }
                    else
                    {
                        lbAddWishlist.CssClass = "btn btn-danger";
                    }
                }

            }

        }
        protected void itemCommandClick(Object sender, FormViewCommandEventArgs e)
        {

            HiddenField artID = FormView.FindControl("hiddenID") as HiddenField;

            switch (e.CommandName)
            {
                case "addToWishList":
                    addWishList(artID.Value);
                    break;
                case "addToCart":
                    addToCart(artID.Value);
                    break;

            }

        }

        protected void addToCart(string commandArgument)
        {
            LinkButton lbAddToCart = (LinkButton)FormView.FindControl("lbAddToCart");
            if (countExistingCartItems(commandArgument, userID))
            {
                con.Open();
                string insertCartItems =
                    "INSERT INTO Cart (productId, Cus_id) " +
                    "VALUES (@productId, @Cus_id)";
                SqlCommand cmdAdd = new SqlCommand(insertCartItems, con);
                cmdAdd.Parameters.AddWithValue("@productId", commandArgument);
                cmdAdd.Parameters.AddWithValue("@Cus_id", userID);
                cmdAdd.ExecuteNonQuery();
                con.Close();
                lbAddToCart.CssClass = "btn btn-danger";
            }
            else
            {
                con.Open();
                string query = "Delete Cart Where productId=@productId AND Cus_id=@Cus_id ";
                SqlCommand cmdAdd = new SqlCommand(query, con);
                cmdAdd.Parameters.AddWithValue("@productId", commandArgument);
                cmdAdd.Parameters.AddWithValue("@Cus_id", userID);
                cmdAdd.ExecuteNonQuery();
                con.Close();
                lbAddToCart.CssClass = "btn btn-secondary";
            }
            Label lbl = Master.FindControl("lblCartNum") as Label;
            lbl.Text = countCartItems(userID).ToString();
            
        }

        protected int countCartItems(string Cus_id)
        {
            con.Open();
            string query = "Select Count(*) from Cart where Cus_id= @Cus_id";
            SqlCommand cmdSelect = new SqlCommand(query, con);
            cmdSelect.Parameters.AddWithValue("@Cus_id", Cus_id);
            int numberOfItems = int.Parse(cmdSelect.ExecuteScalar().ToString());
            con.Close();

            return numberOfItems;

        }

        protected Boolean countExistingCartItems(string productId, string Cus_id)
        {
            con.Open();

            string query = "Select Count(*) from Cart where productId=@productId AND Cus_id= @Cus_id";
            SqlCommand cmdSelect = new SqlCommand(query, con);
            cmdSelect.Parameters.AddWithValue("@productId", productId);
            cmdSelect.Parameters.AddWithValue("@Cus_id", Cus_id);
            int numberOfItems = int.Parse(cmdSelect.ExecuteScalar().ToString());
            con.Close();

            return (numberOfItems == 0 ? true : false);

        }

        protected void addWishList(string commandArgument)
        {
            LinkButton lbAddWishlist = (LinkButton)FormView.FindControl("lbAddWishlist");
            if (countExistingItems(commandArgument, userID))
            {
                con.Open();
                string insertWishListItems =
                    "INSERT INTO WishList (productId, Cus_id) " +
                    "VALUES (@productId, @Cus_id)";
                SqlCommand cmdAdd = new SqlCommand(insertWishListItems, con);
                cmdAdd.Parameters.AddWithValue("@productId", commandArgument);
                cmdAdd.Parameters.AddWithValue("@Cus_id", userID);
                cmdAdd.ExecuteNonQuery();
                con.Close();
                lbAddWishlist.CssClass = "btn btn-danger";
            }
            else
            {
                con.Open();
                string query = "Delete WishList Where productId=@productId AND Cus_id=@Cus_id ";
                SqlCommand cmdAdd = new SqlCommand(query, con);
                cmdAdd.Parameters.AddWithValue("@productId", commandArgument);
                cmdAdd.Parameters.AddWithValue("@Cus_id", userID);
                cmdAdd.ExecuteNonQuery();
                con.Close();
                lbAddWishlist.CssClass = "btn btn-secondary";
            }
            Label lbl = Master.FindControl("lblWishListNum") as Label;
            lbl.Text = countWishListItems(userID).ToString();
        }

        protected int countWishListItems(string Cus_id)
        {
            con.Open();
            string query = "Select Count(*) from WishList where Cus_id= @Cus_id";
            SqlCommand cmdSelect = new SqlCommand(query, con);
            cmdSelect.Parameters.AddWithValue("@Cus_id", Cus_id);
            int numberOfItems = int.Parse(cmdSelect.ExecuteScalar().ToString());
            con.Close();

            return numberOfItems;

        }

        protected Boolean countExistingItems(string productId, string Cus_id)
        {
            con.Open();

            string query = "Select Count(*) from WishList where productId=@productId AND Cus_id= @Cus_id";
            SqlCommand cmdSelect = new SqlCommand(query, con);
            cmdSelect.Parameters.AddWithValue("@productId", productId);
            cmdSelect.Parameters.AddWithValue("@Cus_id", Cus_id);
            int numberOfItems = int.Parse(cmdSelect.ExecuteScalar().ToString());
            con.Close();

            return (numberOfItems == 0 ? true : false);

        }
    }
}