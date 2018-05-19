using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Proyecto_Csharp.Clases
{
    class Ubigeo
    {
        SqlConnection cn = new SqlConnection(
                ConfigurationManager.ConnectionStrings["cs_proyecto"].ConnectionString
                );


        public DataTable ListarPais()
        {
            //Instanciando a la clase datatable
            var tabla = new DataTable();
            try
            {
                //Creando una instancia de la clase sqldataadapter
                using (var adaptador = new SqlDataAdapter("SP_LISTAR_PAIS", cn))
                {
                    adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adaptador.Fill(tabla);
                }
            }
            catch (SqlException e)
            {

                System.Windows.Forms.MessageBox.Show(e.Message);
                return tabla;
            }
            return tabla;
        }

        public DataTable ListarProvinciasPorPaisId(string paisId)
        {
            //Instanciando a la clase datatable
            var tabla = new DataTable();
            try
            {
                //Creando una instancia de la clase sqldataadapter
                using (var adaptador = new SqlDataAdapter("SP_LISTAR_PROVINCIAS", cn))
                {
                    //Indicar el valor para asignar provincias
                    adaptador.SelectCommand.Parameters.AddWithValue("@PAIS_ID", paisId);
                    adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adaptador.Fill(tabla);
                }
            }
            catch (SqlException e)
            {

                System.Windows.Forms.MessageBox.Show(e.Message);
                return tabla;
            }
            return tabla;
        }

        public DataTable ListarDistritosPorPorvinciaId(string provinciaId)
        {
            //Instanciando a la clase datatable
            var tabla = new DataTable();
            try
            {
                //Creando una instancia de la clase sqldataadapter
                using (var adaptador = new SqlDataAdapter("SP_LISTAR_DISTRITOS", cn))
                {
                    //Indicar el valor para asignar provincias
                    adaptador.SelectCommand.Parameters.AddWithValue("@PROVINCIAR_ID", provinciaId);
                    adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adaptador.Fill(tabla);
                }
            }
            catch (SqlException e)
            {

                System.Windows.Forms.MessageBox.Show(e.Message);
                return tabla;
            }
            return tabla;
        }
    }
}
