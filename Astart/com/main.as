package com
{
	import com.qupy.logic.Map;
	
	import flash.display.MovieClip;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _map	 : Map 			= new Map();
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
		}
		
		private function initUI():void
		{
			_this.addChild(_map);
			
			reSize();
		}
		
		private function reSize():void
		{
			_map.x = 200 ; 
			_map.y = 200 ; 
		}
	}
}
