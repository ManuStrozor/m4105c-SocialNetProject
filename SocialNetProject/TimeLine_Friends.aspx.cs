using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class TimeLine_Friends : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                Int32 currentID = Convert.ToInt32(Session["UserID"].ToString());
                if (Session["viewID"] != null)
                {
                    Int32 targetID = Convert.ToInt32(Session["viewID"].ToString());
                    if (!IsPostBack && (this.Master as TimeLine).CheckFriendship(currentID, targetID))
                    {
                        LoadFriendsData(targetID);
                        LoadRequestsData(targetID);
                    }
                }
                else if (!IsPostBack)
                {
                    LoadFriendsData(currentID);
                    LoadRequestsData(currentID);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void LoadFriendsData(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select *" +
                " from tbl_users" +
                " where users_id != @p1 and" +
                " users_id in ( select users_id_2 from tbl_friendship where users_id_1 = @p1 and friendship_status = 1) or" +
                " users_id in ( select users_id_1 from tbl_friendship where users_id_2 = @p1 and friendship_status = 1)");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                LabelNbFriends.Text = ds.Tables[0].Rows.Count.ToString();

                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();
            }
        }

        public void LoadRequestsData(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select *" +
                " from tbl_friendship inner join tbl_users on tbl_users.users_id = tbl_friendship.users_id_1" +
                " where tbl_friendship.friendship_status = 0 and" +
                " tbl_friendship.users_id_2 = @p1");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                LabelNbRequests.Text = ds.Tables[0].Rows.Count.ToString();

                Repeater2.DataSource = ds.Tables[0];
                Repeater2.DataBind();
            }
        }

        public void ItemCommandFriends(object source, RepeaterCommandEventArgs e)
        {
            String ID = ((Label)e.Item.FindControl("Label1")).Text;

            if (e.CommandName == "viewFriend")
            {
                Session["viewID"] = ID;
                Response.Redirect("TimeLine_About.aspx");
            }
            else if (e.CommandName == "block")
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand c = Utility_Class.getPreparedCommand("conn1", "delete from tbl_friendship" +
                    " where (users_id_1 = @p1 and users_id_2 = @p2)" +
                    " or (users_id_1 = @p2 and users_id_2 = @p1)" +
                    " and friendship_status = 1");
                sda.UpdateCommand = c;

                Utility_Class.setCommandParam(c, "@p1", Convert.ToInt32(Session["userID"].ToString()));
                Utility_Class.setCommandParam(c, "@p2", Convert.ToInt32(ID));

                Utility_Class.execCommand(c);
            }

            Repeater1.DataBind();

            Response.Redirect("TimeLine_Friends.aspx");
        }

        public void ItemCommandRequests(object source, RepeaterCommandEventArgs e)
        {
            String ID = ((Label)e.Item.FindControl("Label2")).Text;

            if (e.CommandName == "viewFriend")
            {
                Session["viewID"] = ID;
                Response.Redirect("TimeLine_About.aspx");
            }
            else if (e.CommandName == "delete" || e.CommandName == "confirm") // Delete + Confirm
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand c = Utility_Class.getPreparedCommand("conn1", e.CommandName == "delete" 
                        ? "delete from tbl_friendship where users_id_2 = @p1 and users_id_1 = @p2"
                        : "update tbl_friendship set friendship_status = 1 where users_id_1 = @p2 and users_id_2 = @p1"
                    );
                sda.UpdateCommand = c;

                Utility_Class.setCommandParam(c, "@p1", Convert.ToInt32(Session["userID"].ToString()));
                Utility_Class.setCommandParam(c, "@p2", Convert.ToInt32(ID));

                Utility_Class.execCommand(c);
            }

            Repeater2.DataBind();

            Response.Redirect("TimeLine_Friends.aspx");
        }
    }
}