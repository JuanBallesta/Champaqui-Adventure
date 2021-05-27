using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ChampaquiAdventure_v3.Default
{
    public partial class e_Mails_promocion1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Email_Bt.Visible = false;
            Loader.Visible = false;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Prog_Sal.Visible = false;
            Email_Bt.Visible = true;
            GestionDB A = new GestionDB();

            string ID_Salida = Convert.ToString(GridView1.SelectedValue);

            A.TempEnvioMails(DropDownList1.SelectedValue, ID_Salida);
            DataTable Cant_Mails_mandar = A.Cant_Mails_x_Mandar();
            int Cant_Mails_xx_Mandar = Cant_Mails_mandar.Rows.Count;
            Label1.Text = "<h4>SE ENVIARAN " + Cant_Mails_xx_Mandar + " E-MAILS</h4>";
        }

        protected void Bt_Enviar_Click(object sender, EventArgs e)
        {
            Timer1.Enabled = true;
            Prog_Sal.Visible = false;
            Email_Bt.Visible = false;
            Loader.Visible = true;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Loader.Visible = true;
            Timer1.Enabled = false;
            try
            {
                GestionDB db = new GestionDB();
                DataTable ttt = db.BuscarProxClienteTT();



                string ID_TempEnvioMails = ttt.Rows[0]["ID_TempEnvioMails"].ToString();
                string ID_Cliente = ttt.Rows[0]["ID_Cliente"].ToString();
                string ID_Salida = ttt.Rows[0]["ID_Salida"].ToString();

                // buscar datos cliente

                DataTable tc = db.BuscarDatosCliente(ID_Cliente);

                string Nombre = tc.Rows[0]["Nombre"].ToString();
                string Apellido = tc.Rows[0]["Apellido"].ToString();
                string Email = tc.Rows[0]["Email"].ToString();


                // buscar datos salida

                DataTable ts = db.BuscarDatos_Salida(ID_Salida);

                string ID_Programa = ts.Rows[0]["ID_Programa"].ToString();
                string Nombre_Programa = ts.Rows[0]["Nombre"].ToString();
                string Fecha = ts.Rows[0]["Fecha"].ToString();
                DateTime Fecha_fin = Convert.ToDateTime(Fecha);

                // armar email

                

                // enviar

                Correo c = new Correo();
                DataTable email_login = db.emails(DPL_Emails.SelectedValue);
                string email_name = email_login.Rows[0]["Email"].ToString();
                string pass_name = email_login.Rows[0]["Password"].ToString();

                c.EnviarCorreo(email_name, pass_name, "Hola " + Nombre + ", le informamos que el dia " + Fecha_fin.ToString("dd MMMM, yyyy") + " se realizara una salida a " + Nombre_Programa + ".", "Promoción de una nueva salida a " + Nombre_Programa + ".", Email);

                // borrar registro 

                db.BorrarRegistro(ID_TempEnvioMails);

                DataTable Cant_Mails_mandar = db.Cant_Mails_x_Mandar();
                int Cant_Mails_xx_Mandar = Cant_Mails_mandar.Rows.Count;

                Label1.Text = "<h4>SE HA ENVIADO UN EMAIL A " + Nombre.ToUpper() + " " + Apellido.ToUpper() + " AL EMAIL " + Email.ToUpper() + " Y QUEDAN " + Cant_Mails_xx_Mandar + " MAILS POR MANDAR</h4>";
                Timer1.Enabled = true;
            }
            catch
            {
                Label1.Text = "<h4>OPERACION TERMINADA</h4>";
                Timer1.Enabled = false;
                Loader.Visible = false;
            }
        }
    }
}