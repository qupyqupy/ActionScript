/**
 * Qupy
 * 一些與數學運算相關的方法
 **/
 
package com.qupy.tools
{
	import flash.geom.Point;
	
	public class Mathematics
	{
		/**
		 * 取得最大公約數
		 * 傳入一個陣列，回傳最大公約數
		 **/
		 public static function getHCF(...args):int
		 {
			function compare(val1:int, val2:int):int
			{
				var tmpInta : int	 = val1 ; 
				var tmpIntb : int	 = val2 ; 
				var max		: Number = Math.max(tmpInta, tmpIntb);
				var min		: Number = Math.min(tmpInta, tmpIntb);
				
				while(min != 0)
				{
					tmpIntb = max % min ;  
					max 	= min ; 
					min 	= tmpIntb ; 
				}
				return max ; 
			}
			
			var tmpArr 		: Array = args.slice();  
			var tmpInt 		: int 	= tmpArr[0];
			var tmpLength 	: int 	= tmpArr.length ;  			
			
			var i 			: int ;
			
			for (i = 1 ; i < tmpLength ; i++)
			{
				tmpInt = compare(tmpInt, tmpArr[i]);
			}
			
			return tmpInt ;
		}	
		
		/**
		 * 隨機取陣列中的值
		 **/
		public static function getRandomVal(arr:Array):*
		{
			var tmpArr : Array 	= arr.slice() ;
			var ranVal : int 	= int(Math.random() * tmpArr.length);
			return tmpArr[ranVal] ;
		}
		
		/**
		 * 將陣列重新排列
		 **/
		public static function getRandomArray(arr:Array):Array
		{
			var tmpArr 	: Array = arr.slice() ; 
			var tmpArr2	: Array = [] ; 
			var i		: int  ; 
			var tmpLen 	: int 	= tmpArr.length ; 
			
			for (i = 0 ; i < tmpLen ; i++)
			{
				var tmpVal : int = int(Math.random() * tmpArr.length) ; 
				tmpArr2.push(tmpArr[tmpVal]);
				tmpArr.splice(tmpVal, 1);
			}			
			return tmpArr2 ; 
		}
	}
}
