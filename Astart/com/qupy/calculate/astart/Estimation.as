package com.qupy.calculate.astart
{
	import com.qupy.calculate.astart.IndexModels;
	
	public class Estimation
	{
		/**
		 * 曼哈頓估算法	
		 **/
		public static function manHattan(a:IndexModels,b:IndexModels):Number
		{
			var tmp : Number = Math.abs(a.x - b.x) + Math.abs(a.y - b.y);
			return tmp ; 
		}
		
		/**
		 * 幾何估算法
		 **/
		public static function euclidian(a:IndexModels,b:IndexModels):Number
		{
			var dx : int = a.x - b.x ; 
			var dy : int = a.y - b.y ; 
			var tmp : Number = Math.sqrt(dx * dx + dy * dy);
			return tmp ; 
		}
	}
}