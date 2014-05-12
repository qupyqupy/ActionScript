package com
{
	import com.qupy.calculate.IrregularTerrain;
	import com.qupy.logic.Player;
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _map	 : IrregularTerrain ; 
		private var _per	 : Player				= new Player();
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
			initClass();
		}
		
		private function initUI():void
		{
			_map = new IrregularTerrain(new map());
			_map.y = 200 ; 
			_map.x = 200 ; 
			_this.addChild(_map);
			
			_map.addChild(_per);
			
			var tmpObj : Object = _map.initLocation(10) ; 
			
			_per.x = tmpObj.x ;  
			_per.y = tmpObj.y ; 
			_per.rotation = tmpObj.rotation ; 			
		}
		
		private function initClass():void
		{
			_this.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function keyDownHandler(ev:KeyboardEvent):void
		{
			var p1 		: Point  = new Point(_per.x, _per.y); 
			var p2 		: Point ; 
			var tmpObj 	: Object ; 
			
			if (ev.keyCode == Keyboard.LEFT)
			{
				p2 			= new Point(_per.x - 10, _per.y);
				_per.scaleX = -1 ; 
				tmpObj 		= _map.getLocation(p1, p2, IrregularTerrain.WALK_REVERSE) ; 
			}
			else if (ev.keyCode == Keyboard.RIGHT)
			{
				p2 			= new Point(_per.x + 10, _per.y);
				_per.scaleX = 1 ; 
				tmpObj 		= _map.getLocation(p1, p2, IrregularTerrain.WALK_FORWARD) ; 
			}
			
			_per.x = tmpObj.x ;  
			_per.y = tmpObj.y ; 
			_per.rotation = tmpObj.rotation ; 	
		}
	}
}
