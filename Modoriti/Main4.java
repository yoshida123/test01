package test02;

public class Main4 {

	public static void main(String[] args) {
		
		//addメソッドを呼び出し、(100,10)を引数として渡す
		int ans = add(100,10);
		
		//ansを表示
		System.out.println("100 + 10 = " + ans);
	}
	public static int add(int x, int y){
		
		//100 + 10 の結果の110が変数goukeiとして
		int goukei = x + y;
		
		//呼び出し元へ値を返す
		return goukei;
	}

}
