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
            <td tyle="width:200px;">
                &nbsp;&nbsp;<asp:Label ID="lbLogin" runat="server" style="font-size:x-large"/> 
                 &nbsp; <asp:TextBox ID="txLogin" runat="server" style="width:200px" />
            </td>
        </tr>
        <tr>
            <td tyle="width:200px;">
                 &nbsp;&nbsp;<asp:Label ID="lbSenha" runat="server" style="font-size:x-large"/> 
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
                <asp:Button ID="btOk" runat="server" Text="   OK   " OnClick="btOk_Click" />
            </td>
        </tr>
       
        <tr>
            <td  colspan="2">
                <hr />
            </td>
        </tr>

         <tr>
            <td  colspan="2" style="text-align:center">
                 <asp:Label ID="lbMensagem" runat="server" style="font-size:x-large"/> 
            </td>
        </tr>

    </table>
   

</asp:Content>
