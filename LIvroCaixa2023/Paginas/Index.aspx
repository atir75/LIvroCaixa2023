<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="LivroCaixa2023.Paginas.Index" %>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

 
    <table style="width:1430px">
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="lbTitulo" runat="server" style="font-size:x-large; position:center; font-family: Calibri" /> 
            </td>
             
        </tr>
        <tr>
            <td  colspan="2">
                <hr />
            </td>
        </tr>

        <tr>
            <td tyle="width:2000px;" style="text-align:center">
                &nbsp;&nbsp;<asp:Label ID="lbLogin" runat="server" style="font-size:x-large; font-family: Calibri"/> 
                 &nbsp; <asp:TextBox ID="txLogin" runat="server" style="width:200px" />
            </td>
        </tr>
        <tr>
            <td tyle="width:2000px;" style="text-align:center">
                 &nbsp;&nbsp;<asp:Label ID="lbSenha" runat="server" style="font-size:x-large; font-family: Calibri"/> 
                &nbsp; <asp:TextBox ID="txSenha" runat="server" style="width:200px" TextMode="Password"/>
            </td>
        </tr>

        <tr>
            <td  colspan="2">
                <hr />
            </td>
        </tr>

        <tr>
            <td  colspan="2" style="text-align:center">
                <asp:Button ID="btOk" runat="server" Text="         OK         " OnClick="btOk_Click" style="font-size:medium; font-family: Calibri; border-radius: 20px; background: linear-gradient(225deg, #ff82ec 0, #e46ee4 25%, #be55d8 50%, #953ecc 75%, #6b32c5 100%)"/>
            </td>
        </tr>
       
        <tr>
            <td  colspan="2">
                <hr />
            </td>
        </tr>

         <tr>
            <td  colspan="2" style="text-align:center">
                 <asp:Label ID="lbMensagem" runat="server" style="font-size:x-large; font-family: Calibri; position: center"/> 
            </td>
        </tr>

    </table>
   

</asp:Content>
