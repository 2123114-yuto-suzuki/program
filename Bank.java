//銀行口座クラス
public class Bank {
	private String name; //口座名義
	private int no; //口座番号
	private long balance; //預金残高
	private int bankid; //銀行識別番号
	
	//コンストラクター
	Bank(String n,int num,long ba,int bid){
		name=n;//口座名義
		no=num;//口座番号
		balance=ba;//預金残高
		bankid=bid;//銀行識別番号
	}
	
	//口座名義検索
	String getName() {
		return name;
	}
	
	//口座番号検索
	int getNo() {
		return no;
	}
	
	//預金残高検索
	long getBalance() {
		return balance;
	}
	
	//銀行識別番号検索
	int getBankid() {
		return bankid;
	}
	
	//預金
	void deposit(long k) {
		balance+=k;
	}
	
	//出金
	void withdraw(long k) {
		balance-=k;
	}
	
	//手数料発生
	void commission() {
		balance -=100;
	}
}


