<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style>

@font-face {
font-family: poppins;
src: url(fonts/poppins-thin.otf)
}        
.input[type=text], select, textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing:border-box;
}
.label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}
.input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.input[type=submit]:hover {
    background-color: #24b7c5;
}
.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    width: 600px;
    font-family: Poppins;
    top:150px;
    display:none;
    height:350px;
    position:absolute;
    z-index:10;
}
.title {
    float: left;
    width: 25%;
    margin-top: 6px;
}
.button1 {
    width: 100%;
    margin-top: 6px;
}
.row:hover{
    background-color:red;

}
.errMsg {
    color:black;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="divFade" onclick="closeQuestion()" style="display:none;position:absolute;background-color:black;opacity:0.5;display:none;z-index:2;height:1000px;width:2000px"></div>
    <div style="text-align:center">
        <h2 style="text-align:center;font-family:gentle;color:white;font-size:50px;margin-top:0;margin-bottom:0">My Questions</h2>
    </div>

        <asp:Repeater ID="RepterDetails" runat="server" OnItemDataBound="Repeater_ItemDataBound">  

            <HeaderTemplate> 

                <table class="table" style="width:70%;text-align:center;display:inline-block;margin-top:0;vertical-align:top;color:grey;">  
                    <tr class="row" style="background-color:black; color:white; font-size: large; font-weight: bold;">  
                        <td class="tdStyle"><b>Question</b></td>  
                        <td class="tdStyle"><b>Category</b></td>  
                        <td class="tdStyle"><b>Status</b></td>
                        <td class="tdStyle"><b>Submited Answers</b></td>
                    </tr>  
            </HeaderTemplate> 
            
            <ItemTemplate>  
                <tr class="row" style="background-color:#EBEFF0">  
                    <td class="tdStyle"><asp:Label ID="Text" runat="server" Text='<%#Eval("Text") %>' Font-Bold="true"/></td>  
                    <td class="tdStyle"><asp:Label ID="Label1" runat="server" Text='<%#Eval("Category") %>' Font-Bold="true"/></td>  
                    <td class="tdStyle"><asp:Label ID="Label2" runat="server" Text='<%#Eval("Status") %>' Font-Bold="true"/></td>
                    <td class="tdStyle">
                      <asp:Button
                        id="GetAnswer"
                        Text='<%#Eval("Count") %>' 
                        runat="server" 
                        CssClass="button"
                        style="background-color:black"
                        OnCommand="GetAnswer_Click" 
                        CommandArgument='<%#Eval("Id") %>' />
                    </td>
                    
            </ItemTemplate> 
            
            <FooterTemplate>  
                <tr><td colspan="4"><asp:Label ID="lblErrorMsg" runat="server" CssClass="errMsg" Text="Sorry, no item is there to show." Visible="false"></asp:Label></td></tr>
                </table>         
                
            </FooterTemplate> 
            
        </asp:Repeater> 

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
        </table>
    </div>

    <% if (showAnswers)
        { %>
        <div id="divLock" onclick="closeAnswers()" style="display:none;position:absolute;left:0;top:0;background-color:black;opacity:0.5;display:none;z-index:2;height:1000px;width:2000px"></div>
        <div id="divAnswerList" style="z-index:50;position:absolute;background-color:#f2f2f2;border-radius:5px;width:600px;height:350px">
            <div style="display:block;text-align:center">
            <h2 style="text-align:center;font-family:gentle;color:black;font-size:50px;margin-top:0;margin-bottom:0">Answer List</h2>
            </div>
           <div style="height:200px;overflow-y:scroll">
            <asp:Repeater ID="rptAnswers" runat="server">  

            <HeaderTemplate> 

                <table class="table" style="width:100%;text-align:center;color:grey;padding: 0 0 0 0">  
                    <tr class="row" style="background-color:black; color:white; font-size: large; font-weight: bold;">  
                        <td class="tdStyle"><b>Answer</b></td>  
        
                    </tr>  
            </HeaderTemplate> 
            
            <ItemTemplate>  
                <tr class="row" style="background-color:#EBEFF0;width:100%">  
                    <td class="tdStyle"><asp:Label ID="Text" runat="server" Text='<%#Eval("AnswerText") %>' Font-Bold="true"/></td>  
         
                   </tr>
            </ItemTemplate> 
            
            <FooterTemplate>  
                </table>       
                
                
            </FooterTemplate>     
        </asp:Repeater> 
        </div>
        </div>

    <%} %>
                 <div style="display:inline-block;width:25%;vertical-align:top;margin-right:10px">

                <div style="text-align:center;margin-left:90px">
                    <h3 style=" font-family:gentle;background-color:black;border-radius:35px;height:30px;width:150px;text-align:center;padding-top:10px;">
                        <a style="color:white;text-align:center" onclick="showQuestion()">Add A Question</a>
                    </h3>
                </div>

                <div style="height:150px;text-align:center;margin-top:0;margin-left:10px;background-color:black">
                <div class="title" >
                    <label style="font-family:Poppins;color:white;font-size:25px;white-space:nowrap;text-align:center;margin-left:2px" for="Category">Plase Select Category </label>
                </div>

                    <div style="margin-top:10px">
                        <select style="font-family:poppins;" id="CategoryId" name="CategoryId">
                            <option value="0" <%=IsSelected("0") %>>All categories</option>
                            <option value="1" <%=IsSelected("1") %>>Maths</option>
                            <option value="2" <%=IsSelected("2") %>>Physics</option>
                            <option value="3" <%=IsSelected("3") %>>English</option>
                            <option value="4" <%=IsSelected("4") %>>Computer Programming</option>
                        </select>
                    </div>

                    <div style="background-size:160px; margin-top:10px">
                  <asp:Button
                        id="Button1"
                        Text="PICK"
                        runat="server" 
                        CssClass="button"
                        style="background-color:gray"
                        OnCommand="GetSubj_Click" 
                        CommandArgument='<%#Eval("Id") %>' />

<%--                        <input class=button style="background-color:gray" type="submit" value="PICK">--%>
                    </div>
                </div>
                </div>

  
        <div id="divQuestion" class="container">
  <div class="container2">
    <div class="title">
      <label for="Category" style="text-align:left;display:block">Subject</label>
    </div>
    <div class="button1">
      <select style="font-family:poppins;" id="Category" name="Category">
        <option value="1">Maths</option>
        <option value="2">Physics</option>
        <option value="3">English</option>
        <option value="4">Computer Programming</option>
      </select>
    </div>
  </div>
  <div class="container2">
    <div class="title">
      <label for="Text" style="text-align:left;display:block">Enter Text</label>
    </div>
    <div class="button1">
      <textarea id="text" name="text" placeholder="Write something.." style="height:200px"></textarea>
    </div>
  </div>
  <div class="container2" style="margin-top:0px;text-align:center">
    <asp:Button id="btnAskQuestion" CssClass="button" runat="server" text="SUBMIT" value="Submit" OnCommand="btnAskQuestion_Click" />
  </div>
</div>


    <script>
        function showQuestion() { //הפעולה יוצרת התראה ובה ניתן להזין שאלה
            document.getElementById("divFade").style.display = 'block';
            var div = document.getElementById("divQuestion");
            div.style.left = (document.body.clientWidth - 600) / 2 + "px";
            div.style.top = (window.innerHeight - 350) / 2 + "px";
            div.style.display = 'block';
        }

        function closeQuestion() { //הפעולה סוגרת את ההתראה
            document.getElementById("divFade").style.display = 'none';
            document.getElementById("divQuestion").style.display = 'none';
        }

        //var CategoryId = row.querySelector("Label1").innerText.toLowerCase();

        //if (document.getElementById("1").checked == true) {
        //    CategoryId = 1;
        //}
        //if (document.getElementById("2").checked == true) {
        //    CategoryId =2;
        //}
        //if (document.getElementById("3").checked == true) {
        //    CategoryId = 3;
        //}
        //if (document.getElementById("4").checked == true) {
        //    CategoryId = 4;
        //}

        
    </script>
    <%if (showAnswers) //הפעולה יוצרת התראה ובה ניתן לצפות בתשובות 
        { %>
    <script>
        document.getElementById("divLock").style.display = "block";
        var div = document.getElementById("divAnswerList");
        div.style.left = (document.body.clientWidth - 600) / 2 + "px";
        div.style.top = (window.innerHeight - 350) / 2 + "px";
        div.style.display = 'block';

        function closeAnswers() { //הפעולה סוגרת את ההתראה
            document.getElementById("divLock").style.display = 'none';
            document.getElementById("divAnswerList").style.display = 'none';
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
    </script>

    <%} %>
</asp:Content>
