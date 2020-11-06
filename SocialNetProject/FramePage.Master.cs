using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class FramePage : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                if (Request.QueryString["me"] != null && Request.QueryString["me"] == "yes")
                {
                    Session.Remove("viewID");
                }
                if (Session["viewID"] != null)
                {
                    LoadSessionVariables(Convert.ToInt32(Session["viewID"].ToString()));
                }
                else
                {
                    LoadSessionVariables(Convert.ToInt32(Session["UserID"].ToString()));
                }
            }
            else
                Response.Redirect("Login.aspx");
        }

        public void LoadSessionVariables(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_users where users_id = @p1");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                Session["fullname"] = ds.Tables[0].Rows[0]["full_name"].ToString();
                Session["shortbio"] = ds.Tables[0].Rows[0]["user_shortbio"].ToString();
                Session["profilepic"] = ds.Tables[0].Rows[0]["user_profilepic"].ToString();
                Session["coverpic"] = ds.Tables[0].Rows[0]["user_coverpic"].ToString();
            }
        }

        public string SetFullName()
        {
            return (Session["fullname"] != null) ? Session["fullname"].ToString() : "Default Name";
        }

        public string SetProfilePic()
        {
            return (Session["profilepic"] != null) ? Session["profilepic"].ToString() : "images/resources/user-avatar.jpg";
        }

        public string SetCoverPic()
        {
            return (Session["coverpic"] != null) ? Session["coverpic"].ToString() : "images/resources/timeline-1.jpg";
        }

        public string SetShortbio()
        {
            return (Session["shortbio"] != null) ? Session["shortbio"].ToString() : "Default Short Bio";
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}