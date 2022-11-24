using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DiscoverCR.Implementacion
{
    class Sitio
    {
        //Creacion de atributos de la clase Sitio
        private int id_sitio;
        private string nombreSitio;
        private Usuario usuarioSitio;
        private string ubicacion;
        private string descripcion;

        //Metodo constructor de la clase Sitio
        public Sitio(int id_sitio, string nombreSitio, Usuario usuarioSitio, string ubicacion, string descripcion) {
            this.id_sitio = id_sitio;
            this.nombreSitio = nombreSitio;
            this.usuarioSitio = usuarioSitio;
            this.ubicacion = ubicacion;
            this.descripcion = descripcion;
        }

        //Metodo de creacion de Sitio (Create)
        public string CrearSitio(int id_sitio, string nombreSitio, Usuario usuarioSitio, string ubicacion, string descripcion)
        {
            MySqlCommand cmd;//comandos
            MySqlConnection con;//conexion

            try
            {
                con = new MySqlConnection("server = localhost; " +
                                          "port = 3306; " +
                                          "username = root; " +
                                          "password =;" +
                                          "database =db_discover_cr");
                con.Open();
                cmd = new MySqlCommand("crearSitio", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id_sitio", id_sitio);
                cmd.Parameters.AddWithValue("nombreSitio", nombreSitio);
                cmd.Parameters.AddWithValue("usuarioSitio", usuarioSitio);
                cmd.Parameters.AddWithValue("ubicacion", ubicacion);
                cmd.Parameters.AddWithValue("descripcion", descripcion);

                cmd.ExecuteNonQuery();

                return "Datos de Sitio almacenados.";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        //Metodo visualizar Sitio (Read)

        //Metodo editar Sitio (Update)

        //Metodo eliminar Sitio (Delete)
    }
}
