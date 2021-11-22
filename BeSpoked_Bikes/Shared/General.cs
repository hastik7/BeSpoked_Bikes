using System;
using System.Web.UI;
using System.IO;
using System.Text;

namespace BeSpoked_Bikes
{
    public class General : Page
    {
        public void LogError(Exception ex)
        {
            StringBuilder sbMsg = new StringBuilder();
            sbMsg.Append(string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss")));

            sbMsg.Append(Environment.NewLine);
            sbMsg.Append(string.Format("Message: {0}", ex.Message));
            sbMsg.Append(Environment.NewLine);

            string strName = String.Concat(Request.ApplicationPath, @"/ErrorLog/ErrorLog.txt"); ;
            string strPath = Server.MapPath(strName);
            
            if (!File.Exists(strPath))
            {
                File.Create(strPath).Dispose();
            }
            using (StreamWriter writer = File.AppendText(strPath))
            {
                writer.WriteLine(sbMsg);
                writer.Close();
            }
        }

       
    }
}