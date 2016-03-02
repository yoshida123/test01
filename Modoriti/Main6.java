package test02;

public class Main6 {

	public static void main(String[] args) {
		
		//引数に配列を用いる
		int[] array = {1,2,3};
		
		//配列を渡す
		printArray(array);
	}
	public static void printArray(int[] array){
		for(int i : array){
			System.out.println(i);
		}
	}

}
