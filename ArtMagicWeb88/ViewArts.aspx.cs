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
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();
            {
                using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM [dbo].[Product]", con))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    DataList1.DataSource = dt;
                    DataList1.DataBind();
                }
            }
            con.Close();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["addtocart"] != null && Session["username"] != null)
            {
                String id = Request.QueryString["addtocart"].ToString();
                String query = "insert into Cart(username,Id) values('" + Session["username"].ToString() + "'," + Request.QueryString["addtocart"].ToString() + ")";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                con.Open();
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
        }

        protected void btnWishList_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["addtowishlist"] != null && Session["username"] != null)
            {
                String query = "insert into Wishlist(username,Id) values('" + Session["username"].ToString() + "'," + Request.QueryString["addtowishlist"].ToString() + ")";
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = con;
                cmd.ExecuteNonQuery();
                ClientScript.RegisterClientScriptBlock
              (this.GetType(), "K", "swal('Wishlist Added!','Product has been added into Wishlist','success')", true);

            }
        }
    }
}