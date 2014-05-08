package com
{
	import com.qupy.tools.*;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _val	 : int			= 0 ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			
			trace('最大公約數=' + Mathematics.getHCF(30,6,9,12,15,18,21,24,27,33,36));
			trace('隨機取得值=' + Mathematics.getRandomVal([30,6,9,12,15,18,21,24,27,33,36]));
			trace('重新排列陣列=' + Mathematics.getRandomArray([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]));
		
			_this.addEventListener(Event.ENTER_FRAME, moveHandler);
		}
		
		private function moveHandler(ev:Event):void
		{
			//取得兩點之間的角度
			//_this.obj.rotation = Mathematics.getRotation(new Point(_this.obj.x, _this.obj.y), new Point(_this.mouseX, _this.mouseY));
			
			//計算物件的圓形軌跡
			/*_val ++ ; 			
			if (_val % 5 == 0)
			{
				var tmp : Point = Mathematics.getCircularTrack(new Point(_this.obj.x, _this.obj.y), new Point(500, 300), 100);
				_this.obj.x = tmp.x ;
				_this.obj.y = tmp.y ; 
			}*/
			
		}
	}
}
