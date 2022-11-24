using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DiscoverCR.Implementacion
{
    class Reporte
    {
        //Creacion de atributos de la clase Reporte
        private int id_reporte;
        private Usuario id_usuario;
        private Usuario usuarioReporte;
        private DateTime fecha;
        private string comentario;

        //Metodo constructor de la clase Usuario
        public Reporte(int id_reporte, Usuario id_usuario, Usuario usuarioReporte, DateTime fecha, string comentario) {
            this.id_reporte = id_reporte;
            this.id_usuario = id_usuario;
            this.usuarioReporte = usuarioReporte;
            this.fecha = fecha;
            this.comentario = comentario;
        }

        //Metodo crear reporte
        public string CrearReporte(int id_reporte, Usuario id_usuario, Usuario usuarioReporte, DateTime fecha, string comentario)
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
                cmd = new MySqlCommand("crearReporte", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id_reporte", id_reporte);
                cmd.Parameters.AddWithValue("id_usuario", id_usuario);
                cmd.Parameters.AddWithValue("usuarioReporte", usuarioReporte);
                cmd.Parameters.AddWithValue("fecha", fecha);
                cmd.Parameters.AddWithValue("comentario", comentario);

                cmd.ExecuteNonQuery();

                return "Datos del reporte almacenados.";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        //Metodo visualizar reporte

        //Metodo editar reporte

        //Metodo eliminar reporte
    }
}
