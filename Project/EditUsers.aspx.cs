using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class EditUsers : AuthPage
{
    SqlConnection connection = new SqlConnection(ConnectionString()); 
    public string Message = "";

    protected void Page_Load(object sender, EventArgs e) //פעולה הבודקת האם המשתמש הוא מנהל, אם לא הוא- הוא יכול להיכנס לעמוד מנהל
    {
        if (!IsAdmin)
        {
            Response.Redirect("Forbidden.aspx");
        }

        connection.Open();

        if (!IsPostBack)
        {
            ShowUsers();
        }
    }

    protected override void OnUnload(EventArgs e)
    {
        base.OnUnload(e);
        connection.Close();
    }
    protected void DeleteBtn_Click(Object sender, CommandEventArgs e) //פעולה המוחקת את המשתמש בתנאי שהוא לא מנהל
    {
        int UserId = Convert.ToInt32(e.CommandArgument);
        string sql = String.Format("DELETE FROM Login WHERE Admin='False' AND Id=" + UserId);
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();

        ShowUsers();
    }
    protected void SubmitBtn_Click(Object sender, CommandEventArgs e) //פעולה העורכת את הנתונים של המשתמש
    {
        string name = Request.Form["name"];
        string  lastname = Request.Form["lastname"];
        string email = Request.Form["email"];
        bool admin = Request.Form["admin"] == null ? false: true;
        int UserId = Convert.ToInt32(Request.Form["userid"]);
        string sql = String.Format("UPDATE Login SET Name='" + name + "', [Last name]='" + lastname + "', Email='" + email+ "', Admin='" + admin + "' WHERE Id = " + UserId);
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();

        ShowUsers();
    }
    private void ShowUsers() //פעולה המדפיסה את המידע של המשתמשים מהטבלה
    {
        string sql = String.Format("Select * from Login WHERE Id <> " + CurrentUserId);
        SqlCommand cmd = new SqlCommand(sql, connection); // יוצרים אובייקט ומכניסים את השורות מהטבלה והקונקשן סטרינג
        SqlDataAdapter adapter = new SqlDataAdapter(cmd); //תווח שמאפשר לבצע את הפעולה שהעברנו בתוכה
        DataSet ds = new DataSet();  //דטה סט מכיל טבלאות
        adapter.Fill(ds); //מפעיל פקודה
        rptUsers.DataSource = ds;
        rptUsers.DataBind();
    }

    static string ConnectionString()
    {
        return @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = 'C:\Users\Ilanit\Desktop\Ilanit Berditchevsky\School\10th Grade\Computer Programming\HomeWork\Project\Project\App_Data\Database.mdf'; Integrated Security = True";
    }
}
