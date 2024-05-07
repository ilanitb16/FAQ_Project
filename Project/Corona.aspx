<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
             background:url(images/bg2.png) repeat, url(images/sky.jpg) no-repeat !important;
        }
        .txt{
        color:white;
        font-family:gentle;
        text-decoration:underline;
        text-align:left;
    
        }
        .paragraph{
        font-family:Poppins;
        text-align:center;
        color:white;
        }
        .page-content{
        margin-left:50px, auto;
        font-family:Poppins;
        font-weight:bold;
        }
    </style>
       <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-content">

        <div class="txt">
          <h2 style="margin-left:30%"><u>What happens to the website during the time of the COVID-19 pandemic?</u></h2>
        </div>

        <pre class="paragraph">
            Since our website does not depend on face to face contact and does not require any deliveries, personal or public 
            meetings and events or involvement of stuff members, your site will not stop its activity.However, special services will 
            be provided slower due to luck of workers. 

                We thank anyone for joining this website and wish everyone to stay safe and healthy!
        </pre>

        <div class="txt">
                <h2 style="margin-left:40%"><u>HOW TO HELP STOP THE SPREAD?</u></h2>
        </div>

        <pre class="paragraph" style="margin-left:0">
Clean your hands often. Use soap and water, or an alcohol-based hand rub. Maintain a safe distance from anyone who is coughing or sneezing. 
            Don’t touch your eyes, nose or mouth. Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.
            Stay home if you feel unwell. If you have a fever, cough and difficulty breathing, seek medical attention. 
            Call in advance. Follow the directions of your local health authority.
        </pre>
    </div>
</asp:Content>

