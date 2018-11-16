using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASAFORM
{
    public partial class _Default : Page
    {
        [WebMethod]
        public static string validaUser(string chkvalues)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            var userD=chkvalues.Split('|');

            sql = "SELECT Userid,Name,UserName,Pass,Rollid FROM Users";
            sql += " WHERE UserName='" + userD[0] + "' AND Pass='" + userD[1] + "'";


            SqlConnection conn = new SqlConnection(conexion);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            try
            {
                SqlCommand Cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = Cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        retorna += dr["Userid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["Rollid"].ToString() + '|';
                    }

                }
                HttpContext.Current.Session["SesData"]=retorna;
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }
    }
}