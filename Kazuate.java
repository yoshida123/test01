package test02;

public class Kazuate {

	public static void main(String[] args) {
		System.out.println("[数あてゲームです]");
		
		//0～9の乱数
		int ans = new java.util.Random().nextInt(10);
		
		//5回まわす
		for(int i = 0; i < 5; i++){
			System.out.println("0～9の数字を入力してください");
			
			//数字を入力させる
			int num = new java.util.Scanner(System.in).nextInt();
			
			//ランダムで選ばれた数字と入力した数字がそろえばアタリ breakで終了　外れたらもう一度入力(計5回)全部外せばbreakで終了。
			if(num == ans){
				System.out.println("アタリです");
				break;
			}else{
				System.out.println("ハズレです");
			}
			System.out.println("ゲームを終了します。");
		}
	}

}
