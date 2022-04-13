using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;

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

        protected void btnConfirmPayment_Click(object sender, EventArgs e)
        {
            string body = string.Empty;

            SqlConnection paymentConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            paymentConnection.Open();

            SqlCommand insertCommand = new SqlCommand("INSERT INTO Payment(ReceiverName, ReceiverEmail, ReceiverAddress, PaymentMethod, Cus_id, Status, PhoneNumber, Date)" +
                "VALUES (@Name,@Email,@Address,@PayMethod, @Cust_ID, @status, @PhoneNum, @date)");

            insertCommand.Parameters.AddWithValue("@Name", fName.Text);
            insertCommand.Parameters.AddWithValue("@Email", email.Text);
            insertCommand.Parameters.AddWithValue("@Address", address.Text);
            insertCommand.Parameters.AddWithValue("@PayMethod", ddlPayment.SelectedValue);
            insertCommand.Parameters.AddWithValue("@Cust_ID", Session["Cus_id"].ToString());
            insertCommand.Parameters.AddWithValue("@status", "Delivering");
            insertCommand.Parameters.AddWithValue("@PhoneNum", pNumber.Text);
            insertCommand.Parameters.AddWithValue("@date", System.DateTime.Now.ToString());

            insertCommand.Connection = paymentConnection;

            insertCommand.ExecuteNonQuery();

            string delete = "Delete from Cart where Cus_id=@Cus_id";

            SqlCommand cmdDelete = new SqlCommand(delete, paymentConnection);
            cmdDelete.Parameters.AddWithValue("@Cus_id", Session["Cus_id"].ToString());

            string to = "puahhj-wm19@student.tarc.edu.my"; //To address    
            string from = "yapjy-wm19@student.tarc.edu.my"; //From address    
            MailMessage message = new MailMessage(from, to);
            message.Subject = "Payment Receipt";
            message.IsBodyHtml = true;
            StreamReader sr = new StreamReader(Server.MapPath("~/E-Receipt.aspx"));
            body = sr.ReadToEnd();

            body = body.Replace("{Name}", fName.Text.ToString());
            body = body.Replace("{Email}", email.Text.ToString());
            body = body.Replace("{Address}", address.Text.ToString());
            body = body.Replace("{Date}", System.DateTime.Now.ToString());
            body = body.Replace("{total}", Session["total"].ToString());
            string mailbody = body;
            message.Body = mailbody;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("yapjy-wm19@student.tarc.edu.my", "14mwolverine");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            client.Send(message);

            paymentConnection.Close();
            Response.Write("<script>alert('Payment successfull!!! Order Processing.')</script>");
            Server.Transfer("ViewArts.aspx");
        }
    }
}