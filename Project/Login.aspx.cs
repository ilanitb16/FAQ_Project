using System;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    public string msg;
    protected void Page_Load(object sender, EventArgs e) //פעולה הבודקת אם המשתמש קיים, אם כן הוא מתחבר ומקבל גישה לאתר
    {
        if (Session["user"]!=null)
        {
            Response.Redirect("LoggedIn.aspx");
        }

        if (IsPostBack)
        {
            string password = Request.Form["password"];
            string name = Request.Form["user"];

            SqlConnection connection = new SqlConnection(ConnectionString());
            connection.Open();
            string sql = "SELECT * FROM Login";  //בוחר את השורות מהטבלה
            SqlCommand cmd = new SqlCommand(sql, connection); // יוצרים אובייקט ומכניסים את השורות מהטבלה והקונקשן סטרינג
            SqlDataAdapter adapter = new SqlDataAdapter(cmd); //תווח שמאפשר לבצע את הפעולה שהעברנו בתוכה
            DataSet ds = new DataSet();  //דטה סט מכיל טבלאות
            adapter.Fill(ds); //מפעיל פקודה
            connection.Close();

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                DataRow dr = ds.Tables[0].Rows[i]; //עצם המייצג שורה בטבלת לוגין
                if (name == dr["Username"].ToString().Trim() && password == dr["Password"].ToString().Trim())
                {
                    msg = "<font style='color:green'> You Have Successfully Signed In</font>";
                    Session["user"] = name;
                    Session["userId"] = dr["Id"].ToString();
                    Session["IsAdmin"] = dr["Admin"];
                    i = ds.Tables[0].Rows.Count; //"break"
                    Response.Redirect("home.aspx");
                }
                else
                    msg = "<font style='color:red;'>Incorrect username or password </font>";
            }
        }
    }
    static string ConnectionString()
    {
        return @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = 'C:\Users\Ilanit\Desktop\Ilanit Berditchevsky\School\10th Grade\Computer Programming\HomeWork\Project\Project\App_Data\Database.mdf'; Integrated Security = True";
    }
}

