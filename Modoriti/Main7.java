package test02;

public class Main7 {
	
	//戻り値に配列を用いるパターン
	
	public static int[] makeArray(int size){
		int[] newArray = new int[size];
		for(int i = 0; i < newArray.length; i++){
			newArray[i] = i;
		}
		return newArray;	//配列を戻す
	}
	public static void main(String[] args) {
		
		int[] array = makeArray(3);
		for(int i : array){
			System.out.println(i);
		}
		
	}

}
