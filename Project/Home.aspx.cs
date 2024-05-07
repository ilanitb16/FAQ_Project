using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Home : AuthPage
{
    protected string CategoryId = "0";
    SqlConnection connection = new SqlConnection(ConnectionString());
    protected bool showAnswers = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        connection.Open();

        if (!Page.IsPostBack)
        {
            showQuestions();
        }
    }

    private void showQuestions() //הפעולה בוחרת את סטטוס, שם, מספר זיהוי,שם וקטגוריה מהטבלה ומכניסה אותם לרפיטר, מה שמאפשר הדפסה של נתונים אלה בטבלה
    {
        string sql; 

        sql = "select q.Id, q.[Text], c.[Name] as Category, s.[Name] as [Status], ISNULL(a.c, 0) as [Count] from Questions q LEFT JOIN Category c on q.CategoryId = c.id LEFT JOIN[Status] s on q.StatusId = s.id LEFT JOIN(Select QuestionId, Count(QuestionId) c from Answers GROUP BY QuestionId) a on q.Id = a.QuestionId where UserId = " + Session["userId"];
        SqlCommand cmd = new SqlCommand(sql, connection);
        SqlDataAdapter adapter = new SqlDataAdapter(cmd); 
        DataSet ds = new DataSet(); 
        adapter.Fill(ds); 
        RepterDetails.DataSource = ds;
        RepterDetails.DataBind();
    }
    protected void GetSubj_Click(object sender, CommandEventArgs e) //הפעולה מאפשרת לסנן לפי נושאים לפי שאלות
        //במידה ונלחץ כפתור,אנו בוחרים מהטבלה שאלות מהקטגוריה שנבחרה, ושאלות שלא  ע"י המשתמש המחובר כדי שיראה את השאלות ששאל
    {
        CategoryId = Request.Form["CategoryId"];
        string sql;

        if (CategoryId == null || CategoryId == "0")
            sql = "select q.Id, q.[Text], c.[Name] as Category, s.[Name] as [Status], ISNULL(a.c, 0) as [Count] from Questions q LEFT JOIN Category c on q.CategoryId = c.id LEFT JOIN[Status] s on q.StatusId = s.id LEFT JOIN(Select QuestionId, Count(QuestionId) c from Answers GROUP BY QuestionId) a on q.Id = a.QuestionId where UserId = " + Session["userId"]; //בחירת שאלות  שנשאלו ע"י המשתמש המחובר ושורות מהטבלה 
        else
            sql = "select q.Id, q.[Text], c.[Name] as Category, s.[Name] as [Status], ISNULL(a.c, 0) as [Count] from Questions q LEFT JOIN Category c on q.CategoryId = c.id LEFT JOIN[Status] s on q.StatusId = s.id LEFT JOIN (Select QuestionId, Count(QuestionId) c from Answers GROUP BY QuestionId) a on q.Id = a.QuestionId where c.id = " + CategoryId + " and UserId = " + Session["userId"]; //בחירת שאלות שנשאלו ע"י המשתמש המחובר בקטגוריה שנבחרה

        SqlCommand cmd = new SqlCommand(sql, connection); 
        SqlDataAdapter adapter = new SqlDataAdapter(cmd); 
        DataSet ds = new DataSet();  
        adapter.Fill(ds);  
        RepterDetails.DataSource = ds;
        RepterDetails.DataBind();
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);
    }

    protected string IsSelected(string currentCategory) //פעולה הבודקת האם נבחרה קטגוריה או לא
    {
        if (currentCategory == CategoryId)
            return " selected ";
        else
            return String.Empty;
    }

    protected void btnAskQuestion_Click(Object sender, CommandEventArgs e) //פעולה המכניסה לטבלה את הנתונים הדרושים, כולל הטקסט של השאלה שהזין המשתמש
    {
        string QuestionCategoryId = Request.Form["category"];
        string QuestionText = Request.Form["text"].Replace("'", "''");
        string sql = String.Format("INSERT INTO Questions (UserId, CategoryId, [Text], StatusId, ExpDate) Values ({0}, {1},'{2}',{3},'{4}')", Session["userId"], QuestionCategoryId, QuestionText, 1, DateTime.Now.AddDays(7).ToString("dd MMM yyyy"));

        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();
    }
    protected void SubmitBtn_Click(Object sender, CommandEventArgs e) //פעולה העורכת את הנתונים של המשתמש
    {
        string name = Request.Form["name"];
        string lastname = Request.Form["lastname"];
        string email = Request.Form["email"];
        bool admin = Request.Form["admin"] == null ? false : true;
        int UserId = Convert.ToInt32(Request.Form["userid"]);
        string sql = String.Format("UPDATE Login SET Name='" + name + "', [Last name]='" + lastname + "', Email='" + email + "', Admin='" + admin + "' WHERE Id = " + UserId);
        SqlCommand cmd = new SqlCommand(sql, connection);
        cmd.ExecuteNonQuery();

        
    }
    protected void GetAnswer_Click(Object sender, CommandEventArgs e) //פעולה המחזירה את התשובות לשאלה המסוימת
    {

        string sql = "select * from Answers Where QuestionId=" + e.CommandArgument;
        
        SqlCommand cmd = new SqlCommand(sql, connection); 
        SqlDataAdapter adapter = new SqlDataAdapter(cmd); 
        DataSet ds = new DataSet();  
        adapter.Fill(ds); 
        rptAnswers.DataSource = ds;
        rptAnswers.DataBind();

        showAnswers = true;

        showQuestions();
    }

    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)  //הפעולה מחזירה הודעה מתאימה בתנאי שאין נתונים בתוך הרפיטר
    {
        Repeater RepterDetails = sender as Repeater; // Get the Repeater control object.

        // If the Repeater contains no data.
        if (e.Item.ItemType == ListItemType.Footer && ((DataSet)RepterDetails.DataSource).Tables[0].Rows.Count == 0) { 
           
            // Show the Error Label (if no data is present).
            Label lblErrorMsg = e.Item.FindControl("lblErrorMsg") as Label;
            if (lblErrorMsg != null)
            {
                lblErrorMsg.Visible = true;
            }
        }
    }

    protected override void OnUnload(EventArgs e) //בתום פעילות הדף, סוגרים את הקונקשן
    {
        connection.Close();
    }

    static string ConnectionString()
    {
        return @"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = 'C:\Users\Ilanit\Desktop\Ilanit Berditchevsky\School\10th Grade\Computer Programming\HomeWork\Project\Project\App_Data\Database.mdf'; Integrated Security = True";
    }
}