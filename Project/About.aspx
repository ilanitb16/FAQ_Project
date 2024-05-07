<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <style>
        body {
             background:url(images/bg2.png) repeat, url(images/sky.jpg) no-repeat !important;
        }
        .intro:hover{
            color:black;
        }
    </style>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
        <div class="Msg" style="margin-top:200px">
            <h1 class="abouttxt">About Us</h1>
        </div>
        <div class="intro" style="font-family:Poppins;text-align:center"> 
            <pre style="font-family:Poppins;color:white;">
                This website allows you to anonymously ask any 
                quastions and share answers with those who
                    need it. The ultimate study service.
            </pre>
        </div>
</asp:Content>

