using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ChampaquiAdventure_v3
{
    public class GestionDB
    {
        /*General*/
        private string CadenaConexion = ConfigurationManager.ConnectionStrings["ChampaquiAdventureConnectionString1"].ConnectionString;
        public bool Admin_Registros(SqlCommand sqlcom)
        {
            bool exito = true;
            try
            {
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
        private DataTable obtenertabla(string SQL)
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
        /*Emails*/
        public bool BorrarRegistro(string ID)
        {
            string SQL = "DELETE FROM TempEnvioMails WHERE ID_TempEnvioMails = @ID";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@ID", ID);
            return Admin_Registros(sc);
        }
        public bool ContarRegistros()
        {
            string SQL = "SELECT COUNT((ID_TempEnvioMails)) FROM TempEnvioMails";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            return Admin_Registros(sc);
        }
        public DataTable BuscarProxClienteTT()
        {
            string SQL = "SELECT TOP 1 * FROM TempEnvioMails";

            return obtenertabla(SQL);
        }
        public DataTable BuscarDatos_Salida(string ID_Salida)
        {
            string SQL = @"SELECT Salidas.ID_Salida, Salidas.ID_Programa, Salidas.Fecha, Programas.Nombre 
                        FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa
                        WHERE ID_Salida = " + ID_Salida;

            return obtenertabla(SQL);
        }
        public DataTable BuscarDatosCliente(string ID_Cliente)
        {
            string SQL = "SELECT * FROM Cliente WHERE ID_Cliente = " + ID_Cliente;

            return obtenertabla(SQL);
        }
        public DataTable emails(string eMails_ID)
        {
            string SQL = "SELECT * FROM Emails WHERE(ID_email =" + eMails_ID + ")";
            return obtenertabla(SQL);
        }
        public DataTable Cant_Mails_x_Mandar()
        {
            string SQL = "SELECT * FROM TempEnvioMails";
            return obtenertabla(SQL);
        }
        /*Settings*/
        public bool Settings_Emails(string SET_Email, string SET_Pass)
        {
            string SQL = @"INSERT INTO Emails(Email,Password)VALUES(@SET_Email, @SET_Pass)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@SET_Email", SET_Email);
            sc.Parameters.AddWithValue("@SET_Pass", SET_Pass);
            return Admin_Registros(sc);
        }
        /*Altas*/
        public bool Alta_Extras(string EXT_Nombre, string EXT_Descripcion, string EXT_Monto)
        {
            string SQL = @"INSERT INTO Extras(Nombre,Descripcion,Monto)
                        VALUES(@EXT_Nombre,@EXT_Descripcion,@EXT_Monto)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@EXT_Nombre", EXT_Nombre);
            sc.Parameters.AddWithValue("@EXT_Descripcion", EXT_Descripcion);
            sc.Parameters.AddWithValue("@EXT_Monto", EXT_Monto);
            return Admin_Registros(sc);
        }
        public bool Alta_Programa(string PRG_Nombre, string PRG_Descripcion, string PRG_Cupo_Min, string PRG_Cupo_Max, string PRG_PrecioxPersona)
        {
            string SQL = @"INSERT INTO Programas(Nombre,Descripcion,Cupo_Min,Cupo_Max,PrecioDelPrograma)
                        VALUES(@PRG_Nombre,@PRG_Descripcion,@PRG_Cupo_Min,@PRG_Cupo_Max,@PRG_PrecioxPersona)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@PRG_Nombre", PRG_Nombre);
            sc.Parameters.AddWithValue("@PRG_Descripcion", PRG_Descripcion);
            sc.Parameters.AddWithValue("@PRG_Cupo_Min", PRG_Cupo_Min);
            sc.Parameters.AddWithValue("@PRG_Cupo_Max", PRG_Cupo_Max);
            sc.Parameters.AddWithValue("@PRG_PrecioxPersona", PRG_PrecioxPersona);
            return Admin_Registros(sc);
        }
        public bool Alta_Preferencia(string PREF_Nombre)
        {
            string SQL = @"INSERT INTO Preferencias(Nombre)
                        VALUES(@PREF_Nombre)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@PREF_Nombre", PREF_Nombre);
            return Admin_Registros(sc);
        }
        public bool Alta_Origen(string ORG_Origen_Consulta)
        {
            string SQL = @"INSERT INTO Origen(OrigenDeConsulta)
                        VALUES(@ORG_Origen_Consulta)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@ORG_Origen_Consulta", ORG_Origen_Consulta);
            return Admin_Registros(sc);
        }
        public bool Alta_Salidas(string SAL_ID_Prog, string SAL_Fecha, string SAL_Cant_Conf, string SAL_PrecioxPers)
        {
            string SQL = @"INSERT INTO Salidas(ID_Programa,Fecha,Cant_Confirmados,PrecioDeSalida)
                        VALUES(@SAL_ID_Prog,@SAL_Fecha,@SAL_Cant_Conf,@SAL_PrecioxPers)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@SAL_ID_Prog", SAL_ID_Prog);
            sc.Parameters.AddWithValue("@SAL_Fecha", SAL_Fecha);
            sc.Parameters.AddWithValue("@SAL_Cant_Conf", SAL_Cant_Conf);
            sc.Parameters.AddWithValue("@SAL_PrecioxPers", SAL_PrecioxPers);
            return Admin_Registros(sc);
        }
        public bool Alta_Guias(string GUI_Tipo_Doc, string GUI_Nro_Doc, string GUI_Nombre, string GUI_Apellido, string GUI_Telefono, string GUI_Email, string GUI_Sexo)
        {
            string SQL = @"INSERT INTO Guias(Tipo_Documento,Numero_Documento,Nombre,Apellido,Telefono,Email,Sexo)
                        VALUES(@GUI_Tipo_Doc,@GUI_Nro_Doc,@GUI_Nombre,@GUI_Apellido,@GUI_Telefono,@GUI_Email,@GUI_Sexo)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@GUI_Tipo_Doc", GUI_Tipo_Doc);
            sc.Parameters.AddWithValue("@GUI_Nro_Doc", GUI_Nro_Doc);
            sc.Parameters.AddWithValue("@GUI_Nombre", GUI_Nombre);
            sc.Parameters.AddWithValue("@GUI_Apellido", GUI_Apellido);
            sc.Parameters.AddWithValue("@GUI_Telefono", GUI_Telefono);
            sc.Parameters.AddWithValue("@GUI_Email", GUI_Email);
            sc.Parameters.AddWithValue("@GUI_Sexo", GUI_Sexo);
            return Admin_Registros(sc);
        }
        public bool Alta_Clientes(string CLI_Tipo_Doc, string CLI_Nro_Doc, string CLI_Nombre, string CLI_Apellido, string CLI_Fecha_Nac, string CLI_Domicilo, string CLI_Localidad, string CLI_Provincia, string CLI_Pais, string CLI_Email, string CLI_Telefono, string CLI_Origen, string CLI_Sexo, string CLI_Ficha_Med)
        {
            string SQL = @"INSERT INTO Cliente(Tipo_Documento,Numero_Documento,Nombre,Apellido,Fecha_Nacimiento,Domicilio,Localidad,Provincia,Pais,Email,Telefono,Origen_Consulta,Sexo,Ficha_Medica)
                           VALUES(@CLI_Tipo_Doc,@CLI_Nro_Doc,@CLI_Nombre,@CLI_Apellido,@CLI_Fecha_Nac,@CLI_Domicilo,@CLI_Localidad,@CLI_Provincia,@CLI_Pais,@CLI_Email,@CLI_Telefono,@CLI_Origen,@CLI_Sexo,@CLI_Ficha_Med)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@CLI_Tipo_Doc", CLI_Tipo_Doc);
            sc.Parameters.AddWithValue("@CLI_Nro_Doc", CLI_Nro_Doc);
            sc.Parameters.AddWithValue("@CLI_Nombre", CLI_Nombre);
            sc.Parameters.AddWithValue("@CLI_Apellido", CLI_Apellido);
            sc.Parameters.AddWithValue("@CLI_Fecha_Nac", CLI_Fecha_Nac);
            sc.Parameters.AddWithValue("@CLI_Domicilo", CLI_Domicilo);
            sc.Parameters.AddWithValue("@CLI_Localidad", CLI_Localidad);
            sc.Parameters.AddWithValue("@CLI_Provincia", CLI_Provincia);
            sc.Parameters.AddWithValue("@CLI_Pais", CLI_Pais);
            sc.Parameters.AddWithValue("@CLI_Email", CLI_Email);
            sc.Parameters.AddWithValue("@CLI_Telefono", CLI_Telefono);
            sc.Parameters.AddWithValue("@CLI_Origen", CLI_Origen);
            sc.Parameters.AddWithValue("@CLI_Sexo", CLI_Sexo);
            sc.Parameters.AddWithValue("@CLI_Ficha_Med", CLI_Ficha_Med);
            return Admin_Registros(sc);
        }
        public bool TempEnvioMails(string ID_Programa, string ID_Salida)
        {
            string SQL = @"INSERT INTO TempEnvioMails (ID_Cliente, ID_Salida) SELECT DISTINCT C.ID_Cliente, @ID_Salida 
                        FROM ClienteXPreferencia INNER JOIN Cliente AS C ON ClienteXPreferencia.ID_Cliente = C.ID_Cliente 
                        WHERE (ClienteXPreferencia.ID_Preferencia IN 
                        (SELECT ProgramaXPreferencia.ID_Preferencia 
                        FROM ProgramaXPreferencia INNER JOIN Preferencias ON ProgramaXPreferencia.ID_Preferencia = Preferencias.ID_Preferencia INNER JOIN Programas ON ProgramaXPreferencia.ID_Programa = Programas.ID_Programa 
                        WHERE (ProgramaXPreferencia.ID_Programa = @ID_Programa )))";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@ID_Salida", ID_Salida);
            sc.Parameters.AddWithValue("@ID_Programa", ID_Programa);
            return Admin_Registros(sc);
        }
        public bool CargarProgXPref(string ID_Programa, string ID_PReferencia)
        {
            string SQL = "INSERT INTO ProgramaXPreferencia(ID_Programa, ID_Preferencia)VALUES(@ID_Programa,@ID_Preferencia)";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@ID_Programa", ID_Programa);
            sc.Parameters.AddWithValue("@ID_Preferencia", ID_PReferencia);
            return Admin_Registros(sc);
        }
        /*Modificar*/
        public bool Modificar_Extra(string EXT_ID_Extra, string EXT_Nombre, string EXT_Descripcion, string EXT_Monto)
        {
            string SQL = @"UPDATE Extras
                        SET Nombre = @EXT_Nombre, Descripcion = @EXT_Descripcion, Monto = @EXT_Monto
                        WHERE(ID_Extra = " + EXT_ID_Extra + ")";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@EXT_Nombre", EXT_Nombre);
            sc.Parameters.AddWithValue("@EXT_Descripcion", EXT_Descripcion);
            sc.Parameters.AddWithValue("@EXT_Monto", EXT_Monto);
            return Admin_Registros(sc);
        }
        public bool Modificar_Guia(string GUI_ID_Guia, string GUI_Tipo_Doc, string GUI_Nro_Doc, string GUI_Nombre, string GUI_Apellido, string GUI_Telefono, string GUI_Email, string GUI_Sexo)
        {
            string SQL = @"UPDATE Guias
                        SET Tipo_Documento = @GUI_Tipo_Doc, Numero_Documento = @GUI_Nro_Doc, Nombre = @GUI_Nombre, Apellido = @GUI_Apellido, Telefono = @GUI_Telefono, Email = @GUI_Email, Sexo = @GUI_Sexo
                        WHERE(ID_Guia = " + GUI_ID_Guia + ")";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@GUI_Tipo_Doc", GUI_Tipo_Doc);
            sc.Parameters.AddWithValue("@GUI_Nro_Doc", GUI_Nro_Doc);
            sc.Parameters.AddWithValue("@GUI_Nombre", GUI_Nombre);
            sc.Parameters.AddWithValue("@GUI_Apellido", GUI_Apellido);
            sc.Parameters.AddWithValue("@GUI_Telefono", GUI_Telefono);
            sc.Parameters.AddWithValue("@GUI_Email", GUI_Email);
            sc.Parameters.AddWithValue("@GUI_Sexo", GUI_Sexo);
            return Admin_Registros(sc);
        }
        public bool Modificar_Origen(string ORG_ID_Origen, string ORG_Origen_Consulta)
        {
            string SQL = @"UPDATE Origen
                        SET OrigenDeConsulta = @ORG_Origen_Consulta
                        WHERE(ID_Origen = " + ORG_ID_Origen + ")";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@ORG_Origen_Consulta", ORG_Origen_Consulta);
            return Admin_Registros(sc);
        }
        public bool ModificarPreferencia(string ID_Preferencia, string Nombre)
        {
            string SQL = "Update Preferencias Set Nombre = @Nombre Where ID_Preferencia = @ID_Preferencia";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@Nombre", Nombre);
            sc.Parameters.AddWithValue("@ID_Preferencia", ID_Preferencia);
            return Admin_Registros(sc);
        }
        public bool ModificarPrograma(string ID_Programa, string Nombre, string Descripcion, string Cupo_Min, string Cupo_Max, string PrecioDelPrograma)
        {
            string SQL = "Update Programas Set Nombre = @Nombre, Descripcion = @Descripcion, Cupo_Min = @cupo_Min, Cupo_Max = @Cupo_Max, PrecioDelPrograma = @PrecioDelPrograma Where ID_Programa = @ID_Programa";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@Nombre", Nombre);
            sc.Parameters.AddWithValue("@Descripcion", Descripcion);
            sc.Parameters.AddWithValue("@Cupo_Min", Cupo_Min);
            sc.Parameters.AddWithValue("@Cupo_Max", Cupo_Max);
            sc.Parameters.AddWithValue("@PrecioDelPrograma", PrecioDelPrograma);
            sc.Parameters.AddWithValue("@ID_Programa", ID_Programa);
            return Admin_Registros(sc);
        }
        public bool ModificarSalida(string ID_Salida, string Fecha, string Cant_Confirmados, string PrecioDeSalida)
        {
            string SQL = @"Update Salidas Set Fecha = @Fecha, Cant_Confirmados = @Cant_Confirmados, PrecioDeSalida = @PrecioDeSalida Where ID_Salida = @ID_Salida";
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            sc.Parameters.AddWithValue("@Fecha", Fecha);
            sc.Parameters.AddWithValue("@Cant_Confirmados", Cant_Confirmados);
            sc.Parameters.AddWithValue("@PrecioDeSalida", PrecioDeSalida);
            sc.Parameters.AddWithValue("@ID_Salida", ID_Salida);
            return Admin_Registros(sc);
        }
        public string[] ObtenerIDsPrefXProgr(string ID_Programa)
        {
            string SQL = "Select * from ProgramaXPreferencia Where ID_Programa = " + ID_Programa;
            DataTable T = obtenertabla(SQL);
            string[] IDs = null;

            if (T != null)
            {
                if (T.Rows.Count > 0)
                {
                    IDs = new string[T.Rows.Count];

                    for (int i = 0; i < T.Rows.Count; i++)
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
            SqlCommand sc = new SqlCommand(SQL, new SqlConnection(CadenaConexion));
            return Admin_Registros(sc);
        }
        /*Obtener datos*/
        public int ObtenerUltimoPrograma()
        {
            string SQL = "SELECT TOP 1 * FROM Programas ORDER BY ID_Programa DESC";
            DataTable t = obtenertabla(SQL);
            int ID_Programa = Convert.ToInt16(t.Rows[0]["ID_Programa"]);
            return ID_Programa;
        }
        public DataTable BuscarDatosGuia(string ID_Guia)
        {
            string SQL = "Select * from Guias Where ID_Guia = " + ID_Guia;

            return obtenertabla(SQL);
        }
        public DataTable BuscarDatosSalida(string ID_Salida)
        {
            string SQL = @"SELECT Programas.Nombre AS Programa, Salidas.Fecha, Salidas.Cant_Confirmados AS Confirmados, Salidas.PrecioDeSalida AS Precio, Salidas.ID_Programa, Salidas.ID_Salida 
                        FROM Salidas INNER JOIN Programas ON Salidas.ID_Programa = Programas.ID_Programa
                        where ID_Salida = " + ID_Salida;

            return obtenertabla(SQL);
        }
        public DataTable BuscarDatosExtra(string ID_Extra)
        {
            string SQL = @"Select * from Extras Where ID_Extra = " + ID_Extra;

            return obtenertabla(SQL);
        }
        public DataTable BuscarDatosOrigen(string ID_Origen)
        {
            string SQL = "Select * from Origen Where ID_Origen = " + ID_Origen;

            return obtenertabla(SQL);
        }
        public DataTable BuscarDatosPreferencia(string ID_Preferencia)
        {
            string SQL = "Select * from Preferencias Where ID_Preferencia = " + ID_Preferencia;

            return obtenertabla(SQL);
        }
        public DataTable BuscarDatosPrograma(string ID_Programa)
        {
            string SQL = "Select * from Programas Where ID_Programa = " + ID_Programa;

            return obtenertabla(SQL);
        }
        /*Gestion de cobros*/
        public decimal obtenerPrecioTotalSalida(string ID_CliXSal)
        {
            string sql = "select Monto_Final from ClienteXSalida where ID_CliXSal = " + ID_CliXSal.ToString();
            DataTable t = obtenertabla(sql);
            string p = t.Rows[0]["Monto_Final"].ToString();
            return Convert.ToDecimal(p);
        }
        public decimal obtenerPrecioSalida(string ID_CliXSal)
        {
            string sql = "select Monto from ClienteXSalida where ID_CliXSal = " + ID_CliXSal.ToString();
            DataTable t = obtenertabla(sql);
            string s = t.Rows[0]["Monto"].ToString();
            return Convert.ToDecimal(s);
        }
        public decimal obtenerPagoTotal(string ID_CliXSal)
        {
            string Sql = "select Monto from PagosXSalidasXCliente where ID_CliXSal = " + ID_CliXSal;
            DataTable t = obtenertabla(Sql);
            decimal Total = 0;
            if (t != null)
            {
                for (int i = 0; i < t.Rows.Count; i++)
                {
                    string x = t.Rows[i]["monto"].ToString();
                    Total = Total + Convert.ToDecimal(x);
                }
            }
            return Total;
        }
        public decimal obtenerPrecioExtra(string ID_CliXSal)
        {
            string sql = "select Monto, Cantidad from ExtraXClienteXSalida where ID_CliXSal  = " + ID_CliXSal;
            DataTable t = obtenertabla(sql);
            int monto = 0;
            int Cantidad = 0;
            int Total = 0;
            if (t != null)
            {
                if (t.Rows.Count > 0)
                {
                    for (int i = 0; i < t.Rows.Count; i++)
                    {
                        string z = t.Rows[i]["monto"].ToString();
                        string x = t.Rows[i]["Cantidad"].ToString();
                        Cantidad = Convert.ToInt16(x);
                        monto = Convert.ToInt16(z);
                        Total = Total + (monto * Cantidad);
                    }
                }
            }
            return Total;
        }
        public decimal obtenerSaldo(string ID_CliXSal)
        {
            string Sql = "select Monto from PagosXSalidasXCliente where ID_CliXSal = " + ID_CliXSal;
            DataTable t = obtenertabla(Sql);
            decimal Total = 0;
            if (t != null)
            {
                for (int i = 0; i < t.Rows.Count; i++)
                {
                    string x = t.Rows[i]["monto"].ToString();
                    Total = Total + Convert.ToDecimal(x);
                }
            }
            return Total;
        }
    }
}