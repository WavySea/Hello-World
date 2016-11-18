package finalproject.vo;

public class Item {
	private String item;
	private String answer;
	private String itemID;
	private String level;
	private int accumulatedscore;
	
	
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	
	public String getItemID() {
		return itemID;
	}
	public void setItemID(String itemID) {
		this.itemID = itemID;
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer= answer;
	}
	
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level= level;
	}
	public int getAccumulatedscore() {
		return accumulatedscore;
	}
	public void setAccumulatedscore(int accumulatedscore) {
		this.accumulatedscore= accumulatedscore;
	}
}
