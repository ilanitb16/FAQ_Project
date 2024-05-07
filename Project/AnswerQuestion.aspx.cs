using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AnswerQuestion : AuthPage
{
    string categoryId;
    string text;
    protected void Page_Load(object sender, EventArgs e) //הפעולה לוקחת מהטבלה שאלות בקטגוריה שנבחרה
    { 
        SqlConnection connection = new SqlConnection(ConnectionString());
        connection.Open();

        categoryId = Request.Form["Category"];
        string sql;

        if(String.IsNullOrEmpty(categoryId)) //אם אין ערף,נבחר שאלות בלי סינון לפי קטגוריה
        {
            sql = "select q.id, q.[Text], c.[Name] as Category, s.[Name] as [Status], ExpDate from Questions q LEFT JOIN Category c on q.CategoryId = c.id LEFT JOIN[Status] s on q.StatusId = s.id and UserId <> " + Session["userId"]; ;  //בוחר את השורות מהטבלה
        }
        else
        {
            sql = "select q.id, q.[Text], c.[Name] as Category, s.[Name] as [Status], ExpDate from Questions q LEFT JOIN Category c on q.CategoryId = c.id LEFT JOIN[Status] s on q.StatusId = s.id where c.id = " + categoryId + " and UserId <> " + Session["userId"]; ;  //בוחר את השורות מהטבלה
        }

        SqlCommand cmd = new SqlCommand(sql, connection); // יוצרים אובייקט ומכניסים את השורות מהטבלה והקונקשן סטרינג
        SqlDataAdapter adapter = new SqlDataAdapter(cmd); //תווח שמאפשר לבצע את הפעולה שהעברנו בתוכה
        DataSet ds = new DataSet();  //דטה סט מכיל טבלאות
        adapter.Fill(ds); //מפעיל פקודה
        RepterDetails.DataSource = ds;
        RepterDetails.DataBind();
        connection.Close();
    }

    protected void btnAnswerQuestion_Click(Object sender, CommandEventArgs e) //הפעולה מכניסה לתוך טבלת התשובות את התשובה שהוזנה
    {
        SqlConnection connection = new SqlConnection(ConnectionString());
        connection.Open();
        string QuestionId = Request.Form["questionId"];
        string QuestionText = Request.Form["text"].Replace("'", "''");
        
        string sql = String.Format("INSERT INTO Answers (AnswerText, QuestionId, UserId) Values ('{0}', {1},{2})",QuestionText, QuestionId, Session["userId"]);
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();

        sql = "UPDATE Questions Set StatusId=2 where id=" + QuestionId;
        cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();

        connection.Close();
    }
    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)  //הפעולה מחזירה הודעה מתאימה בתנאי שאין נתונים בתוך הרפיטר
    {
        Repeater RepterDetails = sender as Repeater; // Get the Repeater control object.

        // If the Repeater contains no data.
        if (e.Item.ItemType == ListItemType.Footer && ((DataSet)RepterDetails.DataSource).Tables[0].Rows.Count == 0)
        {

            // Show the Error Label (if no data is present).
            Label lblErrorMsg = e.Item.FindControl("lblErrorMsg") as Label;
            if (lblErrorMsg != null)
            {
                lblErrorMsg.Visible = true;
            }
        }
    }

    static string ConnectionString()
    {
        return @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = 'C:\Users\Ilanit\Desktop\Ilanit Berditchevsky\School\10th Grade\Computer Programming\HomeWork\Project\Project\App_Data\Database.mdf'; Integrated Security = True";
    }
}