using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace DiscoverCR.Implementacion
{
    class Usuario
    {
        //Creacion de atributos de la clase usuario
        private int id_usuario;
        private string nombreUsuario;
        private string clave;
        private string nombre;
        private string apellido1;
        private string apellido2;
        private string email;
        private string tipo;
        private string infoGeneral;
        private string fotoPerfil;
        private bool bloqueado;

        //Metodo constructor de la clase usuario
        public Usuario(int id_usuario, string nombreUsuario, string clave, string nombre, string apellido1,
            string apellido2, string email, string tipo, string infoGeneral, string fotoPerfil, bool bloqueado) {
            this.id_usuario = id_usuario;
            this.nombreUsuario = nombreUsuario;
            this.clave = clave;
            this.nombre = nombre;
            this.apellido1 = apellido1;
            this.apellido2 = apellido2;
            this.email = email;
            this.tipo = tipo;
            this.infoGeneral = infoGeneral;
            this.fotoPerfil = fotoPerfil;
            this.bloqueado = bloqueado;

        }

        //Metodo de creacion de usuario (Create)
        public string CrearUsuario(int id_usuario, string nombreUsuario, string clave, string nombre, string apellido1,
            string apellido2, string email, string tipo, string infoGeneral, string fotoPerfil)
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
                cmd = new MySqlCommand("crearUsuario", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("id_usuario", id_usuario);
                cmd.Parameters.AddWithValue("nombreUsuario", nombreUsuario);
                cmd.Parameters.AddWithValue("clave", clave);
                cmd.Parameters.AddWithValue("nombre", nombre);
                cmd.Parameters.AddWithValue("apellido1", apellido1);
                cmd.Parameters.AddWithValue("apellido2", apellido2);
                cmd.Parameters.AddWithValue("email", email);
                cmd.Parameters.AddWithValue("tipo", tipo);
                cmd.Parameters.AddWithValue("infoGeneral", infoGeneral);
                cmd.Parameters.AddWithValue("fotoPerfil", fotoPerfil);
                cmd.Parameters.AddWithValue("bloqueado", false);

                cmd.ExecuteNonQuery();

                return "Datos del usuario almacenados.";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        //Metodo visualizar usuario (Read)
        public string mostrarUsuario(string id_usuario)
        {
            MySqlCommand cmd = new MySqlCommand();//comandos
            MySqlConnection con;//conexion
            MySqlDataAdapter Adaptador = new MySqlDataAdapter();
            DataSet dsUsuarios = new DataSet();
            DataTable tblUsuario = new DataTable();
            string txt = "";
            try
            {
                con = new MySqlConnection("server = localhost; " +
                                          "port = 3306; " +
                                          "username = root; " +
                                          "password =;" +
                                          "database =db_discover_cr");
                con.Open();
                string qry = "SELECT * FROM tb_usuario where id_usuario=" + id_usuario;
                cmd.CommandText = qry;
                cmd.Connection = con;
                Adaptador.SelectCommand = cmd;
                Adaptador.Fill(dsUsuarios, "tb_usuario");
                cmd.ExecuteNonQuery();

                tblUsuario = dsUsuarios.Tables["tb_usuario"];

                foreach (DataRow drCurrent in tblUsuario.Rows)
                {
                    txt = drCurrent["nombreUsuario"].ToString();
                    txt = drCurrent["infoGeneral"].ToString();
                    txt = drCurrent["fotoPerfil"].ToString();
                }
                return txt;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        //Metodo editar usuario (Update)

        //Metodo eliminar usuario (Delete)
    }
}
