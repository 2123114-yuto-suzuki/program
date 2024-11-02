//メインシステムクラス
import java.util.Scanner;
class MainSystem {

	public static void main(String[] args) {
		Scanner stdIn=new Scanner(System.in);
		//仮データ作成
		Bank[] b=new Bank[] {
				new Bank("相田開人",391283,39000,1),
				new Bank("鈴木悠斗",252101,50000,2),
				new Bank("大森翔太",743892,18000,2),
				new Bank("金子優",473292,20000,3),
				new Bank("佐藤凜",876382,20000,3),
		};
		
		int number; //用件認識用の番号
		int check=0; //確認用の番号
		int cnum=0; //自身の口座選択用の番号
		long money; //金額
		int parnum=0; //相手の口座選択用の番号
		
		//スタート画面設定
		System.out.println("ようこそ");
		System.out.println("本日のご用件をお選びください");
		System.out.println("１：預け入れ　２：払い出し　３：残高照会　４：ご送金");
		
		//用件の番号が正しく入力されたかの確認
		do {
		number=stdIn.nextInt();
		if(number<=0||number>=5) {
			//誤入力の場合、再度入力させる
			System.out.println("番号をお確かめの上、もう一度ご入力してください。");
			}
		}while(number<=0||number>=5);

		//口座番号の確認
		System.out.println("お客様の口座番号を入力してください。");
		int younum=stdIn.nextInt();

		//入力された口座番号が該当するものか確認する
		for(int i=0;i<b.length;i++) {
			//該当した場合、確認用の番号に1、自身の口座選択用の番号にiを代入
			if(b[i].getNo()==younum) {
				check=1;
				cnum=i;
			}
		}
		
		//該当しなかった場合、最初から動作を再度行わせる。
		if(check==0) {
			System.out.println("番号が間違っている、もしくは存在しません。");
			System.out.println("申し訳ございませんが、もう一度ご確認の上、はじめからやり直してください。");
		}
		
		//確認できた場合、実際の選択された用件を動作させる。
		else if(check==1){
			switch(number) {
			//預け入れ
			case 1:
				System.out.println("預け入れする金額を入力してください。");
				//金額の入力
				money=stdIn.nextLong();
				//入力された金額分預け入れる。
				b[cnum].deposit(money);
				System.out.println(b[cnum].getName()+"様の残高は"+b[cnum].getBalance()+"円です。");//残高表示
				break;
			//払い出し
			case 2:
				System.out.println("払い出しする金額を入力してください。");
				//金額の入力
				money=stdIn.nextLong();
				//入力された金額分払い出す。
				b[cnum].withdraw(money);;
				System.out.println(b[cnum].getName()+"様の残高は"+b[cnum].getBalance()+"円です。");//残高表示
				break;
			//残高照会
			case 3: 
				System.out.println(b[cnum].getName()+"様の残高は"+b[cnum].getBalance()+"円です。");//残高表示
				break;
			//送金
			case 4:
				System.out.println("ご送金される口座の口座番号を入力してください。");
				//送金先の口座番号確認
				int comnum=stdIn.nextInt();
				for(int i=0;i<b.length;i++) {
					//該当した場合、確認用の番号に2、自身の口座選択用の番号にiを代入
					if(b[i].getNo()==comnum) {
						check=2;
						parnum=i;
						
					}
				}
				
				//確認用の番号が1、つまり確認できなかった場合、最初から動作を再度行わせる。
				if(check==1) {
					System.out.println("番号が間違っている、もしくは存在しません。");
					System.out.println("申し訳ございませんが、もう一度ご確認の上、はじめからやり直してください。");
					break;
				}
				
				
				System.out.println("ご送金する金額を入力してください。");
				money=stdIn.nextLong();//金額の入力
				//銀行識別番号が違う、つまり別の銀行への送金の場合、手数料が発生する。
				//ifでidの比較を行う
				if(b[parnum].getBankid()!=b[cnum].getBankid()) {
					//手数料の金額を引く
					b[cnum].commission();
				}
				//自身の口座から払い出し
				b[cnum].withdraw(money);
				//相手の口座へ送金
				b[parnum].deposit(money);
				System.out.println(b[parnum].getName()+"様の残高は"+b[parnum].getBalance()+"円です。");//残高表示
				System.out.println(b[cnum].getName()+"様の残高は"+b[cnum].getBalance()+"円です。");//残高表示
				break;
			}
		}
		//終了時のメッセージ表示
		System.out.println("ご利用いただきありがとうございました。");
		System.out.println("またのご利用をお待ちしております。");
	}

}
