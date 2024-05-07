<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="UsersInfo.aspx.cs" Inherits="master_UsersInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

    <div style="display:block;text-align:center">
        <h2 style="text-align:center;font-family:gentle;color:white;font-size:50px;margin-top:0">User Information</h2>
    </div>

    <div>
         <asp:Repeater ID="rptUsers" runat="server">  
            <HeaderTemplate> 
              
                <table class="table" style="width:100%;color:grey;text-align:center">  
                    <tr class="row" style="background-color: #00425c; color:white; font-size: large; font-weight: bold;">  
                        <td class="tdStyle"><b>Name</b></td>  
                        <td class="tdStyle"><b>Last Name</b></td>  
                        <td class="tdStyle"><b>Username</b></td>
                        <td class="tdStyle"><b>Email</b></td>
                    </tr>  
            </HeaderTemplate> 
            
            <ItemTemplate>  
                <tr class="row" style="background-color:#EBEFF0">  
                    <td class="tdStyle"><asp:Label ID="Name1" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true"/></td>  
                    <td class="tdStyle"><asp:Label ID="LastName1" runat="server" Text='<%#Eval("Last Name") %>' Font-Bold="true"/></td>  
                    <td class="tdStyle"><asp:Label ID="Username1" runat="server" Text='<%#Eval("Username") %>' Font-Bold="true"/></td>
                    <td class="tdStyle"><asp:Label ID="Email1" runat="server" Text='<%#Eval("Email") %>' Font-Bold="true"/></td> 
                </tr>   
            </ItemTemplate> 
            
            <FooterTemplate>  
                </table>
            </FooterTemplate>
                
        </asp:Repeater>  
        </div>



</asp:Content>

   