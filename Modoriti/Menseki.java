package test02;

public class Menseki {

	public static void main(String[] args) {
		
		//呼び出し元
		double triangleArea = calcTriangleArea(10.0,5.0);	//calcTriangleAreaメソッドを呼び出し、引数として(10.5,5.0)を渡す
			System.out.println("三角形の面積:" + triangleArea + "平方cm");
			
		//呼び出し元
		double circleArea = calcCircleArea(5.0);	//calcCircleAreaメソッドを呼び出し、引数として(5.0)を渡す
			System.out.println("円の面積:" + circleArea + "平方cm");
	}
	
	//呼び出されたメソッド
	public static double calcTriangleArea(double bottom,double height){
		double area = (bottom * height) / 2;
		return area;	//returnで値(area)をcalcTriangleAreaメソッドへ返す
	}
	
	//呼び出されたメソッド
	public static double calcCircleArea(double radius){
		double area = radius * radius * 3.14;
		return area;	////returnで値(area)をcalcCircleAreaメソッドへ返す
	}
	
}
