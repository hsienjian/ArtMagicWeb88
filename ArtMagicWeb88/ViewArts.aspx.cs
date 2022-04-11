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
        private string userID = String.Empty;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Cus_id"] != null)
            {

                Label1.Text = "success";
                Response.Write("<script>alert('session successful');</script>");
            }
            else
            {
                Response.Write("<script>alert('12345678You are not allowed to visit this page');</script>");
            }


            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData();
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }

        }





        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Product"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Item_Bound(object sender, DataListItemEventArgs e)
        {

        

        }

        //if (Request.QueryString["addtocart"] != null && Session["username"] != null)
        //{
        //    String id = Request.QueryString["addtocart"].ToString();
        //    String query = "INSERT INTO Cart(username,Id) values('" + Session["username"].ToString() + "'," + Request.QueryString["addtocart"].ToString() + ")";
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = query;
        //    cmd.Connection = con;
        //    cmd.ExecuteNonQuery();
        //    ClientScript.RegisterClientScriptBlock
        //  (this.GetType(), "K", "swal('Cart Added!','Product has been added into Cart','success')", true);

        //    SqlCommand cmd1 = con.CreateCommand();
        //    cmd1.CommandType = CommandType.Text;
        //    cmd1.CommandText = "Update Product SET qty=qty-" + 1 + "Where Id=" + id;
        //    cmd1.ExecuteNonQuery();



        //}
        //else if (Request.QueryString["addtowishlist"] != null && Session["username"] != null)
        //{
        //    String query = "INSERT INTO Wishlist(username,Id) values('" + Session["username"].ToString() + "'," + Request.QueryString["addtowishlist"].ToString() + ")";
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = query;
        //    cmd.Connection = con;
        //    cmd.ExecuteNonQuery();
        //    ClientScript.RegisterClientScriptBlock
        //  (this.GetType(), "K", "swal('Wishlist Added!','Product has been added into Wishlist','success')", true);

        //}





        protected void btnCart_Click(object sender, EventArgs e)
        {
            //if (Session["Artist_id"] != null)
            //{
                
            //    String query = "INSERT INTO Cart values('@userid,@productName,@price,@quantity,@productId')"; 
            //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            //    Label lbl2 = Master.FindControl("Label2") as Label;
            //    Label lbl3 = Master.FindControl("Label3") as Label;
            //    Label lbl4 = Master.FindControl("Label4") as Label;
            //    using (SqlCommand cmd = new SqlCommand(query, conn))
            //    {
            //        cmd.Parameters.AddWithValue("@userid", Session["Artist_id"].ToString());
            //        cmd.Parameters.AddWithValue("@productName", lbl2.Text);
            //        cmd.Parameters.AddWithValue("@artistName", lbl3.Text);
            //        cmd.Parameters.AddWithValue("@Price", decimal.Parse(lbl4.Text));
            //        //cmd.Parameters.AddWithValue("@Quantity", int.Parse(txtQuantity.Text));
            //        //cmd.Parameters.AddWithValue("@Description", txtDesc.Text);
            //        //cmd.Parameters.AddWithValue("@image", Path.GetFileName(FileUpload1.PostedFile.FileName));
            //        //cmd.Parameters.AddWithValue("@ContentType", FileUpload1.PostedFile.ContentType);
            //        //cmd.Parameters.AddWithValue("@Data", bytes);
            //        conn.Open();
            //        cmd.ExecuteNonQuery();
            //        conn.Close();
            //    }

                
  
            //    ClientScript.RegisterClientScriptBlock
            //  (this.GetType(), "K", "swal('Cart Added!','Product has been added into Cart','success')", true);


            //    Response.Write("<script>alert('added to cart');</script>");
            //    //Response.Redirect("/cart.aspx?Artist_id=" + btnCart_Click.Text + "&DeptName=" + txtDeptName.Text);

            //}
            //else
            //{
            //    Response.Write("<script>alert('fail');</script>");
            //}
            ////Response.Redirect("ViewArts.aspx?addtocart=" + e.CommandArgument.ToString());


        }

        //protected void btnWishList_Click(object sender, EventArgs e)
        //{
        //    Response.Write("<script>alert('" + "Added to wishlist" + "')</script>");
        //    SqlConnection conn;
        //    String strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        //    conn = new SqlConnection(strCon);
        //    conn.Open();

        //    string checkDuplicate = "SELECT COUNT(Id) FROM WishList WHERE Id = @Id AND productId = @productId";

        //    string strRetrieve = "INSERT INTO WishList (Id, productId) VALUES (@Id, @productId)";



        //    SqlCommand cmdExecute;
        //    SqlCommand cmdReadCount;


        //    cmdReadCount = new SqlCommand(checkDuplicate, conn);
        //    cmdReadCount.Parameters.AddWithValue("@Id", Session["Cus_id"].ToString());
        //    cmdReadCount.Parameters.AddWithValue("@productId", productId.ToString());

        //    int Number = (int)cmdReadCount.ExecuteScalar();


        //    if (Number != 1)
        //    {

        //        cmdExecute = new SqlCommand(strRetrieve, conn);

        //        cmdExecute.Parameters.AddWithValue("@Id", Session["Cus_id"].ToString());

        //        cmdExecute.Parameters.AddWithValue("@productId", productId.ToString());

        //        cmdExecute.ExecuteNonQuery();
        //    }

        //}



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            HiddenField productId = DataList1.FindControl("hiddenID") as HiddenField;

            switch (e.CommandName)
            {
                case "addToWishList":
                    addWishList(productId.Value);
                    break;
            }

        }

        protected void addWishList(string commandArgument)
        {
            Button lbAddWishlist = (Button)DataList1.FindControl("btnWishList");
            if (countExistingItems(commandArgument, userID))
            {
                con.Open();
                string insertWishListItems =
                    "INSERT INTO WishList (productId, customerID) " +
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
            string query = "Select Count(*) from WishList where artID=@artID AND Cus_id= @Cus_id";
            SqlCommand cmdSelect = new SqlCommand(query, con);
            cmdSelect.Parameters.AddWithValue("@productId", productId);
            cmdSelect.Parameters.AddWithValue("@Cus_id", Cus_id);
            int numberOfItems = int.Parse(cmdSelect.ExecuteScalar().ToString());
            con.Close();

            return (numberOfItems == 0 ? true : false);
        }

    }
}