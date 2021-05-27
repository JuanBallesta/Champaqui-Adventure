using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChampaquiAdventure_v3.Default
{
    public partial class C_gestion_cobros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cliente.Visible = false;
            Salida.Visible = false;
            Resto.Visible = false;
        }
        

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string c = GridView2.SelectedValue.ToString();

            GestionDB nuevo = new GestionDB();
            string PS = nuevo.obtenerPrecioSalida(c).ToString();
            string TS = nuevo.obtenerPrecioTotalSalida(c).ToString();
            string TE = nuevo.obtenerPrecioExtra(c).ToString();
            string TP = nuevo.obtenerPagoTotal(c).ToString();

            int OPS = Convert.ToInt16(TS) - Convert.ToInt16(TP);

            Label_txt.Text = TS;
            Label5_txt.Text = PS;
            Label2_txt.Text = TE;
            Label3_txt.Text = TP;
            Label4_txt.Text = OPS.ToString();

            Resto.Visible = true;
            Cliente.Visible = true;
            Salida.Visible = true;
        }

        
        protected void Button_Buscar_Click(object sender, EventArgs e)
        {
            string SQL = "SELECT Salidas.ID_Salida, Salidas.Fecha, Salidas.Cant_Confirmados, Salidas.PrecioDeSalida, Programas.Nombre FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa WHERE( Fecha LIKE '%" + txt_Fecha.Text + "%')OR( Programas.Nombre LIKE '%" + txt_Fecha.Text + "%')";
            SqlDataSource1.SelectCommand = SQL;
            SqlDataSource1.DataBind();
            Salida.Visible = true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Cliente.Visible = true;
            Salida.Visible = true;
        }
         
    }
}