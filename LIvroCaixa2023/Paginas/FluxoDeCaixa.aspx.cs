using LivroCaixa2023;
using LivroCaixa2023.Classes;
using LivroCaixa2023.Tabelas;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LIvroCaixa2023.Paginas
{
    public partial class FluxoDeCaixa : System.Web.UI.Page
    {

        private LivroCaixa livroCaixa = new LivroCaixa();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("index.aspx", false);
                return;
            }
   
            if (LivroCaixa.lancamentos != null && LivroCaixa.lancamentos.Count == 0)
            {
                LivroCaixa.lancamentos = Serializa.loadLancamento();
                if (LivroCaixa.lancamentos != null && LivroCaixa.lancamentos.Count > 0)
                {
                    LivroCaixa.lancamentos.Sort();
                    Lancamento.idRaiz = 
                        LivroCaixa.lancamentos[LivroCaixa.lancamentos.Count - 1].idLancamento+1;
                } 
                else
                {
                    LivroCaixa.lancamentos = new List<Lancamento>();
                }
            }

            tabLancamentos.Text = LivroCaixa.montaTabela("Lançamentos");

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
            lbCredito.Text = "Crédito";
            lbDebito.Text = "Débito";
            lbData.Text = "Data";
            lbDescricao.Text = "Descrição";
            lbValor.Text = "Valor";
            lbTipo.Text = "Tipo";
            btOk.Text = "OK";
        }

        protected void btOk_Click(object sender, EventArgs e)
        {

            if (Session["usuario"] != null)
            {
                Usuario uSel = (Usuario)Session["usuarioBusca"];

                mensagem.Text = "";
                String descricao = txDescricao.Text;
                String valor = txValor.Text;
                String data = txData.Text;
                mensagem.Text = ValidaFormulario(descricao, valor, data, rbCredito.Checked, rbDebito.Checked);
                Console.WriteLine(mensagem.Text);
                if (mensagem.Text == "")
                {
                    Lancamento lancamento = new Lancamento(descricao, 1, double.Parse(valor), rbCredito.Checked ? 'C' : 'D', uSel, DateTime.Parse(data));
                    LivroCaixa.add(lancamento);
                    Serializa.saveLancamento(LivroCaixa.lancamentos);
                    txDescricao.Text = "";
                    txValor.Text = "";
                    txData.Text = "";
                    inicializa();
                    tabLancamentos.Text = LivroCaixa.montaTabela("Lancamento Cadastrado");
                    mensagem.Text = "Lancamento cadastrado com sucesso";
                }
            }
        }

        // Validar todas as entradas
        // Instanciar um lançamento
        // Inserir o novo lancamento na lista de lançamentos
        // Mostrar a tabela de lançamentos atualizada
        // Salvar via serialização a lista nova
        private String ValidaFormulario(String descricao, String valor, String data, bool creditChecked, bool debitChecked)
        {
            String erroMessage = "";
            if (descricao.Replace(" ", "") == String.Empty) erroMessage += "Descrição é obrigatório.    ";
            if (creditChecked == false && debitChecked == false) erroMessage += "Campo de crédito ou débito deve ser marcado.    ";
            if (debitChecked)
            {
                try
                {
                    if (!LivroCaixa.temSaldoParaDebito(double.Parse(valor))) erroMessage += "O valor do débito não pode ser maior que o saldo.    ";
                }catch (Exception ex) { }
            }
            try
            {
                double.Parse(valor);
                if (double.Parse(valor) <= 0) erroMessage += "O valor deve ser maior que zero.   ";
            }
            catch (Exception ex)
            {
                erroMessage += "Valor deve ser numerico. \n";
            }
            try
            {
                DateTime.Parse(data);
                if(DateTime.Parse(data).CompareTo(DateTime.Now) > 0)
                {
                    erroMessage += "A data deve ser posterior ou igual ao dia atual.    ";
                }
            }catch(Exception ex)
            {
                erroMessage += "Data deve ser válida.    ";
            }
            return erroMessage;
        }
    }
}