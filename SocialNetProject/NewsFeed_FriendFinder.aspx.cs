using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class NewsFeed_FriendFinder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                LoadFriendsData(Convert.ToInt32(Session["UserID"].ToString()));
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void LoadFriendsData(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_users where users_id != @p1" +
                " and users_id not in ( select users_id_2 from tbl_friendship where users_id_1 = @p1 and friendship_status != 2)" +
                " and users_id not in ( select users_id_1 from tbl_friendship where users_id_2 = @p1 and friendship_status != 2)");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();
            }
        }

        public void ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "viewFriend")
            {
                Session["viewID"] = ((Label)e.Item.FindControl("Label1")).Text;
                Response.Redirect("TimeLine_About.aspx");
            }
            else if (e.CommandName == "addFriend")
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand c = Utility_Class.getPreparedCommand("conn1", "insert into tbl_friendship values (@p1, @p2, @p3)");
                sda.InsertCommand = c;

                // Set Command Parameters
                Utility_Class.setCommandParam(c, "@p1", Convert.ToInt32(Session["UserID"].ToString()));
                Utility_Class.setCommandParam(c, "@p2", Convert.ToInt32(((Label)e.Item.FindControl("Label1")).Text));
                Utility_Class.setCommandParam(c, "@p3", 0);

                Utility_Class.execCommand(c);

                Repeater1.DataBind();

                Response.Redirect("NewsFeed_FriendFinder.aspx");
            }
        }
    }
}