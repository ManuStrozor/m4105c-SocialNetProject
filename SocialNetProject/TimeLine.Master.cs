using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class TimeLine : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                if (Request.QueryString["me"] != null && Request.QueryString["me"] == "yes") Session.Remove("viewID");

                Boolean noViewSession = Session["viewID"] == null;
                Boolean viewSession = !noViewSession;
                // Things only for current Session
                editCPContent.Visible = noViewSession;
                editPPContent.Visible = noViewSession;
                editBoxContent.Visible = noViewSession;
                // Things for View Session
                addFriendContent.Visible = viewSession && !CheckFriendship(Convert.ToInt32(Session["UserID"].ToString()), Convert.ToInt32(Session["viewID"].ToString()));

                if (IsPostBack && FileUpload1.HasFile)
                {
                    UpdatePic(FileUpload1, "user_profilepic");
                }
                else if (IsPostBack && FileUploadCover.HasFile)
                {
                    UpdatePic(FileUploadCover, "user_coverpic");
                }
            }
        }

        public Boolean CheckFriendship(Int32 currentID, Int32 targetID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_users" +
                " where users_id = @p1" +
                " and users_id in ( select users_id_2 from tbl_friendship where users_id_1 = @p2 and friendship_status = 1)" +
                " or users_id in ( select users_id_1 from tbl_friendship where users_id_2 = @p2 and friendship_status = 1)");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", targetID);
            Utility_Class.setCommandParam(c, "@p2", currentID);

            DataSet ds = Utility_Class.getData(sda, c);

            return (ds.Tables[0].Rows.Count != 0);
        }

        private void UpdatePic(FileUpload f, String column)
        {
            string randomName = "File-" + DateTime.Now.Ticks.ToString();
            string vir_path = "~/UserImages/" + randomName + ".jpg";
            string phy_path = Server.MapPath(vir_path);
            f.SaveAs(phy_path);

            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "update tbl_users set " + column + " = @p1 where users_id = @p2");
            sda.UpdateCommand = c;

            Utility_Class.setCommandParam(c, "@p1", vir_path.Replace("~", ".."));
            Utility_Class.setCommandParam(c, "@p2", Convert.ToInt32(Session["UserID"].ToString()));

            Utility_Class.execCommand(c);

            Response.Redirect("TimeLine_About.aspx");
        }
    }
}