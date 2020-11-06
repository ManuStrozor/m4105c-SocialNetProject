using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class TimeLine_Images : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                Int32 currentID = Convert.ToInt32(Session["UserID"].ToString());
                if (Session["viewID"] != null)
                {
                    Int32 targetID = Convert.ToInt32(Session["viewID"].ToString());
                    if ((this.Master as TimeLine).CheckFriendship(currentID, targetID)) LoadImagesData(targetID);
                }
                else
                {
                    LoadImagesData(currentID);
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public void LoadImagesData(Int32 ID)
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "select * from tbl_images where users_id = @p1");
            sda.SelectCommand = c;

            Utility_Class.setCommandParam(c, "@p1", ID);

            DataSet ds = Utility_Class.getData(sda, c);

            if (ds.Tables[0].Rows.Count != 0)
            {
                Repeater1.DataSource = ds.Tables[0];
                Repeater1.DataBind();
            }
        }

        public Object FixPath(Object path)
        {
            return path.ToString().Replace("~", "..");
        }
    }
}