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
                    CartList.DataSource = dt;
                    CartList.DataBind();
                }
            }

            if (!IsPostBack)
            {


                GetData();
                calculateTotal();
            }

            con.Close();
        }

        private void GetData()
        {
            String mq = "select * from Product where Id IN(select Id from Cart where username='" + Session["username"].ToString() + "')";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            con.Open();

            cmd.CommandText = mq;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            CartList.DataSource = ds;
            CartList.DataBind();

            con.Close();
        }

        protected void calculateTotal()
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            String query = "select sum(price*" + 1 + ") AS Total from Product where Id IN(select Id from Cart where username = '" + Session["username"].ToString() + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            con.Open();


            string total = cmd.ExecuteScalar().ToString();
            Session["total"] = total;
            lblTotal.Text = total;

        }






    }


}