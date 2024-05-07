<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <script>
            function checkData(evt) {  //הפונקציה משמשת לבדיקת כל הנתונים בדף הרגיסטרציה ומניעת הכנסת משמתש אם הנתונים שהוזנו לא מתאימים לדרישות

                var password1 = document.getElementById("password1").value;
                var password2 = document.getElementById("password2").value;

                if (document.getElementById("name").value == "" || document.getElementById("name").value == null) {
                    alert("ENTER YOUR NAME!");
                    document.getElementById("name").style.backgroundColor = "red"
                    event.preventDefault();
                    return false;
                }
                if (document.getElementById("lastname").value.trim() == "") {
                    alert("ENTER YOUR LAST NAME!")
                    document.getElementById("lastname").style.backgroundColor="red"
                    event.preventDefault();
                    return false;
                }

                if (document.getElementById("user").value.trim() == "") {
                    alert("ENTER YOUR USERNAME!")
                    document.getElementById("user").style.backgroundColor="red"
                    event.preventDefault();
                    return false;
                }
                if (document.getElementById("email").value.trim() == "") {
                    alert("ENTER YOUR EMAIL ADDRESS!")
                    document.getElementById("email").style.backgroundColor="red"
                    event.preventDefault();
                    return false;
                }
                if (document.getElementById("email").value.indexOf('@') < 0) {
                    alert("EMAIL ADDRESS MUST ENCLUDE @")
                    document.getElementById("email").style.borderColor = "red"
                    event.preventDefault();
                    return false;
                }
                if (document.getElementById("email").value.indexOf('.') < 0) {
                    alert("EMAIL ADDRESS MUST ENCLUDE .")
                    document.getElementById("email").style.borderColor = "red"
                    event.preventDefault();
                    return false;
                }
                if (document.getElementById("password1").value.trim() == "") {
                    alert("ENTER YOUR PASSWORD!")
                    document.getElementById("password1").style.backgroundColor="red"
                    event.preventDefault();
                    return false;
                }
                if (document.getElementById("password2").value.trim() == "") {
                    alert("ENTER YOUR PASSWORD!")
                    document.getElementById("password2").style.backgroundColor = "red"
                    event.preventDefault();
                    return false;
                }
                if (password1 != password2) {
                    alert("PASSWORDS DON'T MATCH");
                    password1.style.color = "red";
                    password2.style.color = "red";
                    event.preventDefault();
                    return false;
                }
                if (document.getElementById("check").checked == false) {
                    alert("READ THE TERMS OF USE!")
                    event.preventDefault();
                    return false;
                }
                return true;
            }
    </script>
    <style>
        input[type="checkbox" i] { 
            margin-right:0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="register">
        <div class="register-title">SIGN UP</div>
        <div class="register-inner">
            <table>
                <tr>
                    <td class="caption1"><span class="label1">Name</span></td>
                    <td class="field1"><input class="input1" placeholder="Enetr Name" type="text" id="name" name="name" required/></td>
                </tr>
                <tr>
                    <td class="caption1"><span class="label1">Last Name</span></td>
                    <td class="field1"><input class="input1" placeholder="Enter Last Name" type="text" id="lastname" name="lastname" required /></td>
                </tr>
                <tr>
                    <td class="caption1"><span class="label1">Username</span></td>
                    <td class="field1"><input class="input1" placeholder="Enter Username" type="text" id="user" name="user" required /></td>
                </tr>
                <tr>
                    <td class="caption1"><span class="label1">Email</span></td>
                    <td class="field1"><input class="input1" placeholder="Enter Email" type="text" id="email" name="email" required /></td>
                </tr>
                <tr>
                    <td class="caption1"><span class="label1">Password</span></td>
                    <td class="field"><input class="input1" placeholder="Enter Password" type="password" id="password1" name="password1" required /></td>
                </tr>
                <tr>
                    <td class="caption1"><span class="label1">Password</span></td>
                    <td class="field"><input class="input1" placeholder="Enter Password" type="password" id="password2" name="password2" required /></td>
                </tr>
                <tr>
                    <td style="color:#666;text-align:left;font-family:Poppins;" colspan="2">
                        <input class="input1" style="width:15px;margin-left:0" type="checkbox" id="check" name="check" required />
                       <b><span>I HAVE READ THE TERMS OF USE</span></b> 
                    </td>
                </tr>
            </table>
        </div>
        <div class="buttons">
             <p>By creating an account you agree to our <a style="color:black;" href="PrivacyPolicy.aspx">Terms & Privacy Policy</a></p>
            <input class="button" style="background-color:black" type="reset" id="reset1" name="resetpage">
                         <asp:Button id="Submit1"
                            Text="Submit"
                            OnClientClick="return checkData(event)"
                            runat="server"
                            class="button"
                            style="background-color:black"
              />
        </div> 
        <div class="container-signin">
            <p>Already have an account? <a style="color:black" href="Login.aspx">Sign in.</a></p>
                        <%=Message %>
        </div>
    </div>

            
</asp:Content>

