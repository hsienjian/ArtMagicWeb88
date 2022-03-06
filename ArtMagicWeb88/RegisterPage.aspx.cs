using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;


namespace ArtMagicWeb88
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signBtn_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                string sql = "INSERT INTO User VALUES (@email, @password, @confirmPassword)";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@email", regEmail.Text);
                    cmd.Parameters.AddWithValue("@password", regPassword.Text);
                    cmd.Parameters.AddWithValue("@confirmPassword", regComPassword.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Label1.Text = "Register Succesfully!";
                }

            }
        }
    }
}