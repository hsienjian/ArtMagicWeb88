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
            if (!this.IsPostBack)
            {
                DataTable dt = this.GetData();
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["addtowishlist"] != null && Session["username"] != null)
                {
                    String query = "insert into Wishlist(username,Id) values('" + Session["username"].ToString() + "'," + Request.QueryString["addtowishlist"].ToString() + ")";

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterClientScriptBlock
                  (this.GetType(), "K", "swal('Wishlist Added!','Product has been added into Wishlist','success')", true);

                }
                else if (Request.QueryString["addtocart"] != null && Session["username"] != null)
                {
                    String id = Request.QueryString["addtocart"].ToString();
                    String query = "insert into Cart(username,Id) values('" + Session["username"].ToString() + "'," + Request.QueryString["addtocart"].ToString() + ")";

                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = query;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterClientScriptBlock
                  (this.GetType(), "K", "swal('Cart Added!','Product has been added into Cart','success')", true);


                    SqlCommand cmd1 = con.CreateCommand();
                    cmd1.CommandType = CommandType.Text;
                    cmd1.CommandText = "Update Product SET qty=qty-" + 1 + "Where Id=" + id;
                    cmd1.ExecuteNonQuery();


                }

                if (Session["username"] == null)
                {
                    if (Request.QueryString["addtowishlist"] != null)
                    {
                        Response.Write("<script>alert('Login to Your Account First. No Product Added in WishList');</script>");
                    }
                    else if (Request.QueryString["addtocart"] != null)
                    {
                        Response.Write("<script>alert('Login to Your Account First. No Product Added in Cart');</script>");
                    }
                }

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
            
            
        }

        protected void btnWishList_Click(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
                Response.Redirect("ViewArts.aspx?addtocart=" + e.CommandArgument.ToString());

            else if (e.CommandName == "addtowishlist")
                Response.Redirect("ViewArts.aspx?addtowishlist=" + e.CommandArgument.ToString());
        }
    }
}