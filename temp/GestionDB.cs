using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ChampaquiAdventure_V3
{
    public class GestionDB
    {
        //Cadena de conección
        private string CadenaConexion = ConfigurationManager.ConnectionStrings["ChampaquiAdventureConnectionString1"].ConnectionString;
        //Llamada que genera una consulta
        private bool AdminRegistros(string SQL)
        {
            bool exito = true;

            try
            {
                SqlCommand sqlcom = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
                sqlcom.Connection.Open();
                sqlcom.ExecuteNonQuery();
                sqlcom.Connection.Close();
            }
            catch
            {
                exito = false;
            }
            return exito;
        }
        //Obtener tabla interna
        private DataTable ObtenerTabla(string SQL)
        {
            DataTable tabla = null;

            SqlDataAdapter adaptador = new SqlDataAdapter(SQL, CadenaConexion);
            DataSet ds = new DataSet();
            try
            {
                adaptador.Fill(ds);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        tabla = ds.Tables[0];
                    }
                }
            }
            catch
            {
            }
            return tabla;
        }
        public bool BorrarRegistro(string ID)
        {
            string SQL = "Delete from TempEnvioMails where ID_TempEnvioMails = " + ID;

            return AdminRegistros(SQL);
        }
        //*******************************************Altas************************************************
        public bool AltaDeClientes(string Nombre, string Apellido, int Tipo_Documento, string Numero_Documento, string Fecha_Nacimiento, int Genero, string Domicilio, int Localidad, int Provincia, string Pais, string Email, string Telefono, int Origen_Consulta, string Ficha_Medica)
        {
            string SQL = @"Insert into Cliente(Nombre, Apellido, Tipo_Documento, Numero_Documento, Fecha_Nacimiento, Genero, Domicilio, Localidad, Provincia, Pais, Email, Telefono, Origen_Consulta, Ficha_medica) Values ('"
            + Nombre + "','" + Apellido + "'," + Tipo_Documento + ",'" + Numero_Documento + "','" + Fecha_Nacimiento + "'," + Genero + ",'" + Domicilio + "'," + Localidad + "," + Provincia + ",'" + Pais + "','"
            + Email + "','" + Telefono + "'," + Origen_Consulta + ",'" + Ficha_Medica + "')";

            return AdminRegistros(SQL);
        }
        public bool AltaDeGuias(string Nombre, string Apellido, int Tipo_Documento, string Numero_Documento, int Genero, string Telefono, string Email)
        {
            string SQL = "Insert into Guias(Nombre, Apellido, Tipo_Documento, Numero_Documento, Genero, Telefono, Email) VALUES ('"
                 + Nombre + "','" + Apellido + "'," + Tipo_Documento + ",'" + Numero_Documento + "'," + Genero + ",'" + Telefono + "','" + Email + "')";

            return AdminRegistros(SQL);
        }
        public bool AltaDeExtras(string Nombre, string Descripcion, float Monto)
        {
            string SQL = "Insert into Extras(Nombre,Descripcion,Monto) Values ('" + Nombre + "','" + Descripcion + "'," + Monto + ")"; 

            return AdminRegistros(SQL);
        }
        public bool AltaDeOrigen(string OrigenDeConsulta)
        {
            string SQL = "Insert into Origen(OrigenDeConsulta) Values ('" + OrigenDeConsulta + "')";

            return AdminRegistros(SQL);
        }
        public bool AltaDePreferencias(string Nombre)
        {
            string SQL = "Insert into Preferencias(Nombre) Values ('" + Nombre + "')";

            return AdminRegistros(SQL);
        }
        public bool AltaDeProgramas(string Nombre, string Descripcion, int Cupo_Min, int Cupo_Max, string PrecioDelPrograma)
        {
            string SQL = "Insert into Programas (Nombre, Descripcion, Cupo_Min, Cupo_Max, PrecioDelPrograma) Values ('"
                + Nombre + "','" + Descripcion + "'," + Cupo_Min + "," + Cupo_Max + ",'" + PrecioDelPrograma + "')";

            return AdminRegistros(SQL);
        }
        public bool AltaDeSalidas(int ID_Programa, string Fecha, int Cant_Confirmados, string PrecioDeSalida)
        {
            string SQL = @"Insert into Salidas(ID_Programa,Fecha,Cant_Confirmados,PrecioDeSalida) VALUES ("
                + ID_Programa + " , '" + Fecha + "'," + Cant_Confirmados + ",'" + PrecioDeSalida + "')";

            return AdminRegistros(SQL);
        }
        //*******************************************Cargar tabla ProgramaXPreferencia*******************************************
        public bool CargarProgXPref(int ID_Programa, int ID_Preferencia)
        {
            string SQL = "Insert into ProgramaXPreferencia(ID_Programa, ID_Preferencia) Values (" + ID_Programa + "," + ID_Preferencia + ")";

            return AdminRegistros(SQL);
        }

        public int ObtenerUltimoPrograma()
        {
            string SQL = "Select TOP 1 * from Programas Order By ID_Programa desc";
            DataTable T = ObtenerTabla(SQL);
            int ID_Programa = Convert.ToInt16(T.Rows[0]["ID_Programa"].ToString());
            return ID_Programa;
        }

        //*******************************************Envio de mails*******************************************
        public bool TempEnvioMails(string ID_Programa, string ID_Salida)
        {
            string SQL = @"Insert Into TempEnvioMails (ID_Cliente, ID_Salida) SELECT DISTINCT C.ID_Cliente, " + ID_Salida + @" 
                        FROM ClienteXPreferencia INNER JOIN Cliente AS C ON ClienteXPreferencia.ID_Cliente = C.ID_Cliente 
                        WHERE (ClienteXPreferencia.ID_Preferencia IN 
                        (SELECT ProgramaXPreferencia.ID_Preferencia 
                        FROM ProgramaXPreferencia INNER JOIN Preferencias ON ProgramaXPreferencia.ID_Preferencia = Preferencias.ID_Preferencia INNER JOIN Programas ON ProgramaXPreferencia.ID_Programa = Programas.ID_Programa 
                        WHERE (ProgramaXPreferencia.ID_Programa = " + ID_Programa + " )))";

            return AdminRegistros(SQL);
        }
        public DataTable BuscarProxClienteTT()
        {
            string SQL = "Select Top 1 * from TempEnvioMails";

            return ObtenerTabla(SQL);
        }
        public DataTable Emails(string ID_Email)
        {
            string SQL = "Select * From Emails Where(ID_EMAIL =" + ID_Email + ")";
            
            return ObtenerTabla(SQL);
        }
        public DataTable Cant_Mails_x_Mandar()
        {
            string SQL = "Select * Where TempEnvioMails";
            return ObtenerTabla(SQL);
        }
        //*******************************************Consultas SQL*******************************************
        public DataTable BuscarDatosCliente(string ID_Cliente)
        {
            string SQL = "Select * from Cliente Where ID_Cliente = " + ID_Cliente;

            return ObtenerTabla(SQL);
        }
        public DataTable BuscarDatosGuia(string ID_Guia)
        {
            string SQL = "Select * from Guias Where ID_Guia = " + ID_Guia;

            return ObtenerTabla(SQL);
        }
        public DataTable BuscarDatosSalida(string ID_Salida)
        {
            string SQL = @"SELECT Programas.Nombre AS Programa, Salidas.Fecha, Salidas.Cant_Confirmados AS Confirmados, Salidas.PrecioDeSalida AS Precio, Salidas.ID_Programa, Salidas.ID_Salida 
                        FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa
                        where ID_Salida = " + ID_Salida;

            return ObtenerTabla(SQL);
        }
        public DataTable BuscarDatosExtra(string ID_Extra)
        {
            string SQL = @"Select * from Extras Where ID_Extra = " + ID_Extra;

            return ObtenerTabla(SQL);
        }
        public DataTable BuscarDatosOrigen(string ID_Origen)
        {
            string SQL = "Select * from Origen Where ID_Origen = " + ID_Origen;

            return ObtenerTabla(SQL);
        }
        public DataTable BuscarDatosPreferencia(string ID_Preferencia)
        {
            string SQL = "Select * from Preferencias Where ID_Preferencia = " + ID_Preferencia;

            return ObtenerTabla(SQL);
        }
        public DataTable BuscarDatosPrograma(string ID_Programa)
        {
            string SQL = "Select * from Programas Where ID_Programa = " + ID_Programa;

            return ObtenerTabla(SQL);
        }

        //*******************************************Modificaciones*******************************************
        public bool ModificarCliente(string ID_Cliente, string Nombre, string Apellido, int Tipo_Documento, string Numero_Documento, string Fecha_Nacimiento, int Genero, string Domicilio, int Localidad, int Provincia, string Pais, string Email, string Telefono, int Origen_Consulta, string Ficha_Medica)
        {
            string SQL = @"Update Cliente Set Nombre = '" + Nombre +
                "', Apellido = '" + Apellido +
                "', Tipo_Documento = " + Tipo_Documento +
                ", Numero_Documento = '" + Numero_Documento +
                "', Fecha_Nacimiento = '" + Fecha_Nacimiento +
                "', Genero = " + Genero +
                ", Domicilio = '" + Domicilio +
                "', Localidad = " + Localidad +
                ", Provincia = " + Provincia +
                ", Pais = '" + Pais +
                "', Email = '" + Email +
                "', Telefono = '" + Telefono +
                "', Origen_Consulta = " + Origen_Consulta +
                ", Ficha_medica = '" + Ficha_Medica + 
                "' Where ID_Cliente = " + ID_Cliente;

            return AdminRegistros(SQL);
        }
        public bool ModificarGuia(string ID_Guia, string Nombre, string Apellido, int Tipo_Documento, string Numero_Documento, int Genero, string Telefono, string Email)
        {
            string SQL = "Update Guias Set Nombre = '" + Nombre +
                "', Apellido = '" + Apellido +
                "', Tipo_Documento = " + Tipo_Documento +
                ", Numero_Documento = '" + Numero_Documento +
                "', Genero = " + Genero + 
                ", Telefono = '" + Telefono +
                "', Email = '" + Email + 
                "' Where ID_Guia = " + ID_Guia;

            return AdminRegistros(SQL);
        }
        public bool ModificarExtra(string ID_Extra, string Nombre, string Descripcion, float Monto)
        {
            string SQL = "Update Extras Set Nombre = '" + Nombre +
            "', Descripcion = '" + Descripcion +
            "', Monto = " + Monto + 
            " Where ID_Extra = " + ID_Extra; 

            return AdminRegistros(SQL);
        }
        public bool ModificarOrigen(string ID_Origen, string OrigenDeConsulta)
        {
            string SQL = "Update Origen Set OrigenDeConsulta = '" + OrigenDeConsulta +
                "' Where ID_Origen = " + ID_Origen;

            return AdminRegistros(SQL);
        }
        public bool ModificarPreferencia(string ID_Preferencia, string Nombre)
        {
            string SQL = "Update Preferencias Set Nombre = '" + Nombre +
                "' Where ID_Preferencia = " + ID_Preferencia;

            return AdminRegistros(SQL);
        }
        public bool ModificarPrograma(string ID_Programa, string Nombre, string Descripcion, int Cupo_Min, int Cupo_Max, string PrecioDelPrograma)
        {
            string SQL = "Update Programas Set Nombre = '" + Nombre +
                "', Descripcion = '" + Descripcion +
                "', Cupo_Min = " + Cupo_Min +
                ", Cupo_Max = " + Cupo_Max +
                ", PrecioDelPrograma = '" + PrecioDelPrograma +
                "' Where ID_Programa = " + ID_Programa;

            return AdminRegistros(SQL);
        }
        public string[] ObtenerIDsPrefXProgr(string ID_Programa)
        {
            string SQL = "Select * from ProgramaXPreferencia Where ID_Programa = " + ID_Programa;
            DataTable T = ObtenerTabla(SQL);
            string[] IDs = null;

            if(T != null)
            {
                if (T.Rows.Count > 0)
                {
                    IDs = new string [T.Rows.Count];
                    
                    for (int i = 0; i < T.Rows.Count;i++)
                    {
                        IDs[i] = T.Rows[i]["ID_Preferencia"].ToString();
                    }
                }
            }
            return IDs;
        }
        public bool EliminarRegistroDePreferencias(string ID_Programa)
        {
            string SQL = "Delete from ProgramaXPreferencia Where ID_Programa = " + ID_Programa;

            return AdminRegistros(SQL);
        }
        public bool ModificarSalida(string ID_Salida, string Fecha, int Cant_Confirmados, string PrecioDeSalida)
        {
            string SQL = @"Update Salidas Set Fecha = '" + Fecha +
                "',Cant_Confirmados = " + Cant_Confirmados +
                ",PrecioDeSalida = " + PrecioDeSalida +
                "Where ID_Salida = " + ID_Salida;

            return AdminRegistros(SQL);
        }
        //**********************COBROS**********************************
        public decimal ObtenerTotalPrecioSalida(string ID_CliXSal)
        {
            string SQL = "Select Monto_Final from ClienteXSalida Where ID_CliXSal = " + ID_CliXSal.ToString();
            DataTable T = ObtenerTabla(SQL);
            string P = T.Rows[0]["Monto_Final"].ToString();
            return Convert.ToDecimal(P);
        }
        public decimal ObtenerPrecioSalida(string ID_CliXSal)
        {
            string SQL = "select Monto from ClienteXSalida where ID_CliXSal = " + ID_CliXSal.ToString();
            DataTable T = ObtenerTabla(SQL);
            string S = T.Rows[0]["Monto"].ToString();
            return Convert.ToDecimal(S);
        }
        public decimal ObtenerPagoTotal(string ID_CliXSal)
        {
            string SQL = "Select Monto from PagosXSalidasXCliente Where ID_CliXSal = " + ID_CliXSal;
            DataTable T = ObtenerTabla(SQL);
            decimal Total = 0;
            if (T != null)
            {
                for (int i = 0; i < T.Rows.Count; i++)
                {
                    string X = T.Rows[i]["Monto"].ToString();
                    Total = Total + Convert.ToDecimal(X);
                }
            }
            return Total;
        }
        public decimal ObtenerPrecioExtra(string ID_CliXSal)
        {
            string SQL = "Select Monto, Cantidad from ExtraXClienteXSalida Where ID_CliXSal  = " + ID_CliXSal;
            DataTable T = ObtenerTabla(SQL);
            int Monto = 0;
            int Cantidad = 0;
            int Total = 0;
            if (T != null)
            {
                if (T.Rows.Count > 0)
                {
                    for (int i = 0; i < T.Rows.Count; i++)
                    {
                        string Z = T.Rows[i]["Monto"].ToString();
                        string X = T.Rows[i]["Cantidad"].ToString();
                        Cantidad = Convert.ToInt16(X);
                        Monto = Convert.ToInt16(Z);
                        Total = Total + (Monto * Cantidad);
                    }
                }
            }
            return Total;
        }
        public decimal ObtenerSaldo(string ID_CliXSal)
        {
            string SQL = "Select Monto from PagosXSalidasXCliente Where ID_CliXSal = " + ID_CliXSal;
            DataTable T = ObtenerTabla(SQL);
            decimal Total = 0;
            if (T != null)
            {
                for (int i = 0; i < T.Rows.Count; i++)
                {
                    string X = T.Rows[i]["monto"].ToString();
                    Total = Total + Convert.ToDecimal(X);
                }
            }
            return Total;
        }
    }
}