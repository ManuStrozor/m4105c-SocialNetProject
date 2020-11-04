using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e) // Register
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "insert into tbl_users values (@p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10, @p11, @p12, @p13, @p14, @p15)");
            sda.InsertCommand = c;

            Utility_Class.setCommandParam(c, "@p1", TextBox1.Text);
            Utility_Class.setCommandParam(c, "@p2", TextBox2.Text);
            Utility_Class.setCommandParam(c, "@p3", Utility_Class.hash_func(TextBox3.Text));
            Utility_Class.setCommandParam(c, "@p4", "01/01/2020");
            Utility_Class.setCommandParam(c, "@p5", RadioButton1.Checked == true ? 1 : 0);
            Utility_Class.setCommandParam(c, "@p6", "Paris");
            Utility_Class.setCommandParam(c, "@p7", "France");
            Utility_Class.setCommandParam(c, "@p8", "");
            Utility_Class.setCommandParam(c, "@p9", "../images/profile.png");
            Utility_Class.setCommandParam(c, "@p10", "../images/resources/timeline-1.jpg");
            Utility_Class.setCommandParam(c, "@p11", "");
            Utility_Class.setCommandParam(c, "@p12", "");
            Utility_Class.setCommandParam(c, "@p13", 0);
            Utility_Class.setCommandParam(c, "@p14", DateTime.Now.Ticks);
            Utility_Class.setCommandParam(c, "@p15", 0);

            Utility_Class.execCommand(c);
        }

        protected void Button2_Click1(object sender, EventArgs e) // Login
        {
            Label1.Visible = false;

            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_users where user_email = @p1 and user_password = @p2");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", TextBox4.Text);
            Utility_Class.setCommandParam(c, "@p2", Utility_Class.hash_func(TextBox5.Text));

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                Session["UserID"] = ds.Tables[0].Rows[0]["users_id"].ToString();
                Response.Redirect("TimeLine_About.aspx");
            }
            else
            {
                Label1.Visible = true;
            }
        }
    }
}