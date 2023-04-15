using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LivroCaixa2023.Classes;
using LivroCaixa2023.Tabelas;

namespace LivroCaixa2023.Paginas
{
    public partial class Index : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            inicializa();

            Usuario.lista.Add(new Usuario("mariarita", "123", "Rita", 'A', "32369280778"));
            //Serializa.saveUsuario(Usuario.lista);
            //return;

            if (Usuario.lista.Count == 0)
            {
                Usuario.lista = Serializa.CarregaUser();

                if (Usuario.lista != null)
                {
                    foreach (Usuario u in Usuario.lista)
                    {
                        Usuario.idRaiz = u.id > Usuario.idRaiz ? u.id : 
                            Usuario.idRaiz;
                    }

                   // Usuario.idRaiz++;
                } 
                else
                {
                    lbMensagem.Text = "Lista vazia";
                }
            }

           
        }

        private void inicializa()
        {
            lbTitulo.Text = "Digite Login / Senha";
            lbLogin.Text = "Login";
            lbSenha.Text = "Senha";
        }

        protected void btOk_Click(object sender, EventArgs e)
        {
            Usuario busca = new Usuario(txLogin.Text, txSenha.Text);

            foreach (Usuario usuario in Usuario.lista)
            {
                if (usuario.usuarioOk(busca))
                {
                    Session["usuario"] = usuario;

                    HttpCookie cookie = new HttpCookie("usuario_conectado");
                    cookie.Value = usuario.id.ToString();
                    DateTime dtNow = DateTime.Now;
                    TimeSpan tsMinute = new TimeSpan(0, 1, 0, 0);
                    cookie.Expires = dtNow + tsMinute;
                    Response.Cookies.Add(cookie);

                    if (usuario.perfil == 'A')
                    {
                        ((SiteMaster)this.Master).SetButtonsAdminTrue();
                        return;
                    }
                    else
                    {
                        Response.Redirect("FluxoDeCaixa.aspx", false);
                        return;
                    }
                }
            }

            lbMensagem.Text = "Usuário não encontrado ou senha não confere!";
        }
    }
}