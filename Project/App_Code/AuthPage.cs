using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AuthPage
/// </summary>
public class AuthPage : System.Web.UI.Page
{
    protected bool IsAdmin = false;
    protected int CurrentUserId = 0;

    protected override void OnLoad(EventArgs e) //פעולה הבודקת האם המשתמש מחובר או לא, אם לא הוא נשלח לדף הלוגין
    {
        IsAdmin = Convert.ToBoolean(Session["IsAdmin"]);
        CurrentUserId = Convert.ToInt32(Session["userId"]);

        if (Session["user"] == null)
        {
            Response.Redirect("login.aspx");
        }

        base.OnLoad(e);
    }
}