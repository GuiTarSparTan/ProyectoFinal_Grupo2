using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DiscoverCR.Implementacion
{
    class Actividad
    {
        //Creacion de atributos de la clase Actividad
        private int id_actividad;
        private Sitio id_sitio;
        private Categoria id_categoria;
        private string nombre_actividad;
        private string descripcion;

        //Metodo constructor de la clase Actividad
        public Actividad(int id_actividad, Sitio id_sitio, Categoria id_categoria, string nombre_actividad, string descripcion) {
            this.id_actividad = id_actividad;
            this.id_sitio = id_sitio;
            this.id_categoria = id_categoria;
            this.nombre_actividad = nombre_actividad;
            this.descripcion = descripcion;
        }

        //Metodo de creacion de Actividad (Create)
        public string CrearActividad(int id_actividad, Sitio id_sitio, Categoria id_categoria, string nombre_actividad, string descripcion)
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
                cmd = new MySqlCommand("crearActividad", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id_actividad", id_actividad);
                cmd.Parameters.AddWithValue("id_sitio", id_sitio);
                cmd.Parameters.AddWithValue("id_categoria", id_categoria);
                cmd.Parameters.AddWithValue("nombre_actividad", nombre_actividad);
                cmd.Parameters.AddWithValue("descripcion", descripcion);

                cmd.ExecuteNonQuery();

                return "Datos de Actividad almacenados.";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        //Metodo visualizar Actividad (Read)

        //Metodo editar Actividad (Update)

        //Metodo eliminar Actividad (Delete)
    }
}
