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
            con.Close();
        }
    }
}