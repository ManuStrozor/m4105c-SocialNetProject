using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class TimeLine_EditBasic : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                if(!IsPostBack) LoadData(Convert.ToInt32(Session["UserID"].ToString()));
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void LoadData(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_users where users_id = @p1");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                TextBox1.Text = ds.Tables[0].Rows[0]["full_name"].ToString();
                TextBox2.Text = ds.Tables[0].Rows[0]["user_email"].ToString();
                TextBox3.Text = ds.Tables[0].Rows[0]["user_phone"].ToString();

                string bstr = ds.Tables[0].Rows[0]["user_birthdate"].ToString();
                string[] bstr_list = bstr.Split('/');
                DropDownList1.Text = bstr_list[0].ToString();
                DropDownList2.Text = bstr_list[1].ToString();
                DropDownList3.Text = bstr_list[2].ToString();

                if (ds.Tables[0].Rows[0]["user_sex"].ToString() == "0")
                    RadioButton1.Checked = true;
                else
                    RadioButton2.Checked = true;

                DropDownList4.Text = ds.Tables[0].Rows[0]["user_country"].ToString();

                TextBox4.Text = ds.Tables[0].Rows[0]["user_city"].ToString();
                TextBox5.Text = ds.Tables[0].Rows[0]["user_aboutme"].ToString();
                TextBox6.Text = ds.Tables[0].Rows[0]["user_shortbio"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e) // Update
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "update tbl_users" +
                " set full_name = @p1," +
                " user_phone = @p2," +
                " user_birthdate = @p3," +
                " user_sex = @p4," +
                " user_city = @p5," +
                " user_country = @p6," +
                " user_aboutme = @p7," +
                " user_shortbio = @p8" +
                " where users_id = @p9");
            sda.UpdateCommand = c;

            Utility_Class.setCommandParam(c, "@p1", TextBox1.Text);
            Utility_Class.setCommandParam(c, "@p2", TextBox3.Text);
            Utility_Class.setCommandParam(c, "@p3", DropDownList1.Text + "/" + DropDownList2.Text + "/" + DropDownList3.Text);
            Utility_Class.setCommandParam(c, "@p4", RadioButton1.Checked == true ? 0 : 1);
            Utility_Class.setCommandParam(c, "@p5", TextBox4.Text);
            Utility_Class.setCommandParam(c, "@p6", DropDownList4.SelectedValue.ToString());
            Utility_Class.setCommandParam(c, "@p7", TextBox5.Text);
            Utility_Class.setCommandParam(c, "@p8", TextBox6.Text);
            Utility_Class.setCommandParam(c, "@p9", Convert.ToInt32(Session["userID"].ToString()));

            Utility_Class.execCommand(c);

            Response.Redirect("TimeLine_About.aspx");
        }
    }
}