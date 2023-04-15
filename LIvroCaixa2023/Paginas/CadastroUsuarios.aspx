<%@ Page Title="Cadastro de Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroUsuarios.aspx.cs" Inherits="LIvroCaixa2023.Paginas.CadastroUuarios" %>
 
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <table width='700px'>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Label ID="lbTitulo" runat="server" Style="font-size: x-large" />
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>

        <tr>
            <td style="width: 200px;">&nbsp;&nbsp;<asp:Label ID="lbNome" runat="server" Style="font-size: large" />
            </td>
            <td>&nbsp;
                <asp:TextBox ID="txNome" runat="server" Style="width: 200px" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;<asp:Label ID="lbLogin" runat="server" Style="font-size: large" />
            </td>
            <td>&nbsp;
                <asp:TextBox ID="txLogin" runat="server" Style="width: 200px" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;<asp:Label ID="lbCpf" runat="server" Style="font-size: large" />
            </td>
            <td>&nbsp;
                <asp:TextBox ID="txCpf" runat="server" Style="width: 200px" />
            </td>
        </tr>
        <tr>
            <td style="width: 200px;">&nbsp;&nbsp;<asp:Label ID="lbPerfil" runat="server" Style="font-size: large" />
            </td>
            <td>
                <table width="300px">
                    <tr>
                        <td>&nbsp;&nbsp;<asp:Label ID="lbAdm" runat="server" Style="font-size: large" />
                        </td>
                        <td>
                            <asp:RadioButton ID="rbAdm" runat="server" GroupName="perfil" />
                        </td>

                        <td>&nbsp;&nbsp;<asp:Label ID="lbUsu" runat="server" Style="font-size: large" />
                        </td>
                        <td>
                            <asp:RadioButton ID="rbUsu" runat="server" GroupName="perfil" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="btOk" runat="server" Text="OK" Width='70px' OnClick="btOk_Click" />&nbsp;&nbsp;
                  <asp:Button ID="btExclui" runat="server" Text="Excluir" Width='70px' OnClick="btExclui_Click"  />&nbsp;&nbsp;
                 <asp:Button ID="btInicializaSenha" runat="server" Text="Inicializa Senha" Width='130px' OnClick="btInicializaSenha_Click"  />&nbsp;&nbsp; 
                <asp:Button ID="btLimpar" runat="server" Text="Limpar" Width='70px' OnClick="btLimpar_Click"  />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <table>
                    <tr>
                        <td>
                            &nbsp;&nbsp;<asp:Label ID="lbBuscaPorId" runat="server" Style="font-size: large" />&nbsp;&nbsp; 
                        </td>
                        <td>
                            <asp:TextBox ID="txIdBusca" runat="server" Width="40px" MaxLength="5" /> 
                        </td>
                        <td>
                            <asp:Button ID="btBuscaId" runat="server" Text=" Busca " width="70px" OnClick="btBuscaId_Click"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lbMensagem" runat="server" Style="font-size: x-large" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:Literal ID="tabusers" runat="server" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>


    </table>

</asp:Content>
