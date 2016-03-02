package test02;

public class Main5 {

	public static void main(String[] args) {
		
		//戻り値をそのまま使うパターン
		System.out.println(add(add(10,20),add(30,40)));		//30と70に化ける
	}
	public static int add(int x, int y){
		int ans = x + y;
		
		//値を返す
		return ans;
		
	}

}
