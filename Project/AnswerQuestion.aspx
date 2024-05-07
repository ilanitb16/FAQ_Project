<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="AnswerQuestion.aspx.cs" Inherits="AnswerQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
           <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
.input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

label {
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


.container3 {
    border-radius: 5px;
    font-family: Poppins;
    top:0;
    z-index:10;
    display:inline-block;
    vertical-align:top;
    background-color:#36304a;
    color:white;
    width:100%
}

.title {
    
    width: 100%;
    margin-top: 6px;
    text-align:center;
}

.button1 {
    margin-top: 6px;
    font-size:20px;
    width:100%;
}
.table2{
    /*background: #d1d1d1;*/
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
    border-collapse: collapse;
    border-bottom: solid,#808080;
    border-spacing: 2px;
    font-family: poppins;
    width:40%;
    color:grey;
    position:relative;
    display:inline-block;
    vertical-align:top;
    margin-left:10px
}
    </style>

    <div style="text-align:center">
        <h2 style="text-align:center;font-family:gentle;color:white;font-size:50px;margin-top:0">Questions List</h2>
    </div>

      <div style="background-color:#36304a;border-radius:5px;height:180px;width:25%;text-align:center;display:inline-block;margin-top:0;vertical-align:top;margin-left:0;">
            <div class="title" >
              <label style="font-family:Poppins;color:white;font-size:25px;white-space:nowrap;text-align:center" for="Category">Plase Select Category </label>
            </div>
          
            <div>
                <select style="font-family:poppins;" id="Category" name="Category">
                    <option value="1">Maths</option>
                    <option value="2">Physics</option>
                    <option value="3">English</option>
                    <option value="4">Computer Programming</option>
                </select>


          <div style="background-size:160px; margin-top:5px">
             <input class=button style="background-color:gray" type="submit" value="PICK">
          </div>
  </div>
          </div>
   
        <asp:Repeater ID="RepterDetails" runat="server" OnItemDataBound="Repeater_ItemDataBound" >  
    <HeaderTemplate> 
              
        <table class="table" style="width:70%;display:inline-block;vertical-align:top;margin-top:0;padding:0 0;margin-right:20px;">  
            <tr class="row" style="background-color: #36304a; color:white; font-size: large; font-weight: bold; ">  
                <td class="tdStyle" style="text-align:center"><b>Question</b></td>  
                <td class="tdStyle" style="text-align:center"><b>Category</b></td>  
                <td class="tdStyle" style="text-align:center"><b>Status</b></td>
                <td class="tdStyle" style="text-align:center;white-space:nowrap"><b>Expiration Date</b></td>
                <td class="tdStyle" style="text-align:center"><b>Add Answer</b></td>
            </tr>  
    </HeaderTemplate> 
            
    <ItemTemplate>  
    <tr class="row" style="background-color:#EBEFF0; text-align:center;"> 
        <td style=""><asp:Label ID="Text" runat="server" Text='<%#Eval("Text") %>' Font-Bold="true"/></td>  
        <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("Category") %>' Font-Bold="true"/></td>  
        <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("Status") %>' Font-Bold="true"/></td>
        <td><asp:Label ID="Label3" runat="server" Text='<%#Eval("ExpDate") %>' Font-Bold="true"/></td>
        <td class="tdStyle">
            <input type="button" class="button" onclick="showDiv('<%#Eval("Id") %>')" style="font-family:Poppins;background-color:#36304a" value="Add"/>
        </td>
    </tr> 
    </div>  
    </ItemTemplate> 
            
    <FooterTemplate>  
        <tr><td colspan="4"><asp:Label ID="lblErrorMsg" runat="server" CssClass="errMsg" Text="Sorry, no item is there to show." Visible="false"></asp:Label></td></tr>

        </table>                
    </FooterTemplate>
              
        </asp:Repeater>  
    <div id="divFade" onclick="closeEdit()" style="position:absolute;left:0;top:0;background-color:black;opacity:0.5;display:none;z-index:2;height:1000px;width:2000px"></div>
    <div id="DivAnswers" style="display:none;z-index:50;position:absolute;background-color:#f2f2f2;border-radius:5px;width:500px;height:300px">
            <div class="container3" style="height:300px">
          <div class="container">
                <div class="container">
                    <div class="title">
                        <label for="Text">Enter Text</label>
                    </div>
                    <div class="button1">
                        <textarea id="text" name="text" placeholder="Write something.."style="height:100px;width:470px"></textarea>
                    </div>
                </div>
                  <div style="margin-top:0px;text-align:center;margin-bottom:2px">
                    <asp:Button runat="server" ID="btnAnswerQuestion" CssClass="button" text="SUBMIT" OnCommand="btnAnswerQuestion_Click" />
                    <input id="questionId" name="questionId" type="hidden" />  
                </div>
                </div>
            </div>
    </div>
    <script>
        function showDiv(questionId) { //הפעולה יוצרת התראה שבה ניתן להוסיף תשובה לשאלות אחרות
            document.getElementById("questionId").value = questionId;
            document.getElementById("divFade").style.display = 'block';
            var div = document.getElementById("DivAnswers");
            div.style.left = (document.body.clientWidth - 500) / 2 + "px";
            div.style.top = (window.innerHeight - 350) / 2 + "px";
            div.style.display = 'block';
        }

        function closeEdit() { //פעולה הסוגרת את ההתראה
            document.getElementById("divFade").style.display = 'none';
            document.getElementById("DivAnswers").style.display = 'none';
        }
    </script>
</asp:Content>

