<%@ Page Title="" Language="C#" MasterPageFile="~/master/main.master" AutoEventWireup="true" CodeFile="PrivacyPolicy.aspx.cs" Inherits="PrivacyPolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style>
body{
    background-color:gray;
    background:url(images/bg2.png) repeat, url(images/sky.jpg) no-repeat !important;
}
.PageContent{
    margin-left:50px, auto;
    font-family:Poppins;
    font-weight:bold;
}
.PrivacyPolicy{
    color: white;
    text-align: center;
    font-size: 4.0625rem;
    font-weight:bold;
    font-family:gentle;
    text-decoration:underline;
}
.txt{
    color:white;
    margin-left:35px;
    font-family:gentle;
    text-decoration:underline;
    text-align:left
    
}
.PageContent{
    font-family:Poppins;
    direction:ltr;
    margin-left:200px,auto;
    text-align:left;
    color:white;
}
.paragraph{
    font-family:Poppins;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h1 class="PrivacyPolicy"><b>Privacy Policy</b></h1>

    <div class="PageContent"> 

        <div class="txt">
          <h2><u>What personal information do we collect from the people that visit our blog, website or app?</u></h2>
        </div>

        <pre class="paragraph">
        When ordering or registering on our site, as appropriate, you may be asked to enter your name, email address, mailing address,
            credit card information or other details to help you with your experience.
        </pre>

        <div class="txt">
            <h2>When do we collect information?</h2>
        </div>

        <pre class="paragraph">
        We collect information from you when you register on our site, place an order, subscribe to a newsletter, fill out a form
            or enter information on our site.
        </pre>

        <div class="txt">
          <h2>How do we use your information?</h2>
        </div>

        <pre class="paragraph">
        We may use such information in the following ways:

        To personalize user's experience and to allow us to deliver the type of content and product offerings in which you are most interested.
        To improve our website in order to better serve you.
        To allow us to better service you in responding to your customer service requests.
        To administer a contest, promotion, survey or other site feature.
        To quickly process your transactions.
        To send periodic emails regarding your order or other products and services.
        </pre>

        <div class="txt">
            <h2>How do we protect visitor information?</h2>
        </div>

        <pre class="paragraph">
        Our website is scanned on a regular basis for security holes and known vulnerabilities in order to make your visit to our site as
        safe as possible.

        We use regular Malware Scanning.

        Your personal information is contained behind secured networks and is only accessible by a limited number of persons who 
        have special access rights 
        to such systems, and are required to keep the information confidential. In addition, all sensitive/credit information you 
        supply is encrypted via
        Secure Socket Layer (SSL) technology.

        We implement a variety of security measures when a user places an order enters, submits, or accesses their information
        to maintain the safety of your personal information.

        All transactions are processed through a gateway provider and are not stored or processed on our servers.
        </pre>

        <div class="txt">
            <h2>Do we use 'cookies'?</h2>
        </div>
       
        <pre class="paragraph">
        Yes. Cookies are small files that a site or its service provider transfers to your computer's hard drive through your Web browser
        (if you allow) that enables the site's or service provider's systems to recognize your browser and capture and remember certain
        information. For instance, we use cookies to help us remember and process the items in your shopping cart. They are also used to 
        help us understand your preferences based on previous or current site activity, which enables us to provide you with improved services.
        We also use cookies to help us compile aggregate data about site traffic and site interaction so that we can offer better site 
        experiences and tools in the future.

  <%--      We use cookies to:

        Help remember and process the items in the shopping cart.
        Understand and save user's preferences for future visits.
        Compile aggregate data about site traffic and site interactions in order to offer better site experiences and tools in the future.
        We may also use trusted third party services that track this information on our behalf.
        You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. 
        You do this through your browser (like Internet Explorer) settings. Each browser is a little different, so look at your browser's 
        Help menu to learn the correct way to modify your cookies.

        If you disable cookies off, some features will be disabled It will turn off some of the features that make your site experience more 
        efficient and some of our services will not function properly.--%>
        </pre>
    </div>

</asp:Content>
