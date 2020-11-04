using System;
using System.Web.UI;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class Edit_Educations : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "insert into tbl_educations values (@p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8)");
            sda.InsertCommand = c;

            Utility_Class.setCommandParam(c, "@p1", Convert.ToInt32(Session["UserID"].ToString()));
            Utility_Class.setCommandParam(c, "@p2", TextBox1.Text);
            Utility_Class.setCommandParam(c, "@p3", TextBox2.Text);
            Utility_Class.setCommandParam(c, "@p4", TextBox3.Text);
            Utility_Class.setCommandParam(c, "@p5", TextBox4.Text);
            Utility_Class.setCommandParam(c, "@p6", DropDownList1.Text);
            Utility_Class.setCommandParam(c, "@p7", TextBox5.Text);
            Utility_Class.setCommandParam(c, "@p8", CheckBox1.Checked ? 1 : 0);

            Utility_Class.execCommand(c);

            Response.Redirect("TimeLine_About.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}