package Models;

public class ExpensesTracker {
	
	
	protected  String title;
	protected  String expenses;
	protected  String category;
	protected  String date;
	protected  int id;
	protected  int userid;
	

	
	
	
	public ExpensesTracker(String title, String expenses, String category, String date, int userid) {
		super();
		this.title = title;
		this.expenses = expenses;
		this.category = category;
		this.date = date;
		this.userid = userid;
	}





	public ExpensesTracker(int id, String title, String expenses, String category, String date) {
		super();
		this.id = id;
		this.title = title;
		this.expenses = expenses;
		this.category = category;
		this.date = date;
		
	}



	
	
	public ExpensesTracker(int id, int userid,String title, String expenses, String category, String date) {
		super();
		this.title = title;
		this.expenses = expenses;
		this.category = category;
		this.date = date;
		this.id = id;
		this.userid = userid;
	}




	public int getUserid() {
		return userid;
	}




	public void setUserid(int userid) {
		this.userid = userid;
	}




	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getExpenses() {
		return expenses;
	}
	public void setExpenses(String expenses) {
		this.expenses = expenses;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
	
