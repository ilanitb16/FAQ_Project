using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class master_UsersInfo : AuthPage
{

    protected void Page_Load(object sender, EventArgs e) //פעולה המדפיסה את המידע של המשתמשים מהטבלה
    {
        if (!IsAdmin)
        {
            Response.Redirect("Forbidden.aspx");
        }

        SqlConnection connection = new SqlConnection(ConnectionString()); 
        connection.Open();
        string sql = String.Format("Select * from Login");
        SqlCommand cmd = new SqlCommand(sql, connection);  
        SqlDataAdapter adapter = new SqlDataAdapter(cmd); 
        DataSet ds = new DataSet();  
        adapter.Fill(ds); 
        rptUsers.DataSource = ds;
        rptUsers.DataBind();
        connection.Close();
    }
    static string ConnectionString()
    {
        return @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = 'C:\Users\Ilanit\Desktop\Ilanit Berditchevsky\School\10th Grade\Computer Programming\HomeWork\Project\Project\App_Data\Database.mdf'; Integrated Security = True";
    }
}
