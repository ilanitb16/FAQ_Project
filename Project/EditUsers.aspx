<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="EditUsers.aspx.cs" Inherits="EditUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
   <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div style="display:block;text-align:center">
        <h2 style="text-align:center;font-family:gentle;color:white;font-size:50px;margin-top:0">User Information</h2>
    </div>

    <div>
         <asp:Repeater ID="rptUsers" runat="server">  
            <HeaderTemplate> 
              
                <table class="table" style="width:100%;color:grey;text-align:center;margin-top:0">  
                    <tr class="row" style="background-color: #d04f4f; color:white; font-size: large; font-weight: bold;">  
                        <td class="tdStyle"><b>Name</b></td>  
                        <td class="tdStyle"><b>Last Name</b></td>  
                        <td class="tdStyle"><b>Username</b></td>
                        <td class="tdStyle"><b>Email</b></td>
                        <td class="tdStyle"><b>Admin</b></td>
                        <td class="tdStyle">Delete</td>
                        <td class="tdStyle">Edit</td>
                    </tr>  
            </HeaderTemplate> 
            
            <ItemTemplate>  
                <tr class="row" id="row<%# Container.ItemIndex %>" style="background-color:#EBEFF0">  
                    <td class="tdStyle"><asp:Label CssClass="label-name" ID="Name1" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true"/></td>  
                    <td class="tdStyle"><asp:Label CssClass="label-lname" ID="LastName1" runat="server" Text='<%#Eval("Last Name") %>' Font-Bold="true"/></td>  
                    <td class="tdStyle"><asp:Label CssClass="label-username" ID="Username1" runat="server" Text='<%#Eval("Username") %>' Font-Bold="true"/></td>
                    <td class="tdStyle"><asp:Label CssClass="label-email" ID="Email1" runat="server" Text='<%#Eval("Email") %>' Font-Bold="true"/></td> 
                    <td class="tdStyle"><asp:Label CssClass="label-admin" ID="Label1" runat="server" Text='<%#Eval("Admin") %>' Font-Bold="true"/></td> 
                    <td class="tdStyle">
                        <asp:Button id="Button2"
                            Text="Delete"
                            CommandName="delete"
                            CommandArgument='<%#Eval("Id") %>'
                            OnCommand="DeleteBtn_Click" 
                            OnClientClick="return confirmDelete(event)"
                            runat="server"
                            class="button"
                            style="background-color:darkred;font-family:Poppins"
                        />
                    <td class="tdStyle">
                        <input type="button" class="button" onclick="showEdit(<%# Container.ItemIndex %>)" style="font-family:Poppins;background-color:#fa6969" value="Edit"/>
                        <input type="hidden" class="label-userid" value='<%#Eval("Id") %>' />
                    </td>
                </tr>   
            </ItemTemplate> 

            <FooterTemplate>  
                </table>

                <asp:Label ID="defaultItem" runat="server" Visible='<%# rptUsers.Items.Count == 0 %>' Text="No items found" />
            </FooterTemplate>
          
                
        </asp:Repeater>  
        </div>
     <div id="divFade" onclick="closeEdit()" style="position:absolute;left:0;top:0;background-color:black;opacity:0.5;display:none;z-index:2;height:1000px;width:2000px"></div>

    <div id="divEdit" style="display:none;z-index:50;position:absolute;background-color:#f2f2f2;border-radius:5px;width:500px;height:350px">
        <div style="display:block;text-align:center">
            <h2 style="text-align:center;font-family:gentle;color:black;font-size:50px;margin-top:0">Edit User</h2>
        </div>

        <table style="font-size:20px;margin-top:0">
            <tr>
                <td class="caption1"><span class="label1">Name</span></td>
                <td class="field1"><input class="input1" placeholder="Enetr Name" type="text" id="name" name="name" required/></td>
            </tr>
            <tr>
                <td class="caption1"><span class="label1">Last Name</span></td>
                <td class="field1"><input class="input1" placeholder="Enter Last Name" type="text" id="lastname" name="lastname" required /></td>
            </tr>
            <tr>
                <td class="caption1"><span class="label1">Email</span></td>
                <td class="field1"><input class="input1" placeholder="Enter Email" type="text" id="email" name="email" required /></td>
            </tr>
            <tr>
                <td class="caption1"><span class="label1">Admin</span></td>
                <td style="text-align:left; padding-left:60px"><input type="checkbox" id="chkAdmin" name="admin" /></td>
            </tr>
        </table>
        <div class="buttons">
            <input type="hidden" name="userid" id="userid" />
        <input class="button" type="reset" id="reset1" name="resetpage" style="background-color:darkred">
            <asp:Button id="SubmitButton"
                Text="submit"
                OnClientClick="return checkFields(event)"
                runat="server"
                class="button"
                OnCommand="SubmitBtn_Click"
                CommandArgument='<%#Eval("Id") %>'
            />
        </div> 
    </div>
   

    <script>
        function confirmDelete(evt) {  //הפעולה שולחת התראה כדי שהמשתמש ידע בוודאות שהוא מוחק משתמש
            if (confirm("Are you sure?"))
                return true;
            else {
                event.preventDefault();
                return false;
            }
        }
        function showEdit(index) { //הפעולה יוצרת פופ אפ שבו מופיע מסך המאפשר לערוך את המשתמשים
            var row = document.getElementById("row" + index);
            document.getElementById("name").value = row.querySelector(".label-name").innerText;
            document.getElementById("lastname").value = row.querySelector(".label-lname").innerText;
            document.getElementById("email").value = row.querySelector(".label-email").innerText;
            document.getElementById("userid").value = row.querySelector(".label-userid").value;

            var admin = row.querySelector(".label-admin").innerText.toLowerCase();

            if (admin == 'true') {
                document.getElementById("chkAdmin").checked = true;
            }
            else {
                document.getElementById("chkAdmin").checked = false;
            }

            document.getElementById("divFade").style.display = 'block';
            var div = document.getElementById("divEdit");
            div.style.left = (document.body.clientWidth - 600) / 2 + "px";
            div.style.top = (window.innerHeight - 350) / 2 + "px";
            div.style.display = 'block';
        }
        function closeEdit() { //הפעולה סוגרת את הפופ אפ
            document.getElementById("divFade").style.display = 'none';
            document.getElementById("divEdit").style.display = 'none';
        }
        function checkFields(event) { //הפעולה בודקת האם השדות שהוזנו הינם תקינים ועומדים בדרישות
            if (document.getElementById("name").value == "") {
                alert("ENTER YOUR NAME!")
                event.preventDefault();
                return false;
            }
            if (document.getElementById("lastname").value.trim() == "") {
                alert("ENTER YOUR LAST NAME!")
                event.preventDefault();
                return false;
            }
            if (document.getElementById("email").value.trim() == "") {
                alert("ENTER YOUR EMAIL ADDRESS!")
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
            else {
                return true;
            }
        }
    </script>
</asp:Content>

