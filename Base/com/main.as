package com
{
	import com.qupy.base.Polygon;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class main extends MovieClip
	{
		private var _this	 	: MovieClip ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			init(); 
		}
		
		private function init():void
		{
			var tmp : Polygon = new Polygon(0.1, 0x123456, 0x987654, Polygon.PARALLELOGRAM, 20, 5, 0.7);
			
			tmp.width = 200 ; 
			tmp.height = 200 ; 
			_this.addChild(tmp);
			
			_this.stage.addEventListener(MouseEvent.CLICK, clickHandler);
			
			function clickHandler(ev:MouseEvent):void
			{
				tmp.alpha = 0.1 ; 
			}
		}		
	}
}
