﻿<%@ Page Title="Fluxo de caixa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FluxoDeCaixa.aspx.cs" Inherits="LIvroCaixa2023.Paginas.FluxoDeCaixa" %>
 
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

        <script> 
            // Funções de formatação de campo de valor monetário)
            function formataValor(campo, evt) {
                var xPos = PosicaoCursor(campo);
                evt = getEvent(evt);
                var tecla = getKeyCode(evt);
                if (!teclaValida(tecla)) return;
                vr = campo.value = filtraNumeros(filtraCampo(campo));
                if (vr.length > 0) {
                    vr = parseFloat(vr.toString()).toString();
                    tam = vr.length;

                    if (tam == 1) campo.value = "0,0" + vr; if (tam == 2) campo.value = "0," + vr;
                    if ((tam > 2) && (tam <= 5)) campo.value = vr.substr(0, tam - 2) + ',' +
                        vr.substr(tam - 2, tam);
                    if ((tam >= 6) && (tam <= 8)) campo.value = vr.substr(0, tam - 5) +
                        '.' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
                    if ((tam >= 9) && (tam <= 11)) campo.value = vr.substr(0, tam - 8) +
                        '.' + vr.substr(tam - 8, 3) + '.' + vr.substr(tam - 5, 3) + ','
                        + vr.substr(tam - 2, tam);
                    if ((tam >= 12) && (tam <= 14)) campo.value = vr.substr(0, tam - 11)
                        + '.' + vr.substr(tam - 11, 3) + '.' + vr.substr(tam - 8, 3) + '.' +
                        vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
                    if ((tam >= 15) && (tam <= 18)) campo.value = vr.substr(0, tam - 14)
                        + '.' + vr.substr(tam - 14, 3) + '.' + vr.substr(tam - 11, 3) + '.' +
                        vr.substr(tam - 8, 3) + '.' + vr.substr(tam - 5, 3) + ',' +
                        vr.substr(tam - 2, tam);
                }
                MovimentaCursor(campo, xPos);
            }
            function PosicaoCursor(textarea) {
                var pos = 0;
                if (typeof (document.selection) != 'undefined') {
                    //IE
                    var range = document.selection.createRange();
                    var i = 0;
                    for (i = textarea.value.length; i > 0; i--) {
                        if (range.moveStart('character', 1) == 0)
                            break;
                    }
                    pos = i;
                }
                if (typeof (textarea.selectionStart) != 'undefined') {
                    //FireFox
                    pos = textarea.selectionStart;
                }

                if (pos == textarea.value.length)
                    return 0; //retorna 0 quando não precisa posicionar o elemento
                else
                    return pos; //posição do cursor
            }
            function MovimentaCursor(textarea, pos) {
                if (pos <= 0)
                    return; //se a posição for 0 não reposiciona

                if (typeof (document.selection) != 'undefined') {
                    //IE
                    var oRange = textarea.createTextRange();
                    var LENGTH = 1;
                    var STARTINDEX = pos;

                    oRange.moveStart("character", -textarea.value.length);
                    oRange.moveEnd("character", -textarea.value.length);
                    oRange.moveStart("character", pos);
                    oRange.select();
                    textarea.focus();
                }
                if (typeof (textarea.selectionStart) != 'undefined') {
                    //FireFox
                    textarea.selectionStart = pos;
                    textarea.selectionEnd = pos;
                }
            }
            function getEvent(evt) {
                if (!evt) evt = window.event; //IE
                return evt;
            }
            function getKeyCode(evt) {
                var code;
                if (typeof (evt.keyCode) == 'number')
                    code = evt.keyCode;
                else if (typeof (evt.which) == 'number')
                    code = evt.which;
                else if (typeof (evt.charCode) == 'number')
                    code = evt.charCode;
                else
                    return 0;

                return code;
            }
            function teclaValida(tecla) {
                if (tecla == 8 //backspace
                    //Esta evitando o post, quando são pressionadas estas teclas.
                    //Foi comentado pois, se for utilizado o evento texchange, é necessario o post.
                    || tecla == 9 //TAB
                    || tecla == 27 //ESC
                    || tecla == 16 //Shif TAB
                    || tecla == 45 //insert
                    || tecla == 46 //delete
                    || tecla == 35 //home
                    || tecla == 36 //end
                    || tecla == 37 //esquerda
                    || tecla == 38 //cima
                    || tecla == 39 //direita
                    || tecla == 40)//baixo
                    return false;
                else
                    return true;
            }
            function filtraNumeros(campo) {
                var s = "";
                var cp = "";
                vr = campo;
                tam = vr.length;
                for (i = 0; i < tam; i++) {
                    if (vr.substring(i, i + 1) == "0" ||
                        vr.substring(i, i + 1) == "1" ||
                        vr.substring(i, i + 1) == "2" ||
                        vr.substring(i, i + 1) == "3" ||
                        vr.substring(i, i + 1) == "4" ||
                        vr.substring(i, i + 1) == "5" ||
                        vr.substring(i, i + 1) == "6" ||
                        vr.substring(i, i + 1) == "7" ||
                        vr.substring(i, i + 1) == "8" ||
                        vr.substring(i, i + 1) == "9") {
                        s = s + vr.substring(i, i + 1);
                    }
                }
                return s;
            }
            function filtraCampo(campo) {
                var s = "";
                var cp = "";
                vr = campo.value;
                tam = vr.length;
                for (i = 0; i < tam; i++) {
                    if (vr.substring(i, i + 1) != "/"
                        && vr.substring(i, i + 1) != "-"
                        && vr.substring(i, i + 1) != "."
                        && vr.substring(i, i + 1) != "("
                        && vr.substring(i, i + 1) != ")"
                        && vr.substring(i, i + 1) != ":"
                        && vr.substring(i, i + 1) != ",") {
                        s = s + vr.substring(i, i + 1);
                    }
                }
                return s;
            }
        </script>

    <table style="width:1100px;">
        <tr>
            <td colspan="6">
                <hr />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                <asp:Label ID="lbDescricao" runat="server"  Style="font-size: large"/> 
            </td>
            <td>
                <asp:Label ID="lbValor" runat="server"  Style="font-size: large"/>
            </td>
            <td  style="width:200px">
                <asp:Label ID="lbTipo" runat="server"  Style="font-size: large"/>
            </td>
            <td>
                <asp:Label ID="lbData" runat="server"  Style="font-size: large"/>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td  style="width:420px">
                <asp:TextBox ID="txDescricao" runat="server" Width='400px' />
            </td>
            <td style="width:120px">
                <asp:TextBox ID="txValor" runat="server" Width='100px'  onkeyup='formataValor(this,event);' />
            </td>
            <td style="width:160px">
                <table>
                    <tr>                       
                        <td >
                            <asp:Label ID="lbCredito" runat="server"  Width='70px' />
                            <asp:RadioButton ID="rbCredito" runat="server"  GroupName="credit"/>
                        </td>
                        <td>
                             <asp:Label ID="lbDebito" runat="server"  Width='70px'  />
                            <asp:RadioButton ID="rbDebito" runat="server"  GroupName="credit"/>
                        </td>
                    </tr>
                </table>
            </td>
            <td  style="width:120px">
                <asp:TextBox ID="txData" runat="server" Width='100px'/>
            </td>
            <td  style="width:80px">
                <asp:Button ID="btOk" runat="server" Text="ok" Width='50px' OnClick="btOk_Click" />
            </td>
        </tr>
        <tr>
            <td  colspan="6">
                <asp:Literal ID="mensagem" runat="server"/> 
            </td>
        </tr>
         <tr>
            <td colspan="6">
                <hr />
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                &nbsp;
            </td>
            <td  colspan="5" >
                <asp:Literal ID="tabLancamentos" runat="server"/> 
            </td>
        </tr>
         <tr>
            <td colspan="6">
                <hr />
            </td>
        </tr>
    </table>
</asp:Content>
