using System;
using System.Linq;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;


public partial class Logout : System.Web.UI.Page
{
    string name;
    string pass;
    protected void Page_Load(object sender, EventArgs e) 
    {
        Session.RemoveAll();
        Session.Abandon();
        Response.Redirect("Home.aspx");
    }
}