package test02;

public class YWvsM {

	public static void main(String[] args) {
		Yusya y = new Yusya("勇者");		//Yusyaクラスからインスタンスを生成し、変数 y に入れる
		Maou m = new Maou("魔王");		//Maouクラスからインスタンスを生成し、変数 m に入れる
		Wizard w = new Wizard("魔法使い");		//Wizardクラスからインスタンスを生成し、変数wに入れる
		boolean y_act = false;
		boolean w_act = false;
		boolean all_act = false;
		
		System.out.println(y.getName() + "様、" + w.getName() + "様と協力し " + m.getName() + "を倒せばあなた方の勝利です！頑張って下さい・・・");
		System.out.println();
		y.status();		//ステータスを表示させる
		w.status();
		m.status();
		
		while (true) {		//無限ループ
			// 勇者の行動
			if (y.getHp() > 0 && !y_act) {	//&&(かつ) → 両方の条件が満たされた場合にtrue	ここでは、勇者のHPが0以上かつtrue(!y_act→trueになるので)の場合に実行される
				y_act = y.menu(m);	//魔王の m
			} else if (y.getHp() <= 0) {	//y.getHp()が0以下もしくは0の場合、y_actがtrueになる
				y_act = true;
			}
			// 魔法使いの行動
			if (w.getHp() > 0 && !w_act) {	//&&(かつ) → 両方の条件が満たされた場合にtrue	ちなみに ||(または) → どちらか片方の条件さえ満たされればtrue
				w_act = w.menu(y, m);		//勇者の y　魔王の m
			} else if (w.getHp() <= 0) {
				w_act = true;
			}
			all_act = y_act & w_act;	//y_act & w_act → trueであれば処理が実行される (true & false → false(両方の条件が満たされなければfalseになる)	true || false → true(どちらか片方の条件が満たされればtrueになる))
			// 魔王の行動
			if (all_act) {		//if(条件式){ → だとtrueの処理になり、その後elseで記述するとfalseの処理になる
				m.randomNumber(y,w);	//勇者の y 魔法使いの w
				y_act = false;		//falseに戻してまたループさせる
				w_act = false;		//falseに戻してまたループさせる
			}
			// 勇者一行が倒された場合、もしくは魔王が倒された場合ループを抜ける
			if (y.getHp() <= 0 && w.getHp() <= 0 || m.getHp() <= 0) {
				break;
			}
		}
		if (y.getHp() <= 0 && w.getHp() <= 0) {
			System.out.println("パーティーが全滅しました [GAMEOVER]");
		} else if (m.getHp() <= 0) {
			System.out.println(m.getName() + "を倒しました！ [COMPLETE]");
		}
	}
}
