using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class TimeLine_About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                String targetID = Session["viewID"] != null ? Session["viewID"].ToString() : Session["UserID"].ToString();

                LoadUserData(Convert.ToInt32(targetID));
                LoadEducationsData(Convert.ToInt32(targetID));
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void LoadUserData(Int32 ID)
        {
            DataSet ds = GetDataFromTable("tbl_users", ID);

            if (ds.Tables[0].Rows.Count != 0)
            {
                LabelAbout.Text = ds.Tables[0].Rows[0]["user_aboutme"].ToString();
                LabelName.Text = ds.Tables[0].Rows[0]["full_name"].ToString();
                LabelCity.Text = ds.Tables[0].Rows[0]["user_city"].ToString();
                LabelPhone.Text = ds.Tables[0].Rows[0]["user_phone"].ToString();
                LabelEmail.Text = ds.Tables[0].Rows[0]["user_email"].ToString();
                LabelLang.Text = ds.Tables[0].Rows[0]["user_country"].ToString();
            }
        }

        public void LoadEducationsData(Int32 ID)
        {
            DataSet ds = GetDataFromTable("tbl_educations", ID);

            if (ds.Tables[0].Rows.Count != 0)
            {
                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();
            }
        }

        private DataSet GetDataFromTable(String table, Int32 id)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from " + table + " where users_id = @p1");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", id);

            return Utility_Class.getData(sda, c);
        }

        public void ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand c = Utility_Class.getPreparedCommand("conn1", "delete from tbl_educations where edu_id = @p1");
                sda.UpdateCommand = c;

                Utility_Class.setCommandParam(c, "@p1", e.CommandArgument);

                Utility_Class.execCommand(c);
            }

            Repeater1.DataBind();

            Response.Redirect("TimeLine_About.aspx");
        }
    }
}