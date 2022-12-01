using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DiscoverCR.Implementacion
{
    class Categoria
    {
        //Creacion de atributos de la clase Categoria
        private int id_categoria;
        private string nombreCategoria;
        private string descripcion;

        //Metodo constructor de la clase Categoria
        public Categoria(int id_categoria, string nombreCategoria, string descripcion) {
            this.id_categoria = id_categoria;
            this.nombreCategoria = nombreCategoria;
            this.descripcion = descripcion;
        }

        //Metodo de creacion de Categoria (Create)
        public string CrearCategoria(int id_categoria, string nombreCategoria, string descripcion)
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
                cmd = new MySqlCommand("crearCategoria", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id_categoria", id_categoria);
                cmd.Parameters.AddWithValue("nombreCategoria", nombreCategoria);
                cmd.Parameters.AddWithValue("descripcion", descripcion);

                cmd.ExecuteNonQuery();

                return "Datos de Categoria almacenados.";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        //Metodo visualizar Categoria (Read)

        //Metodo editar Categoria (Update)

        //Metodo eliminar Categoria (Delete)
    }
}
