<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

    <div class="login">
        <div class="login-title">LOGIN</div>
        <div class="login-inner">

            <table>
            <tr>
                <td class="caption"><span class="label">Username</span></td>
                <td class="field"><input class="input" placeholder="Enter Username" type="text" id="user" name="user" /></td>
            </tr>
            <tr>
                <td class="caption"><span class="label">Password</span></td>
                <td class="field"><input class="input" placeholder="Enter Password" type="password" id="pass" name="password" /></td>
            </tr>
        </table>

        </div>
        <div class="buttons">
            <input class="button" type="reset" style="background-color:black" id="reset1" name="resetpage">
            <input class="button" type="submit" style="background-color:black"  id="submit1" name="submit"/>
                <%=msg %>
        </div>
        
    </div>

</asp:Content>

