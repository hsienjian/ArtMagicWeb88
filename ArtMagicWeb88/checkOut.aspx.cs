using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMagicWeb88
{
    public partial class checkOut : System.Web.UI.Page
    {
        private SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        private string userID = string.Empty;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Session["Cus_id"].ToString();
            if (!this.IsPostBack)
            {

                bindData();

                countTotalAmount();
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

        protected string countTotalAmount()
        {
            createConnection();
            String query = "select sum(price*" + 1 + ") AS Total from product where productId IN(select productId from Cart where Cus_id = '" + Session["Cus_id"].ToString() + "')";
            SqlCommand cmdSelect = new SqlCommand(query, conn);
            string total = cmdSelect.ExecuteScalar().ToString();
            Session["total"] = total;
            tAmount.Text = total;
            conn.Close();

            return tAmount.Text;
        }


        protected DataTable bindDataCheckOutTable(string Cus_id)
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
            lvcheckOut.DataSource = bindDataCheckOutTable(userID);
            lvcheckOut.DataBind();
        }

    }
}