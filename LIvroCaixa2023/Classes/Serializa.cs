using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using LivroCaixa2023.Tabelas;

namespace LivroCaixa2023.Classes
{ 
    [Serializable]
    public class Serializa
    {
        public static List<Lancamento> loadLancamento()
        {
            try
            {
                if (!File.Exists("lancamento.dat")) return null;

                FileStream fs = new FileStream("lancamento.dat",
                    FileMode.Open);
                BinaryFormatter formatter = new BinaryFormatter();
                List<Lancamento> lista = (List<Lancamento>)formatter.Deserialize(fs);
                fs.Close();
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void saveLancamento(List<Lancamento> lista)
        {
            try
            {
                lista.Sort();
                FileStream fs = new FileStream("lancamento.dat",
                    FileMode.Create);
                BinaryFormatter serializer = new BinaryFormatter();
                serializer.Serialize(fs, lista);
                fs.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public static void saveUsuario(List<Usuario> lista)
        {
            try
            {
                lista.Sort();
                FileStream fs = new FileStream("caixa.dat",
                    FileMode.Create);
                BinaryFormatter serializer = new BinaryFormatter();
                serializer.Serialize(fs, lista);
                fs.Close();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public static List<Usuario> CarregaUser()
        {
            try
            {
                if (!File.Exists("caixa.dat")) return null;

                FileStream fs = new FileStream("caixa.dat",
                    FileMode.Open);
                BinaryFormatter formatter = new BinaryFormatter();
                List<Usuario> lista = (List<Usuario>)formatter.Deserialize(fs);
                fs.Close();
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }

}