<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background:url(images/bg2.png) repeat,url(images/aaa.jpg) no-repeat">
    
      <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <form id="form1" runat="server">
               
        <div class="Msg">
            <h1>Welcome To The Project!</h1>
        </div>

        <table class="smenu">
            <tr class="link" font-weight: bold;">  
                <td style="border-bottom:none"><b><a  href="PrivacyPolicy.aspx">Policy</a></b></td>  
                <td style="border-bottom:none"><b><a  href="About.aspx">About</a></b></td>  
                <td style="border-bottom:none"><b><a  href="Login.aspx">Login</a></b></td>
            </tr> 
        </table>

        <div class ="start_button"> 
            <a href="Register.aspx">GET STARTED</a>
        </div>

    </form>
</body>
</html>

