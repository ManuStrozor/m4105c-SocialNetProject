using System;
using System.Web.UI;
using System.Web.UI.WebControls;
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
                editBoxContent.Visible = (Session["viewID"] == null);

                if (IsPostBack && FileUpload1.HasFile)
                {
                    updatePic(FileUpload1, "user_profilepic");
                }
                else if (IsPostBack && FileUploadCover.HasFile)
                {
                    updatePic(FileUploadCover, "user_coverpic");
                }
            }
        }

        private void updatePic(FileUpload f, String column)
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