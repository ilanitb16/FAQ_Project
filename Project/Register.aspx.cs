using System;
using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    string username, password, name, email, lastname;
    public string Message = "";
    public bool admin;

    protected void Page_Load(object sender, EventArgs e) //פעולה המכניסה משתמש חדש לטבלה אחרי בדיקה האם שם משתמש כזה קיים או לא
    {
        if (Session["user"] != null)
        {
            Response.Redirect("LoggedIn.aspx");
        }
        if (IsPostBack)
        {
            username = Request.Form["user"];
            password = Request.Form["password1"];
            name = Request.Form["name"];
            lastname = Request.Form["lastname"];
            email = Request.Form["email"];
            admin =false;

            //bool isAdmin = admin != null ? true : false;

            SqlConnection connection = new SqlConnection(ConnectionString()); //מתחבר לבסיס הנתונים
            connection.Open();
            string sql = String.Format("SELECT Count(*) AS Count FROM Login WHERE username ='{0}'", username); 
            SqlCommand cmd = new SqlCommand(sql, connection);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd); //
            DataSet ds = new DataSet(); //מערך טבלאות
            adapter.Fill(ds);

            int count = Int32.Parse(ds.Tables[0].Rows[0]["Count"].ToString());

            if(count != 0) //בדיקה האם קיים משתמש בעל שם משתמש זהה
            {
                Message = "<font style='color:red'> Username Not Available</font>";
                return;
            }

            sql = String.Format("INSERT INTO Login (Username, Password, Admin, Name, [Last Name], Email) Values ('{0}','{1}','{2}','{3}','{4}','{5}')", username, password, admin, name,lastname,email); 

            cmd = new SqlCommand(sql, connection);
            cmd.ExecuteNonQuery();

            connection.Close();

            Message = "<font style='color:green'>You Have Successfully Signed Up</font>";
        }

    }
    static string ConnectionString()
    {
       return @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = 'C:\Users\Ilanit\Desktop\Ilanit Berditchevsky\School\10th Grade\Computer Programming\HomeWork\Project\Project\App_Data\Database.mdf'; Integrated Security = True";
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        //להעתיק את מה שבתוך איז פוסטבאק 
    }
}