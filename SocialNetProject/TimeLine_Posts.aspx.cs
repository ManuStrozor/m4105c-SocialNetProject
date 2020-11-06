using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class TimeLine_Posts : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                Int32 currentID = Convert.ToInt32(Session["UserID"].ToString());
                if (Session["viewID"] != null)
                {
                    Int32 targetID = Convert.ToInt32(Session["viewID"].ToString());
                    if (!IsPostBack && (this.Master as TimeLine).CheckFriendship(currentID, targetID)) LoadPostsData(targetID);
                }
                else
                {
                    if (!IsPostBack) LoadPostsData(currentID);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        

        public void LoadPostsData(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            String countCommentsRequest = "select count(*) from tbl_comments where tbl_comments.post_id = tbl_posts.post_id";
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select (" + countCommentsRequest + ") as nb_comments, * from tbl_posts" +
                " inner join tbl_users on tbl_users.users_id = tbl_posts.users_id" +
                " where tbl_posts.users_id = @p1" +
                " order by post_datetime desc");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();
            }
        }

        public void ItemBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_comments" +
                    " inner join tbl_posts on tbl_comments.post_id = tbl_posts.post_id" +
                    " inner join tbl_users on tbl_comments.users_id = tbl_users.users_id" +
                    " where tbl_posts.post_id = @p1");
                sda.SelectCommand = c;

                Utility_Class.setCommandParam(c, "@p1", DataBinder.Eval(e.Item.DataItem, "post_id"));

                DataSet ds = Utility_Class.getData(sda, c);

                if (ds.Tables[0].Rows.Count != 0)
                {
                    Repeater Repeater2 = (Repeater)e.Item.FindControl("Repeater2");
                    Repeater2.DataSource = ds.Tables[0];
                    Repeater2.DataBind();
                }
            }
        }

        public void ItemCommandPosts(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "viewFriend")
            {
                Session["viewID"] = e.CommandArgument;
                Response.Redirect("TimeLine_About.aspx");
            }
            else if (e.CommandName == "send")
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand c = Utility_Class.getPreparedCommand("conn1", "insert into tbl_comments values (@p1, @p2, @p3, @p4)");
                sda.InsertCommand = c;

                Utility_Class.setCommandParam(c, "@p1", e.CommandArgument);
                Utility_Class.setCommandParam(c, "@p2", Convert.ToInt32(Session["UserID"].ToString()));
                Utility_Class.setCommandParam(c, "@p3", DateTime.Now.Ticks);
                Utility_Class.setCommandParam(c, "@p4", ((TextBox)e.Item.FindControl("TextBoxComment")).Text);

                Utility_Class.execCommand(c);

                Repeater1.DataBind();

                Response.Redirect("TimeLine_Posts.aspx");
            }
            else if (e.CommandName == "like" || e.CommandName == "dislike")
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                SqlCommand c = Utility_Class.getPreparedCommand("conn1", e.CommandName == "like" 
                        ? "update tbl_posts set post_likes = post_likes + 1 where post_id = @p1"
                        : "update tbl_posts set post_dislikes = post_dislikes + 1 where post_id = @p1"
                    );
                sda.UpdateCommand = c;

                Utility_Class.setCommandParam(c, "@p1", e.CommandArgument);

                Utility_Class.execCommand(c);

                Repeater1.DataBind();

                Response.Redirect("TimeLine_Posts.aspx");
            }
        }

        public void ItemCommandComments(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "viewFriend")
            {
                Session["viewID"] = e.CommandArgument;
                Response.Redirect("TimeLine_About.aspx");
            }
        }

        public Object FixPath(Object o)
        {
            return o.ToString().Replace("~", "..");
        }

        public Object FixDate(Object o)
        {
            Int64 timeTicks = Convert.ToInt64(o.ToString());
            DateTime dt = new DateTime(timeTicks);

            return dt.ToLongDateString();
        }
    }
}