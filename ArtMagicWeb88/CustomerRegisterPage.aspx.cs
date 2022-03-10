using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ArtMagicWeb88
{
    public partial class CustomerRegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signBtn_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);

            String query = "INSERT INTO CustomerAccount (Cus_username, Cus_email, Cus_password, Cus_confirmPassword, Cus_gender, Cus_phone, Cus_Address) " +
                "VALUES (@ArtCusUsername,@ArtCusEmail,@ArtCusPassword,@ArtCusConfirmPassword, @ArtCusGender, @ArtCusPhone, @ArtCusAddress)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ArtCusUsername", regCusUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtCusEmail", regCusEmail.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtCusPassword", regCusPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtCusConfirmPassword", regCusComPassword.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtCusGender", cusGender.SelectedValue);
            cmd.Parameters.AddWithValue("@ArtCusPhone", regCusphone.Text.Trim());
            cmd.Parameters.AddWithValue("@ArtCusAddress", regCusAddress.Text.Trim());
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Redirect("CustomerLoginPage.aspx");
        }
    }
}