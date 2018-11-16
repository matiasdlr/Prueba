using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASAFORM
{
    public partial class CheckInOut : Page
    {
        //fill select block

        
        [WebMethod]
        public static string stSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT studentid,name,lastname FROM Students";
            sql += " WHERE stateid=3";


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
                        retorna += dr["studentid"].ToString() + '|';
                        retorna += dr["name"].ToString() + '|';
                        retorna += dr["lastname"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string RollSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Rollid,Roll,Description FROM Rolls";


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
                        retorna += dr["Rollid"].ToString() + '|';
                        retorna += dr["Roll"].ToString() + '|';
                        retorna += dr["Description"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }
        


        [WebMethod]
        public static string actCat()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idCateg,Category FROM Category";


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
                        retorna += dr["idCateg"].ToString() + '|';
                        retorna += dr["Category"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string actiSchSelect(int actid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT A.ID,A.idActivity,A.idSchedule, SC.ShortDay,SC.TimeSc FROM actSchedule A";
            sql += " LEFT JOIN Schedules SC ON A.IDSCHEDULE = SC.idSchedule";
            sql += " WHERE A.idActivity =" + actid + "";

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
                        retorna += dr["idschedule"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["TimeSc"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string traeSelect(int stid)
        {
        string retorna = string.Empty;
        string sql = string.Empty;
        string name = string.Empty;

        string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
        SqlConnection conn = new SqlConnection(conexion);

            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }


                sql = "SELECT ST.Studentid, ST.Name,ST.LastName,A.activity,S.ShortDay,S.TimeSc,A.Price,T.Name AS Teacher FROM StudentActivities SA";
                sql += " LEFT JOIN Students ST ON SA.Studentid = ST.Studentid";
                sql += " LEFT JOIN Activities A ON SA.Activityid = A.idActivity";
                sql += " LEFT JOIN Schedules S ON SA.idSchedule = S.idSchedule";
                sql += " LEFT JOIN Teachers T ON A.Teacherid = T.Teacherid";
                sql += " WHERE ST.Stateid = 3 AND SA.Studentid =" + stid;
                sql += " ORDER BY StActivityid DESC";

                SqlCommand Cmd = new SqlCommand(sql, conn);
    SqlDataReader dr = Cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        retorna += dr["Studentid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';
                        retorna += dr["activity"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["TimeSc"].ToString() + '|';
                        retorna += dr["Teacher"].ToString() + '|';
                        retorna += String.Format("{0:C}", dr["Price"]).ToString().Split('$')[1] + '^';
                    }

                }
                conn.Close();
                dr.Close();
                Cmd.Dispose();
       }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }


        [WebMethod]
        public static string actiSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idActivity,Activity FROM Activities";


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
                        retorna += dr["idActivity"].ToString() + '|';
                        retorna += dr["Activity"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }
        [WebMethod]
        public static string stFromSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idFrom,stfrom FROM stFroms";


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
                        retorna += dr["idFrom"].ToString() + '|';
                        retorna += dr["stfrom"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }
        [WebMethod]
        public static string stGraSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idGrade,Grade FROM Grades";


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
                        retorna += dr["idGrade"].ToString() + '|';
                        retorna += dr["Grade"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }
        [WebMethod]
        public static string stStateSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Stateid,State FROM States";


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
                        retorna += dr["Stateid"].ToString() + '|';
                        retorna += dr["State"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }
        [WebMethod]
        public static string actTeachSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Teacherid,Name FROM Teachers";


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
                        retorna += dr["Teacherid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string ddlwteac()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT DISTINCT cmsTeacher FROM Students";
            sql += " WHERE cmsTeacher <> '' ORDER BY cmsTeacher ASC";


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
                        retorna += dr["cmsTeacher"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }


        [WebMethod]
        public static string ddlshortday()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idShortDay,ShortDay FROM shortday";


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
                        retorna += dr["idShortDay"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }
        [WebMethod]
        public static string actSchedSelect()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idSchedule,Day, SD.ShortDay,TimeSc,SC.idshortday FROM Schedules SC";
            sql += " LEFT JOIN SHORTDAY SD ON SC.IDSHORTDAY = SD.IDSHORTDAY";


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
                        retorna += dr["idSchedule"].ToString() + '|';
                        retorna += dr["Day"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["Timesc"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        //fill select block

        //check user
        [WebMethod]
        public static string isUserIn()
        {
            var retorna = string.Empty;
            if (HttpContext.Current.Session["SesData"] != null) { 
            var sec= HttpContext.Current.Session["SesData"].ToString();
            if (sec != "") {
                retorna = sec;
            }
            }
            return retorna;
            
        }

        //check user

        //WorkArea Block
        [WebMethod]
        public static string sendSec(string secD, string SecE)
        {

            string Retorna = string.Empty;

            var correo = ConfigurationManager.AppSettings["desdeCorreo"].ToString();
            string emserver = ConfigurationManager.AppSettings["servidorCorreo"].ToString();
            string emuser = ConfigurationManager.AppSettings["usuarioCorreo"].ToString();
            string userpass = ConfigurationManager.AppSettings["claveCorreo"].ToString();
            MailMessage mMessage = new MailMessage();
            mMessage.From = new MailAddress(correo);
            
            try
                  {
                var mibody = "";
                mMessage.To.Add(SecE.Split('|')[0]);
                mMessage.Subject = SecE.Split('|')[1];
                mibody += "<html><head></head><body>";

                var data = secD.Split('^');
                var sectb = "";
                sectb += "<table class='table table-tripped' style='background-color:#ffe1cb;margin-left:5px;'>";
                sectb += "<thead>";
                sectb += "<tr style = 'background -color:#9ddeff;' >";
                sectb += "<th> STUDENT </th>";
                sectb += "<th> ACTIVITY </th>";
                sectb += "<th> SCHEDULE </th>";
                sectb += "<th> MOTHER'S EMAIL</th>";
                sectb += "<th>FATHER'S EMAIL</th>";
                sectb += "<th>CMS TEACHER</th>";
                sectb += "</tr>";
                sectb += "</thead>";
                sectb += "<tbody id = 'waTbody' >";
                for (int i = 0; i < data.Length - 1; i++)
                {
                    var filas = data[i].Split('|');

                    sectb += "<tr style='background-color:#ffa94d;'>";
                    sectb += "<td>" + filas[0] +"</td>";
                    sectb += "<td>" + filas[1] + "</td>";
                    sectb += "<td>" + filas[2] +"</td>";
                    sectb += "<td>" + filas[3] + "</td>";
                    sectb += "<td>" + filas[4] + "</td>";
                    sectb += "<td>" + filas[5] + "</td>";
                    sectb += "</tr>";

                }
                sectb += " </tbody>";
                sectb += " </table>";
                mibody += sectb+ "</body></html>";

                mMessage.Body = mibody;
                    mMessage.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient();
                    client.Port = 25;
                    client.Host = emserver;
                    client.Timeout = 5000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Credentials = new System.Net.NetworkCredential(emuser, userpass);
                   // client.EnableSsl = true;
                    client.Send(mMessage);
                    client.Dispose();
                    Retorna = "1";
                
            }

            catch (SmtpException ex)
            {
                Retorna = ex.Message;
                //throw ex;
            }
            return Retorna;

        }

        [WebMethod]
        public static string sendTea(string datos,string teamen)
        {

            string Retorna = string.Empty;

            var correo = ConfigurationManager.AppSettings["desdeCorreo"].ToString();
            string emserver = ConfigurationManager.AppSettings["servidorCorreo"].ToString();
            string emuser = ConfigurationManager.AppSettings["usuarioCorreo"].ToString();
            string userpass = ConfigurationManager.AppSettings["claveCorreo"].ToString();
                MailMessage mMessage = new MailMessage();
            mMessage.From = new MailAddress(correo);
          
            try
            {
                var data = datos.Split('^');
                for (int i = 0; i < data.Length - 1; i++)
                {
                    var filas = data[i].Split('|');
                    mMessage.To.Clear();
                    if (filas[filas.Length - 1].IndexOf('@') > -1) { 
                    mMessage.To.Add(filas[filas.Length-1]);
                    mMessage.Bcc.Add(correo);
                        mMessage.Subject = teamen.Split('|')[0];
                    }
                    else
                    {
                        mMessage.Bcc.Add(correo);
                        mMessage.Subject = "User Not Found!";
                    }

                    var mibody = "";
                    mibody += "<html><head></head><body>";
                    var content="";
                    for (int a = 0; a <filas.Length-1; a++)
                    {
                        content +=  filas[a] + "<br />";
                    }
                    mibody += teamen.Split('|')[1].ToString() + " <br /><br /> <h3>These students are in ASA</h3> <br />" + content.ToString();
                    mibody += "</body></html>";

                    
                    mMessage.Body = mibody;
                    mMessage.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient();
                    client.Port = 25;
                    client.Host = emserver;
                    client.Timeout = 5000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Credentials = new System.Net.NetworkCredential(emuser, userpass);
                    //client.EnableSsl = true;
                    
                    client.Send(mMessage);
                    client.Dispose();
                    Retorna = "1";
                }
            }

            catch (SmtpException ex)
            {
                Retorna = ex.Message;
                //throw ex;
            }
            return Retorna;

        }

        

        [WebMethod]
        public static string sendParents(string datos,string subj)
        {

            string Retorna = string.Empty;

            var correo = ConfigurationManager.AppSettings["desdeCorreo"].ToString();
            string emserver = ConfigurationManager.AppSettings["servidorCorreo"].ToString();
            string emuser = ConfigurationManager.AppSettings["usuarioCorreo"].ToString();
            string userpass = ConfigurationManager.AppSettings["claveCorreo"].ToString();
            MailMessage mMessage = new MailMessage();
            mMessage.From = new MailAddress(correo);

            try
            {
                var data = datos.Split('^');
                var conten = subj.Split('|');
                for (int i = 0; i < data.Length - 1; i++)
                {
                    var filas = data[i].Split('|');
                    for (int x = 0; x <filas.Length; x++)
                    {
                        if (filas[x].IndexOf('@') > -1)
                        {
                            mMessage.To.Add(filas[x]);
                            mMessage.Bcc.Add(correo);
                            mMessage.Subject = conten[0];
                        }
                        else
                        {
                            mMessage.Bcc.Add(correo);
                            mMessage.Subject = "User Not Found!";
                        }
                        
                    }

                    var mibody = "";
                    
                    mibody += "<html><head></head><body>";
                    mibody += conten[1].ToString().Replace("\n","<br />");
                    mibody += "</body></html>";


                    mMessage.Body = mibody;
                    mMessage.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient();
                    client.Port = 25;
                    client.Host = emserver;
                    client.Timeout = 5000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Credentials = new System.Net.NetworkCredential(emuser, userpass);
                    //client.EnableSsl = true;
                    client.Send(mMessage);
                    client.Dispose();
                    Retorna = "1";
                }
            }

            catch (SmtpException ex)
            {
                Retorna = ex.Message;
                //throw ex;
            }
            return Retorna;

        }


        [WebMethod]
        public static string wafiltra(string vals)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            var b = vals.Split('|');
            var sqlwh = "";

            if (b[0] != "0")
            {
                if (b[1] != "0" || b[2] != "--Select--" || b[3] != "0")
                {
                    sqlwh += " A.idSchedule=" + b[0] + " AND ";
                }
                else
                {
                    sqlwh += " A.idSchedule=" + b[0] + " ";
                }
            }
            if (b[1] != "0")
            {
                if (b[2] != "--Select--" || b[3] != "0")
                {
                    sqlwh += " A.Activityid=" + b[1] + " AND ";
                }
                else
                {
                    sqlwh += " A.Activityid=" + b[1] + " ";
                }

            }
            if (b[2] != "--Select--")
            {
                if (b[3] != "0")
                {
                    sqlwh += " S.cmsteacher='" + b[2] + "' AND ";
                }
                else
                {
                    sqlwh += " S.cmsteacher='" + b[2] + "' ";
                }

            }
            if (b[3] != "0")
            {
                sqlwh += " S.EmbBus=" + b[3] + " ";
            }


            if (sqlwh != "")
            {
                sqlwh = " WHERE S.stateid=1 AND " + sqlwh + " ORDER BY s.Name ASC";

            }


            sql = "SELECT s.Name, s.LastName,AC.Activity,SC.Day,SD.ShortDay,SC.TimeSc,s.cmsTeacher,MotherEmail,FatherEmail FROM StudentActivities A";
            sql += " LEFT JOIN Students S ON A.Studentid=S.Studentid";
            sql += " LEFT JOIN Activities AC ON A.Activityid=AC.idActivity";
            sql += " LEFT JOIN Schedules SC ON A.idSchedule=SC.idSchedule";
            sql += " LEFT JOIN SHORTDAY SD ON SC.IDSHORTDAY = SD.IDSHORTDAY";
            sql +=  sqlwh ;

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

                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';
                        retorna += dr["Activity"].ToString() + '|';
                        retorna += dr["Day"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["TimeSC"].ToString() + '|';
                        retorna += dr["cmsTeacher"].ToString() + '|';
                        retorna += dr["MotherEmail"].ToString() + '|';
                        retorna += dr["FatherEmail"].ToString() + '^';

                    }
                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }


        //end workarea block



        //checkin out block
        [WebMethod]
        public static string savechk(string chkvals, string idchk,string edi)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = chkvals.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                var ndat = "";
                if (edi.Split(',')[0] =="1") {
                    ndat = edi.Split(',')[1].Split('/')[1] + '/' + edi.Split(',')[1].Split('/')[0] + '/' + edi.Split(',')[1].Split('/')[2];
                } else { ndat = "GETDATE()";
                };
                if (idchk == "")
                {
                    if (edi.Split(',')[0] == "1")
                    {
                        sql = "INSERT INTO tCheckin (Studentid,chkGeneralIn,chkSup,chkTeac,chkGeneralOut,chkDate) SELECT " + valores[0] + "," + valores[1] + "," + valores[2] + "," + valores[3] + "," + valores[4] + ",'" + ndat + "'; SELECT @@IDENTITY AS A";
                    }
                    else {
                        sql = "INSERT INTO tCheckin (Studentid,chkGeneralIn,chkSup,chkTeac,chkGeneralOut,chkDate) SELECT " + valores[0] + "," + valores[1] + "," + valores[2] + "," + valores[3] + "," + valores[4] + "," + ndat + "; SELECT @@IDENTITY AS A";
                    }
                }
                else
                {
                    if (edi.Split(',')[0] == "1") { 
                        sql = "UPDATE tCheckin SET Studentid=" + valores[0] + ",chkGeneralIn=" + valores[1] + ",chkSup=" + valores[2] + ",chkTeac=" + valores[3] + ",chkGeneralOut=" + valores[4] + ",chkDate='"+ ndat+"' WHERE idCheckin=" + idchk + "";
                    }else
                    {
                        sql = "UPDATE tCheckin SET Studentid=" + valores[0] + ",chkGeneralIn=" + valores[1] + ",chkSup=" + valores[2] + ",chkTeac=" + valores[3] + ",chkGeneralOut=" + valores[4] + " WHERE idCheckin=" + idchk + "";
                    }
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = ex.Message;
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string chkAssist(string dat)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            try
            {
           
                sql = "SELECT chkGeneralIn, chkSup,chkTeac,chkGeneralOut,chkDate,idCheckin,Studentid FROM tCheckin";
                sql += " WHERE CONVERT(varchar(10),chkDate,103)='" + dat + "'"; // DateTime.Now.ToString("dd/MM/yyyy") + "'";

                SqlConnection conn = new SqlConnection(conexion);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = Cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        retorna += dr["Studentid"].ToString() + '|';
                        retorna += dr["idCheckin"].ToString() + '|';
                        retorna += dr["chkGeneralIn"].ToString() + '|';
                        retorna += dr["chkSup"].ToString() + '|';
                        retorna += dr["chkTeac"].ToString() + '|';
                        retorna += dr["chkGeneralOut"].ToString() + '|';
                        retorna += dr["chkDate"].ToString() + '^';

                    }
                }
                conn.Close();
                Cmd.Dispose();
                dr.Close();

            }
            catch (Exception ex)
            {
                retorna = ex.Message;
                //throw ex;
            }
            return retorna;
        }

        
        [WebMethod]
        public static string getactid(int idstu, string dati)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

                sql = "SELECT chkGeneralIn, chkSup,chkTeac,chkGeneralOut,chkDate,idCheckin,Studentid FROM tCheckin";
                sql += " WHERE CONVERT(varchar(10),chkDate,103)='" + dati + "' AND Studentid=" + idstu+"";
            try
            {
                
            SqlConnection conn = new SqlConnection(conexion);
            if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

            
            SqlCommand Cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = Cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        retorna = dr["idCheckin"].ToString();
                    }
                }
                conn.Close();
                Cmd.Dispose();
                dr.Close();

            }
            catch (Exception ex)
            {
                // retorna = ex.Message;
                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string filtra(string vals)
        {
            string retorna = string.Empty;
            string retorna2 = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            var b = vals.Split('|');
            var sqlwh = "";

            if (b[0] != "0")
            {
                if (b[4] != "" || b[5] != "" || b[2] != "0" || b[1] != "0" || b[3] != "0" || b[6] != "0") {
                    sqlwh += " A.teacherid=" + b[0] + " AND ";
                } else {
                    sqlwh += " A.teacherid=" + b[0] + " ";
                }
            }
            if (b[1] != "0")
            {
                if (b[4] != "" || b[5] != "" || b[2] != "0" || b[3] != "0" || b[6] != "0")
                {
                    sqlwh += " C.idSchedule=" + b[1] + " AND ";
                } else
                {
                    sqlwh += " C.idSchedule=" + b[1] + " ";
                }
            }
            if (b[2] != "0")
            {
                if (b[4] != "" || b[5] != "" || b[3] != "0" || b[6] != "0")
                {
                    sqlwh += " S.Activityid=" + b[2] + " AND ";
                }
                else
                {
                    sqlwh += " S.Activityid=" + b[2] + " ";
                }

            }
            if (b[3] != "0")
            {
                if (b[4] != "" || b[5] != "" || b[6] != "0") {
                    sqlwh += " T.EmbBus=" + b[3] + " AND ";
                } else {
                    sqlwh += " T.EmbBus=" + b[3] + " ";
                }

            }
            if (b[4] != "")
            {
                if (b[4] != "" || b[5] != "" || b[6] != "0") {
                    sqlwh += " T.Name like '%" + b[4] + "%' AND ";
                } else {
                    sqlwh += " T.Name like '%" + b[4] + "%' ";
                }
            }
            if (b[5] != "")
            {
                if (b[5] != "" || b[6] != "0")
                {
                    sqlwh += " T.LastName like '%" + b[5] + "%' AND ";
                }
                else
                {
                    sqlwh += " T.LastName like '%" + b[5] + "%' ";
                }
            }

                if (b[6] != "0")
                {
                    sqlwh += " SD.idShortDay=" + b[6] + " ";
                }

                if (sqlwh != "")
            {
                sqlwh = " WHERE T.stateid=1 AND " + sqlwh + " ORDER BY T.Name ASC";

            }

            sql = "SELECT T.Photo, S.Studentid,S.StActivityid,T.Name, T.LastName,A.Activity,C.Day, SD.ShortDay,C.TimeSC FROM StudentActivities S";
            sql += " LEFT JOIN Students T ON S.Studentid = T.Studentid";
            sql += " LEFT JOIN Activities A ON S.Activityid = A.idActivity";
            sql += " LEFT JOIN Schedules C ON S.idSchedule = C.idSchedule";
            sql += " LEFT JOIN SHORTDAY SD ON C.IDSHORTDAY = SD.IDSHORTDAY";
            sql +=  sqlwh; 

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
                     
                        retorna += dr["Studentid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';
                        retorna += dr["Activity"].ToString() + '|';
                        retorna += dr["Day"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["TimeSC"].ToString() + '|';
                        retorna += dr["Photo"].ToString() + '|';
                        retorna += dr["StActivityid"].ToString() + '^';
                        

                    }

                }
                Cmd.Dispose();
                dr.Close();
                
                sql = "SELECT chkGeneralIn, chkSup,chkTeac,chkGeneralOut,chkDate,idCheckin,Studentid FROM tCheckin";
                sql += " WHERE CONVERT(varchar(10),chkDate,103)='" + DateTime.Now.ToString("dd/MM/yyyy") + "'";

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
               
                    SqlCommand Cmd1 = new SqlCommand(sql, conn);
                    SqlDataReader dr1 = Cmd1.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        while (dr1.Read())
                        {
                        retorna2 += dr1["Studentid"].ToString() + '|';
                        retorna2 += dr1["idCheckin"].ToString() + '|';
                        retorna2 += dr1["chkGeneralIn"].ToString() + '|';
                        retorna2 += dr1["chkSup"].ToString() + '|';
                        retorna2 += dr1["chkTeac"].ToString() + '|';
                        retorna2 += dr1["chkGeneralOut"].ToString() + '|';
                        retorna2 += dr1["chkDate"].ToString() + '^';
                        
                    }
                    }
                    conn.Close();
                    Cmd1.Dispose();
                    dr1.Close();

                }
            catch (Exception ex)
            {
                retorna = ex.Message;
                //throw ex;
            }
            return retorna+'&'+retorna2;
        }


        
        [WebMethod]
        public static string getObserv(int idob)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT id,Notes FROM Observations ";
            sql += "  WHERE id="+ idob +"";

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
                        retorna += dr["Notes"].ToString() + '|';
                        retorna += dr["id"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string ObserT()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT id,Notes,nDate,idUser,U.Name FROM Observations O ";
            sql += "  LEFT JOIN Users U ON O.idUser=U.Userid ORDER BY nDate";

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
                        retorna += dr["Notes"].ToString() + '|';
                        retorna += dr["nDate"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["id"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string stNote(int stnotid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Noteid,Note,NoteDate FROM Notes ";
            sql += " WHERE Studentid="+stnotid+"";

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
                        retorna += dr["Noteid"].ToString() + '|';
                        retorna += dr["Note"].ToString() + '|';
                        retorna += dr["NoteDate"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        
        [WebMethod]
        public static string savObser(string stid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = stid.Split('|');
            var userid = HttpContext.Current.Session["SesData"].ToString().Split('|')[0];
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (valores[0] == "")
                {
                    sql = "INSERT INTO Observations (Notes,nDate,idUser) SELECT '" + valores[1] + "',GETDATE()," + userid + "; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE Observations SET Notes='" + valores[1] + "',nDate=GETDATE(),idUser=" + userid + " WHERE id=" + valores[0] + "";
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string svaNotes(string stid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = stid.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                sql = "INSERT INTO Notes (studentid,Note,Notedate) SELECT " + valores[0] + ",'" + valores[1] + "',GETDATE(); SELECT @@IDENTITY AS A";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        //checkin out block

        //start Rolls Block
        [WebMethod]
        public static string saveUs(string usVal, int modif)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = usVal.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (modif == 0)
                {
                    sql = "INSERT INTO Users (Name,Cell,UserName,Pass,Rollid) SELECT '" + valores[0] + "','" + valores[1] + "','" + valores[2] + "','" + valores[3] + "'," + valores[4] + "; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE Users SET Name='" + valores[0] + "',Cell='" + valores[1] + "',UserName='" + valores[2] + "',Pass='" + valores[3] + "',Rollid=" + valores[4] + " WHERE Userid=" + valores[5] + "";
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string usTable()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Userid,Name,Cell,UserName,R.Roll FROM Users U";
            sql += " LEFT JOIN Rolls R ON U.Rollid = R.Rollid";

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
                        retorna += dr["Cell"].ToString() + '|';
                        retorna += dr["UserName"].ToString() + '|';
                        retorna += dr["Roll"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string getUs(int usid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Userid,Name,Cell,UserName,Pass,Rollid FROM Users WHERE Userid=" + usid + "";


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
                        retorna += dr["Cell"].ToString() + '|';
                        retorna += dr["UserName"].ToString() + '|';
                        retorna += dr["Pass"].ToString() + '|';
                        retorna += dr["Rollid"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string DelUs(int usid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                sql = "DELETE  Users WHERE Userid=" + usid + "";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }
        //end Users Block


        //Start Student activities block
        [WebMethod]
        public static string getStacti(int stscid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Studentid,Name,LastName FROM Students WHERE Studentid=" + stscid + "";


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
                        retorna += dr["Studentid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';

                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string savestact(string stactVal,int modi)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = stactVal.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (modi == 0)
                {
                    sql = "INSERT INTO StudentActivities (studentid,activityid,idschedule) SELECT " + valores[0] + "," + valores[1] + "," + valores[2] + "; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE StudentActivities SET studentid=" + valores[0] + ",activityid=" + valores[1] + ",idschedule=" + valores[2] + " WHERE StActivityid=" + valores[3] + "";
                }


                

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string getStsch(int stacid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT StActivityid, Activityid,idSchedule FROM StudentActivities ";
            sql += " WHERE StActivityid=" + stacid + "";

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
                        retorna += dr["StActivityid"].ToString() + '|';
                        retorna += dr["Activityid"].ToString() + '|';
                        retorna += dr["idSchedule"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string stactTable(int stactid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT S.StActivityid,T.Name,T.LastName,A.Activity,C.Day,SD.ShortDay,C.TimeSC FROM StudentActivities S";
            sql += " LEFT JOIN Students T ON S.Studentid = T.Studentid";
            sql += " LEFT JOIN Activities A ON S.Activityid = A.idActivity";
            sql += " LEFT JOIN Schedules C ON S.idSchedule = C.idSchedule";
            sql += " LEFT JOIN shortday SD ON C.idshortday=SD.idshortday";
            sql += " WHERE S.Studentid=" + stactid + "";

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
                        retorna += dr["StActivityid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';
                        retorna += dr["Activity"].ToString() + '|';
                        retorna += dr["Day"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["TimeSC"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

       
        [WebMethod]
        public static string Delstact(int stactid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                sql = "DELETE  StudentActivities WHERE StActivityid=" + stactid + "";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        //end student activities block

        //start Student Block
        [WebMethod]
        public static string saveSt(string stVal, int modif)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = stVal.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (modif == 0)
                {
                    sql = "INSERT INTO Students (Name,LastName,Age,idGrade,idFrom,ProcPlace,cmsTeacher,Photo,Mother,MotherCell,MotherEmail,Father,FatherCell,FatherEmail,Stateid,Allergies,AuthMedics,EmergencyContact,EmbBus) SELECT '" + valores[0] + "','" + valores[1] + "','" + valores[2] + "'," + valores[3] + "," + valores[4] + ",'" + valores[5] + "','" + valores[6] + "','" + valores[7] + "','" + valores[8] + "','" + valores[9] + "','" + valores[10] + "','" + valores[11] + "','" + valores[12] + "','" + valores[13] + "'," + valores[14] + ",'" + valores[15] + "','" + valores[16] + "','" + valores[17] + "'," + valores[18] + "; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE Students SET Name='" + valores[0] + "',LastName='" + valores[1] + "',Age='" + valores[2] + "',idGrade=" + valores[3] + ",idFrom=" + valores[4] + ",ProcPlace='" + valores[5] + "',cmsTeacher='" + valores[6] + "',Photo='" + valores[7] + "',Mother='" + valores[8] + "',MotherCell='" + valores[9] + "',MotherEmail='" + valores[10] + "',Father='" + valores[11] + "',FatherCell='" + valores[12] + "',FatherEmail='" + valores[13] + "',Stateid=" + valores[14] + ",Allergies='" + valores[15] + "',AuthMedics='" + valores[16] + "',EmergencyContact='" + valores[17] + "',EmbBus=" + valores[18] + " WHERE Studentid=" + valores[19] + "";
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();
                Retorna = "1";
            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string stTable()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Studentid, Name,LastName,G.Grade,F.stFrom,T.State FROM Students S";
            sql += " LEFT JOIN stFroms F ON S.idFrom = F.idFrom";
            sql += " LEFT JOIN Grades G ON S.idGrade = G.idGrade";
            sql += " LEFT JOIN States T ON S.Stateid = T.Stateid ORDER BY NAME ASC";

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
                        retorna += dr["Studentid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';
                        retorna += dr["Grade"].ToString() + '|';
                        retorna += dr["stFrom"].ToString() + '|';
                        retorna += dr["State"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string stsrcTable(string stname)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Studentid, Name,LastName,G.Grade,F.stFrom,T.State FROM Students S";
            sql += " LEFT JOIN stFroms F ON S.idFrom = F.idFrom";
            sql += " LEFT JOIN Grades G ON S.idGrade = G.idGrade";
            sql += " LEFT JOIN States T ON S.Stateid = T.Stateid";
            sql += " WHERE Name like '%"+stname+"%'";

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
                        retorna += dr["Studentid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';
                        retorna += dr["Grade"].ToString() + '|';
                        retorna += dr["stFrom"].ToString() + '|';
                        retorna += dr["State"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string getSt(int stid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Studentid,Name,LastName,Age,idGrade,idFrom,ProcPlace,cmsTeacher,Photo,Mother,MotherCell,MotherEmail,Father,FatherCell,FatherEmail,Stateid,Allergies,AuthMedics,EmergencyContact,EmbBus FROM Students WHERE Studentid=" + stid + "";


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
                        retorna += dr["Studentid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["LastName"].ToString() + '|';
                        retorna += dr["Age"].ToString() + '|';
                        retorna += dr["idGrade"].ToString() + '|';
                        retorna += dr["idFrom"].ToString() + '|';
                        retorna += dr["ProcPlace"].ToString() + '|';
                        retorna += dr["cmsTeacher"].ToString() + '|';
                        retorna += dr["Photo"].ToString() + '|';
                        retorna += dr["Mother"].ToString() + '|';
                        retorna += dr["MotherCell"].ToString() + '|';
                        retorna += dr["MotherEmail"].ToString() + '|';
                        retorna += dr["Father"].ToString() + '|';
                        retorna += dr["FatherCell"].ToString() + '|';
                        retorna += dr["FatherEmail"].ToString() + '|';
                        retorna += dr["Stateid"].ToString() + '|';
                        retorna += dr["Allergies"].ToString() + '|';
                        retorna += dr["AuthMedics"].ToString() + '|';
                        retorna += dr["EmergencyContact"].ToString() + '|';
                        retorna += dr["EmbBus"].ToString() + '|';
                        
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        //[WebMethod]
        //public static string Delst(int stid)
        //{
        //    string Retorna = string.Empty;
        //    string sql = string.Empty;
        //    string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
        //    SqlConnection conn = new SqlConnection(conexion);
        //    try
        //    {

        //        if (conn.State == ConnectionState.Closed)
        //        {
        //            conn.Open();
        //        }

        //        sql = "DELETE  Students WHERE Studentid=" + stid + "";

        //        SqlCommand Cmd = new SqlCommand(sql, conn);
        //        Cmd.CommandType = CommandType.Text;
        //        Cmd.ExecuteScalar();

        //        conn.Close();
        //        Cmd.Dispose();

        //    }
        //    catch (Exception ex)
        //    {
        //        Retorna = "-1";
        //        //throw ex;
        //    }

        //    return Retorna;

        //}

        //end Student Block

        //start Grade Block
        [WebMethod]
        public static string saveGra(string graVal, int modif)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = graVal.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (modif == 0)
                {
                    sql = "INSERT INTO Grades (Grade) SELECT '" + valores[0] + "'; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE Grades SET Grade='" + valores[0] + "' WHERE idGrade=" + valores[1] + "";
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string graTable()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idGrade, Grade FROM Grades";

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
                        retorna += dr["idGrade"].ToString() + '|';
                        retorna += dr["Grade"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string getGra(int graid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idGrade,Grade FROM Grades WHERE idGrade=" + graid + "";


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
                        retorna += dr["idGrade"].ToString() + '|';
                        retorna += dr["Grade"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string Delgra(int graid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                sql = "DELETE  Grades WHERE idGrade=" + graid + "";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }
        //end Grade Block

        //start Activity Block
        [WebMethod]
        public static string saveAct(string actVal, int modif)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = actVal.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (modif == 0)
                {
                    sql = "INSERT INTO Activities (idCategory,Activity,Grade,Price,Teacherid) SELECT " + valores[0] + ",'" + valores[1] + "','" + valores[2] + "'," + valores[3] + "," + valores[4] + "; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE Activities SET IdCategory=" + valores[0] + ",Activity='" + valores[1] + "',Grade='" + valores[2] + "',Price=" + valores[3] + ",Teacherid=" + valores[4] + " WHERE idActivity=" + valores[5] + "";
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string actTable()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT A.idActivity,A.Grade,A.Price, A.Activity,T.Name FROM Activities A";
            sql += " LEFT JOIN Teachers T ON A.Teacherid = T.Teacherid";
            //sql += " LEFT JOIN Schedules S ON A.Scheduleid = S.idSchedule";

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
                        retorna += dr["idActivity"].ToString() + '|';
                        retorna += dr["Activity"].ToString() + '|';
                        retorna += dr["Grade"].ToString() + '|';
                        retorna += dr["Price"].ToString() + '|';
                        //retorna += dr["TimeSc"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string getAct(int actid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idActivity,IdCategory,Activity,Grade,Price,Teacherid FROM Activities WHERE idActivity=" + actid + "";


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
                        
                        retorna += dr["IdCategory"].ToString() + '|';
                        retorna += dr["idActivity"].ToString() + '|';
                        retorna += dr["Activity"].ToString() + '|';
                        retorna += dr["Grade"].ToString() + '|';
                        retorna += dr["Price"].ToString() + '|';
                        retorna += dr["Teacherid"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string DelAct(int actid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                sql = "DELETE  Activities WHERE idActivity=" + actid + "";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }
        //end Activity Block


        //start Teacher Block
        [WebMethod]
        public static string saveTea(string teaVal, int modif)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = teaVal.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (modif == 0)
                {
                    sql = "INSERT INTO Teachers (Name,Contact,Mail) SELECT '" + valores[0] + "','" + valores[1] + "','" + valores[2] + "'; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE Teachers SET Name='" + valores[0] + "',Contact='" + valores[1] + "',Mail='" + valores[2] + "' WHERE Teacherid=" + valores[3] + "";
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string teaTable()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Teacherid,Name,Contact,Mail FROM Teachers";


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
                        retorna += dr["Teacherid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["Contact"].ToString() + '|';
                        retorna += dr["Mail"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string getTea(int teaid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT Teacherid,Name,Contact,Mail FROM Teachers WHERE Teacherid=" + teaid + "";


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
                        retorna += dr["Teacherid"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '|';
                        retorna += dr["Contact"].ToString() + '|';
                        retorna += dr["Mail"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string DelTea(int teaid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                sql = "DELETE  Teachers WHERE Teacherid=" + teaid + "";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }
        //end Teacher Block


        //start Schedule Block
        [WebMethod]
        public static string saveactSch(string schVal, int modif)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = schVal.Split('|');
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                if (modif == 0)
                {
                    sql = "INSERT INTO actSchedule (idActivity,idSchedule,Teacherid) SELECT " + valores[0] + "," + valores[1] + "," + valores[2] + "; SELECT @@IDENTITY AS A";
                }
                else
                {
                    sql = "UPDATE actSchedule SET idActivity=" + valores[0] + ",idSchedule=" + valores[1] + ",Teacherid=" + valores[2] + " WHERE ID=" + valores[3] + "";
                }

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string saveSch(string schVal,int modif)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            var valores = schVal.Split('|');
            try
            {
                
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }

                    if (modif == 0)
                   {
                        sql = "INSERT INTO Schedules (Day,idShortDay,TimeSc) SELECT '" + valores[0] + "'," + valores[1] + ",'" + valores[2] + "'; SELECT @@IDENTITY AS A";
                   }
                   else
                   {
                    sql = "UPDATE Schedules SET Day='" + valores[0] + "',idShortDay=" + valores[1] + ",TimeSc='" + valores[2] + "' WHERE idSchedule=" + valores[3] + "";
                   }
                
                    SqlCommand Cmd = new SqlCommand(sql, conn);
                    Cmd.CommandType = CommandType.Text;
                    Cmd.ExecuteScalar();

                    conn.Close();
                    Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string actschTable()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT A.ID,AC.Activity,SC.ShortDay,SC.TimeSc,T.Name FROM actSchedule A";
            sql += " LEFT JOIN Activities AC ON A.IDACTIVITY = AC.idActivity";
            sql += " LEFT JOIN Schedules SC ON A.IDSCHEDULE = SC.idSchedule";
            sql += " LEFT JOIN Teachers T ON A.teacherid = T.Teacherid";



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
                        retorna += dr["ID"].ToString() + '|';
                        retorna += dr["Activity"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["Timesc"].ToString() + '|';
                        retorna += dr["Name"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string schTable()
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idSchedule,Day, SD.ShortDay,TimeSc,SC.idshortday FROM Schedules SC";
            sql += " LEFT JOIN SHORTDAY SD ON SC.IDSHORTDAY = SD.IDSHORTDAY";


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
                        retorna += dr["idSchedule"].ToString() + '|';
                        retorna += dr["Day"].ToString() + '|';
                        retorna += dr["ShortDay"].ToString() + '|';
                        retorna += dr["Timesc"].ToString() + '^';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string getatsch(int schid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT ID,idActivity,idSchedule,Teacherid FROM actSchedule WHERE ID=" + schid + "";


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
                        retorna += dr["ID"].ToString() + '|';
                        retorna += dr["idActivity"].ToString() + '|';
                        retorna += dr["idSchedule"].ToString() + '|';
                        retorna += dr["Teacherid"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string getsch(int schid)
        {
            string retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;

            sql = "SELECT idSchedule,Day, SD.ShortDay,TimeSc,SC.idshortday FROM Schedules SC";
            sql += " LEFT JOIN SHORTDAY SD ON SC.IDSHORTDAY = SD.IDSHORTDAY";
            sql += " WHERE idSchedule=" + schid + ""; 

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
                        retorna += dr["idSchedule"].ToString() + '|';
                        retorna += dr["Day"].ToString() + '|';
                        retorna += dr["idShortDay"].ToString() + '|';
                        retorna += dr["Timesc"].ToString() + '|';
                    }

                }
                conn.Close();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            return retorna;
        }

        [WebMethod]
        public static string Delactsch(int schid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                sql = "DELETE  actSchedule WHERE id=" + schid + "";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }

        [WebMethod]
        public static string Delsch(int schid)
        {
            string Retorna = string.Empty;
            string sql = string.Empty;
            string conexion = WebConfigurationManager.ConnectionStrings["ChkConn"].ConnectionString;
            SqlConnection conn = new SqlConnection(conexion);
            try
            {

                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                    sql = "DELETE  Schedules WHERE idSchedule="+schid+"";

                SqlCommand Cmd = new SqlCommand(sql, conn);
                Cmd.CommandType = CommandType.Text;
                Cmd.ExecuteScalar();

                conn.Close();
                Cmd.Dispose();

            }
            catch (Exception ex)
            {
                Retorna = "-1";
                //throw ex;
            }

            return Retorna;

        }
        //end Schedule Block
    }
}