using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ChampaquiAdventure_V3
{
    public partial class ModificarPrograma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GestionDB A = new GestionDB();
                string ID_Programa = Request.QueryString["ID_Programa"];

                DataTable T = A.BuscarDatosPrograma(ID_Programa);
                Txt_Nombre.Text = T.Rows[0]["Nombre"].ToString();
                Txt_Desc.Text = T.Rows[0]["Descripcion"].ToString();
                Txt_CupMin.Text = T.Rows[0]["Cupo_Min"].ToString();
                Txt_CupMax.Text = T.Rows[0]["Cupo_Max"].ToString();
                Txt_Precio.Text = T.Rows[0]["PrecioDelPrograma"].ToString();
                string[] IDs = A.ObtenerIDsPrefXProgr(ID_Programa);
                MarcarCxBxSeleccionado(IDs);
            }
        }

        private void MarcarCxBxSeleccionado( string [] IDs)
        {
            if (IDs != null)
            {
                CheckBoxList1.DataBind();
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    item.Selected = IDs.Contains(item.Value);
                }
            }
        }
        
        protected void Bt_Guardar_Click(object sender, EventArgs e)
        {
            GestionDB A = new GestionDB();
            string ID_Programa = Request.QueryString["ID_Programa"];

            bool ok = A.ModificarPrograma(ID_Programa, Txt_Nombre.Text, Txt_Desc.Text, Convert.ToInt16(Txt_CupMin.Text), Convert.ToInt16(Txt_CupMax.Text), Txt_Precio.Text);

            if (ok)
            {
                A.EliminarRegistroDePreferencias(ID_Programa);
                foreach (ListItem Item in CheckBoxList1.Items)
                {
                    if (Item.Selected)
                    {
                        
                        string ID_Preferencia = Item.Value;

                        A.CargarProgXPref(Convert.ToInt16(ID_Programa), Convert.ToInt16(ID_Preferencia));
                    }
                }
                Label_Msg.Text = "Se han guardado los cambios";
            }
            else
            {
                Label_Msg.Text = "Error al modificar el programa";
            }
        }
    }
}