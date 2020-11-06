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
                LoadSessionVars(Convert.ToInt32(Session["UserID"].ToString()));

                if (Session["viewID"] != null)
                {
                    LoadSessionVars(Convert.ToInt32(Session["viewID"].ToString()));
                }
            }
            else
                Response.Redirect("Login.aspx");
        }

        public void LoadSessionVars(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_users where users_id = @p1");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                if (ID == Convert.ToInt32(Session["UserID"].ToString()))
                {
                    Session["online_status"] = ds.Tables[0].Rows[0]["online_status"];
                    Session["profilepic"] = ds.Tables[0].Rows[0]["user_profilepic"].ToString();
                }
                Session["view_profilepic"] = ds.Tables[0].Rows[0]["user_profilepic"].ToString();
                Session["fullname"] = ds.Tables[0].Rows[0]["full_name"].ToString();
                Session["shortbio"] = ds.Tables[0].Rows[0]["user_shortbio"].ToString();
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

        public string SetViewProfilePic()
        {
            return (Session["view_profilepic"] != null) ? Session["view_profilepic"].ToString() : "images/resources/user-avatar.jpg";
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

        public string SetOnlineStatus()
        {
            if (Convert.ToInt32(Session["online_status"].ToString()) == 0)
                return "online";
            else if (Convert.ToInt32(Session["online_status"].ToString()) == 1)
                return "away";
            else
                return "offline";
        }

        protected void LinkButton1_Click(object sender, EventArgs e) // Online button
        {
            Update_Online_status(0);
        }

        protected void LinkButton2_Click(object sender, EventArgs e) // Away button
        {
            Update_Online_status(1);
        }

        protected void LinkButton3_Click(object sender, EventArgs e) // Offline button
        {
            Update_Online_status(2);
        }

        private void Update_Online_status(int status) {

            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "update tbl_users set online_status = @p2 where users_id = @p1");
            sda.UpdateCommand = c;

            Utility_Class.setCommandParam(c, "@p1", Convert.ToInt32(Session["UserID"].ToString()));
            Utility_Class.setCommandParam(c, "@p2", status);

            Utility_Class.execCommand(c);

            LoadSessionVars(Convert.ToInt32(Session["UserID"].ToString()));
            if (Session["viewID"] != null) LoadSessionVars(Convert.ToInt32(Session["viewID"].ToString()));
        }
    }
}