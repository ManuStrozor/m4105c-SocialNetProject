using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SocialNetProject.App_Code
{
    public class Utility_Class
    {
        public static String hash_func(String str_in)
        {
            String str_out = "";

            for (int i = 0; i < str_in.Length; i++)
            {
                str_out = str_out + Convert.ToInt16(str_in[i]).ToString();
            }

            return str_out;
        }

        public static SqlConnection scOpen(String connectionIndex)
        {
            SqlConnection sc = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings[connectionIndex].ToString());
            sc.Open();
            return sc;
        }

        public static SqlCommand getPreparedCommand(String connectionIndex, String request)
        {
            return new SqlCommand(request, scOpen(connectionIndex));
        }

        public static void setCommandParam(SqlCommand c, String param, String value)
        {
            c.Parameters.AddWithValue(param, value);
        }
        public static void setCommandParam(SqlCommand c, String param, int value)
        {
            c.Parameters.AddWithValue(param, value);
        }
        public static void setCommandParam(SqlCommand c, String param, long value)
        {
            c.Parameters.AddWithValue(param, value);
        }
        public static void setCommandParam(SqlCommand c, String param, Object value)
        {
            c.Parameters.AddWithValue(param, value);
        }

        public static void execCommand(SqlCommand c)
        {
            c.ExecuteNonQuery();
            c.Connection.Close();
        }

        public static void loadData(DataSet ds, SqlDataAdapter sda, SqlCommand c)
        {
            sda.Fill(ds);
            c.Connection.Close();
        }

        public static DataSet getData(SqlDataAdapter sda, SqlCommand c)
        {
            DataSet ds = new DataSet();
            loadData(ds, sda, c);
            return ds;
        }
    }
}