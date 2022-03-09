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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                con = new SqlConnection(strCon);
                con.Open();
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM Product", con))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        WishList1.DataSource = dt;
                        WishList1.DataBind();
                    }
                }
            }
        }

        private void GetData()
        {
            String myquery = "SELECT * FROM Product where Id IN(select Id from Wishlist where username='" + Session["username"].ToString() + "')";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            try
            {
                con.Open();

                cmd.CommandText = myquery;
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                WishList1.DataSource = ds;
                WishList1.DataBind();
            }
            catch (Exception e1)
            {
                lblError.Visible = true;
                lblError.Text = "Database connection error!";
                throw;
            }
            finally
            {
                con.Close();

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

        protected void WishList1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(WishList1.DataKeys[e.RowIndex].Value);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            String query = "Delete from Wishlist where Id = " + id;
            SqlCommand cmd = new SqlCommand(query, con);
            try
            {
                con.Open();
                int row = cmd.ExecuteNonQuery();

                if (row > 0)
                {
                    Page.ClientScript.RegisterClientScriptBlock
                        (this.GetType(), "K", "swal('Deleted!','Record is removed from Wishlist!','success')", true);
                    GetData();
                }
            }
            catch (Exception e1)
            {
                lblError.Visible = true;
                lblError.Text = "Database connection error!";
                throw;
            }
            finally
            {
                con.Close();

            }
        }

    }
}