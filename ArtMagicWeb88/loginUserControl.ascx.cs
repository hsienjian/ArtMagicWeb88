using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtMagicWeb88
{
    public partial class loginUserControl : System.Web.UI.UserControl
    {
        public DateTime loginDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            string message = "Good day!";
            if (loginDate.Hour < 12)
                message = "Good morning!";
            lblGreet.Text = message;

            
        }
    }
}