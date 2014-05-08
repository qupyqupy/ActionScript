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
		
		/**
		 * 取得兩點之間的角度
		 **/
		public static function getRotation(p1:Point, p2:Point):Number
		{
			var pa 	: Point 	= p1;
			var pb 	: Point 	= p2;
			var dx	: Number 	= pb.x - pa.x;
			var dy	: Number	= pb.y - pa.y;
			var drot: Number	= Math.atan2(dy,dx);
			var wrot: Number	= drot / Math.PI * 180;
			return wrot ;
		}
		
		/**
		 * 計算物件的圓形軌跡
		 * p1 : 物件的座標
		 * p2 : 圓心的座標
		 * quality : 品質（越高越好）
		 **/
		 public static function getCircularTrack(p1:Point, p2:Point, quality:Number = 100):Point
		 {
			 var pa 	: Point 	= p1;
			 var pb 	: Point 	= p2;
			 var q		: Number 	= quality;
			 
			 var x1		: Number	= pa.x - pb.x ; 
			 var y1		: Number	= pa.y - pb.y ; 
			 var x2		: Number	= Math.cos(q) * x1 - Math.sin(q) * y1 ; 
			 var y2		: Number	= Math.cos(q) * y1 + Math.sin(q) * x1 ; 
			 var tmpP	: Point		= new Point((pb.x + x2), (pb.y + y2));
			 return tmpP ; 		 
		 }
	}
}
