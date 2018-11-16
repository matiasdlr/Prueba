<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;
using System.IO;

public class UploadHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection selectedFiles = context.Request.Files;
            var nombrearhivo = "";
            for (int i = 0; i < selectedFiles.Count; i++)
            {
                //System.Threading.Thread.Sleep(500);
                HttpPostedFile PostedFile = selectedFiles[i];
                var nombre = Path.GetFileName(PostedFile.FileName);
                var ext = Path.GetExtension(PostedFile.FileName);
                var nom = nombre.Split('.')[0];
                nombrearhivo += nom+ DateTime.Now.Second.ToString()+DateTime.Now.Millisecond.ToString()+ext;
                var nombrearhivo1 = nom+ DateTime.Now.Second.ToString()+DateTime.Now.Millisecond.ToString()+ ext;
                string FileName = context.Server.MapPath("~/ImgFolder/" + nombrearhivo1);
                PostedFile.SaveAs(FileName);
            }

            context.Response.ContentType = "text/plain";
            context.Response.Write(nombrearhivo);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}