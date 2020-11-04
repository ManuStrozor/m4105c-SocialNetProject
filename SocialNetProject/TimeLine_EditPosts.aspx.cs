using System;
using System.Web.UI;
using System.Data.SqlClient;
using SocialNetProject.App_Code;

namespace SocialNetProject
{
    public partial class TimeLine_EditPosts : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e) // Bouton Save
        {
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand c = Utility_Class.getPreparedCommand("conn1", "insert into tbl_posts values (@p1, @p2, @p3, @p4, @p5, @p6)");
            sda.InsertCommand = c;

            Utility_Class.setCommandParam(c, "@p1", Convert.ToInt32(Session["UserID"].ToString()));
            Utility_Class.setCommandParam(c, "@p2", DateTime.Now.Ticks);
            Utility_Class.setCommandParam(c, "@p3", TextBox1.Text);
            Utility_Class.setCommandParam(c, "@p4", Image1.ImageUrl);
            Utility_Class.setCommandParam(c, "@p5", 0);
            Utility_Class.setCommandParam(c, "@p6", 0);

            Utility_Class.execCommand(c);

            Response.Redirect("TimeLine_Posts.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e) // Bouton Upload
        {
            Label1.Visible = false;
            if (FileUpload1.HasFile == true)
            {
                string randomName = "File-" + DateTime.Now.Ticks.ToString();
                string vir_path = "~/UserImages/" + randomName + ".jpg";
                string phy_path = Server.MapPath(vir_path);
                FileUpload1.SaveAs(phy_path);

                Label1.Visible = true;
                Label1.Text = "The file has been uploaded successfully !";
                Label1.ForeColor = System.Drawing.Color.Green;

                Image1.ImageUrl = vir_path;
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Please select a file to upload";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}