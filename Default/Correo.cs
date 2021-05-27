using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;


namespace ChampaquiAdventure_v3.Default
{
    public class Correo
    {
         MailMessage  Correos= new MailMessage();
      SmtpClient Envios = new SmtpClient();

      public void EnviarCorreo(string Remitente, string Contraseña, string Mensaje, string Asunto, string Destinatario)
      {
          try
          {
            Correos.To.Clear();
            Correos.Body = "";
            Correos.Subject = "";
            Correos.Body = Mensaje;
            Correos.Subject = Asunto;
            Correos.IsBodyHtml = true;
            Correos.To.Add(Destinatario.Trim());
            
            Correos.From = new MailAddress(Remitente);
            Envios.Credentials = new NetworkCredential(Remitente, Contraseña);

            //Datos importantes no modificables para tener acceso a las cuentas

            Envios.Host = "smtp.gmail.com";
            Envios.Port = 587;
            Envios.EnableSsl = true;

            Envios.Send(Correos);
          }
          catch(Exception)
          {
          }
      }
    }
}