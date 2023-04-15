<%@ Page Title="Cadastro de Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroUsuarios.aspx.cs" Inherits="LIvroCaixa2023.Paginas.CadastroUuarios" %>
 
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <table width='1400px'>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Label ID="lbTitulo" runat="server" Style="font-size: x-large; font-weight: bold; margin-left: 60px;width: 1300px" />
            </td>

        </tr>
        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>

        <tr style="width=2000px">
            <td>&nbsp;&nbsp;
                <asp:Label ID="lbNome" runat="server" Style="font-size: large; font-weight: bold; padding-left: 600px" />&nbsp; 
                &nbsp;<asp:TextBox ID="txNome" runat="server" Width="200px" style="margin-left: 610px"/>
            </td>
        </tr>

        <tr>
            <td>&nbsp;&nbsp;
                <asp:Label ID="lbLogin" runat="server" Style="font-size: large; font-weight: bold; padding-left: 600px"/>
                    <asp:TextBox ID="txLogin" runat="server" Width="200px" style="margin-left: 610px" />
            </td>
        </tr>

        <tr>
            <td>&nbsp;&nbsp;<asp:Label ID="lbCpf" runat="server" Style="font-size: large; font-weight: bold; padding-left: 600px" />
                <asp:TextBox ID="txCpf" runat="server" Width="200px" style="margin-left: 610px" />
            </td>
        </tr>


        <tr>
            <td style="width: 20px;">&nbsp;&nbsp;<asp:Label ID="lbPerfil" runat="server" Style="font-size: large; margin-left: 600px" />
            </td>
            <td>
                <table width="30px">
                    <tr>
                        <td>&nbsp;&nbsp;<asp:Label ID="lbAdm" runat="server" Style="font-size: large; margin-left: -100px" />
                        </td>
                        <td>
                            <asp:RadioButton ID="rbAdm" runat="server" GroupName="perfil" style="margin-left: -50px"/>
                        </td>

                        <td>&nbsp;&nbsp;<asp:Label ID="lbUsu" runat="server" Style="font-size: large; margin-left: -40px" />
                        </td>
                        <td>
                            <asp:RadioButton ID="rbUsu" runat="server" GroupName="perfil"  />
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
                <asp:Button ID="btOk" runat="server" Text="OK" Width='70px' OnClick="btOk_Click" style="font-size:medium; font-family: Calibri; border-radius: 20px; background: linear-gradient(225deg, #ff82ec 0, #e46ee4 25%, #be55d8 50%, #953ecc 75%, #6b32c5 100%); color: black; font-family: Calibri"/>&nbsp;&nbsp;
                  <asp:Button ID="btExclui" runat="server" Text="Excluir" Width='70px' OnClick="btExclui_Click" style="font-size:medium; font-family: Calibri; border-radius: 20px; background: linear-gradient(225deg, #ff82ec 0, #e46ee4 25%, #be55d8 50%, #953ecc 75%, #6b32c5 100%); color: black; font-family: Calibri" />&nbsp;&nbsp;
                 <asp:Button ID="btInicializaSenha" runat="server" Text="Inicializa Senha" Width='130px' OnClick="btInicializaSenha_Click" style="font-size:medium; font-family: Calibri; border-radius: 20px; background: linear-gradient(225deg, #ff82ec 0, #e46ee4 25%, #be55d8 50%, #953ecc 75%, #6b32c5 100%); color: black; font-family: Calibri" />&nbsp;&nbsp; 
                <asp:Button ID="btLimpar" runat="server" Text="Limpar" Width='70px' OnClick="btLimpar_Click" style="font-size:medium; font-family: Calibri; border-radius: 20px; background: linear-gradient(225deg, #ff82ec 0, #e46ee4 25%, #be55d8 50%, #953ecc 75%, #6b32c5 100%); color: black; font-family: Calibri" />
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
                            &nbsp;&nbsp;<asp:Label ID="lbBuscaPorId" runat="server" Style="font-size: large; font-weight: bold; padding-left: 560px" />&nbsp;&nbsp; 
                        </td>
                        <td>
                            <asp:TextBox ID="txIdBusca" runat="server" Width="40px" MaxLength="5" /> 
                        </td>
                        <td>
                            <asp:Button ID="btBuscaId" runat="server" Text=" Busca " width="70px" OnClick="btBuscaId_Click" style="font-size:medium; font-family: Calibri; border-radius: 20px; background: linear-gradient(225deg, #ff82ec 0, #e46ee4 25%, #be55d8 50%, #953ecc 75%, #6b32c5 100%); color: black; font-family: Calibri" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td colspan="2">
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="lbMensagem" runat="server" Style="font-size: x-large; position: center;" />
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <hr />
            </td>
        </tr>

        <tr style="position: center">
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
