
using LivroCaixa2023;
using LivroCaixa2023.Classes;
using LivroCaixa2023.Tabelas;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LIvroCaixa2023.Paginas
{
    public partial class CadastroUuarios : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("index.aspx",false);
                return;
            }
          
            tabusers.Text = Usuario.montaTabela("Usuários Cadastrados");
            inicializa();
            Usuario uSel = (Usuario)Session["usuario"];

            ((SiteMaster)this.Master).SetButtonGeneralTrue();
            if (uSel.perfil == 'A')
            {
                ((SiteMaster)this.Master).SetButtonsAdminTrue();
                return;
            }
        }

        private void inicializa()
        {
            lbTitulo.Text = "Cadastro de Usuários - Livro Caixa";
            lbLogin.Text = "Login";
            lbNome.Text = "Nome";
            lbUsu.Text = "Usu";
            lbAdm.Text = "Adm";
            lbCpf.Text = "Cpf";
            lbPerfil.Text = "Perfil";

            txCpf.ReadOnly = Session["usuarioBusca"] != null;

            btInicializaSenha.Enabled =  
            btExclui.Enabled = Session["usuarioBusca"] != null;

            btInicializaSenha.ForeColor =
            btExclui.ForeColor = btExclui.Enabled ? Color.Black : Color.DarkGray;

            lbBuscaPorId.Text = "Busca de usuário por ID";
        }

        protected void btOk_Click(object sender, EventArgs e)
        {
            if (!rbAdm.Checked && !rbUsu.Checked)
            {
                lbMensagem.Text = "Selecione o perfil do usuário!";
                return;
            }

            if (txNome.Text.Trim() == string.Empty)
            {
                lbMensagem.Text = "Digite o nome do usuário!";
                return;
            }

            if (txLogin.Text.Trim() == string.Empty)
            {
                lbMensagem.Text = "Digite o login do usuário!";
                return;
            }

            if (!validaCPF(txCpf.Text))
            {
                lbMensagem.Text = "CPF digitado inválido!";
                return;
            }

            if (Session["usuarioBusca"] != null)
            {
                Usuario uSel = (Usuario)Session["usuarioBusca"];

                alteraUsuario(uSel);
 
                return;
            }


            lbMensagem.Text = string.Empty;

           

            if (Usuario.lista != null)
            {
                foreach (Usuario usu in Usuario.lista)
                {
                    if (txLogin.Text == usu.login)
                    {
                        lbMensagem.Text = "Login digitado já cadastrado!";
                        return;
                    }

                    if (txCpf.Text == usu.cpf)
                    {
                        lbMensagem.Text = "CPF digitado já cadastrado!";
                        return;
                    }
                }
            }

            

            Usuario u = new Usuario(txLogin.Text, txCpf.Text, txNome.Text, 
                rbAdm.Checked ? 'A' : 'U',
                txCpf.Text);

            Usuario.lista.Add(u);
            Serializa.saveUsuario(Usuario.lista);

            inicializa();

            tabusers.Text = Usuario.montaTabela("Usuários Cadastrados");

            lbMensagem.Text = "Usuário cadastrado com sucesso!";           
        }

        private void alteraUsuario(Usuario u)
        {

            u.nome = txNome.Text;
            u.login = txLogin.Text;

            u.perfil = rbAdm.Checked ? 'A' : 'U';

            Serializa.saveUsuario(Usuario.lista);

            tabusers.Text = Usuario.montaTabela("Usuários Cadastrados");

            lbMensagem.Text = "Usuário alterado com sucesso!";
        }

        public bool validaCPF(string cpf)
        {
            int[] multiplicador1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string tempCpf;
            string digito;
            int soma;
            int resto;

            cpf = cpf.Trim();
            cpf = cpf.Replace(".", "").Replace("-", "").Replace("/", "").Replace("-", " ");

            if (cpf.Length != 11)
                return false;

            tempCpf = cpf.Substring(0, 9);
            soma = 0;

            for (int i = 0; i < 9; i++)
            {
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador1[i];
            }

            resto = soma % 11;

            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = resto.ToString();

            tempCpf = tempCpf + digito;

            soma = 0;

            for (int i = 0; i < 10; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador2[i];

            resto = soma % 11;

            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cpf.EndsWith(digito);
        }

        protected void btBuscaId_Click(object sender, EventArgs e)
        {
             if (txIdBusca.Text.Trim() == String.Empty)
            {
                lbMensagem.Text = "Digite um id de usuário para busca!";
                return;
            }

            int id = 0;

            if (!Int32.TryParse(txIdBusca.Text,out id))
            {
                lbMensagem.Text = "Número digitado inválido!";
                return;
            }

            Usuario uBusca = new Usuario(id);

            Usuario.lista.Sort();

            int a = Usuario.lista.BinarySearch(uBusca);

            if (a >= 0)
            {
                Usuario u = Usuario.lista[a];
                txCpf.ReadOnly = true;
                Session["usuarioBusca"] = u;
                lbMensagem.Text = "Usuário encontrado";
                mostra(u);
                inicializa();
                return;
            }           

            lbMensagem.Text = String.Concat("Usuário id " , id , " não encontrado!");

        }

        private void mostra(Usuario u)
        {
            txNome.Text = u.nome;
            txLogin.Text = u.login;
            txCpf.Text = u.cpf;
            rbAdm.Checked = u.perfil == 'A';
            rbUsu.Checked = u.perfil == 'U';

            txIdBusca.Text = u.id.ToString("D4");
        }       

        protected void btLimpar_Click(object sender, EventArgs e)
        {
            lbMensagem.Text = 
            txIdBusca.Text =
            txNome.Text =
            txLogin.Text =
            txCpf.Text = String.Empty;

            rbAdm.Checked =
            rbUsu.Checked = false;            

            Session["usuarioBusca"] = null;

            inicializa();
            
        }

        protected void btExclui_Click(object sender, EventArgs e)
        {
            if (Session["usuarioBusca"] == null)
            {
                return;
            }

            Usuario uBusca = (Usuario)Session["usuarioBusca"];

            Usuario.lista.Remove(uBusca);

            Serializa.saveUsuario(Usuario.lista);

            tabusers.Text = Usuario.montaTabela("Usuários Cadastrados");

            lbMensagem.Text = "Usuário excluido com sucesso!";
        }

        protected void btInicializaSenha_Click(object sender, EventArgs e)
        {            
            if (Session["usuarioBusca"] == null)
            {
                return;
            }

            Usuario u = (Usuario)Session["usuarioBusca"];
            u.password = u.cpf;
            Serializa.saveUsuario(Usuario.lista);
            tabusers.Text = Usuario.montaTabela("Usuários Cadastrados");
            lbMensagem.Text = "Senha reiniciada com sucesso!";

        }
    }
}