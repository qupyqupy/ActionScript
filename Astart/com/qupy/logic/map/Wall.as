package com.qupy.logic.map
{
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class Wall extends Sprite
	{
		public static const CAN_WALK		 : String	= 'canwalk';
		public static const CAN_NOT_WALK	 : String	= 'cannotwalk';
		
		public static const SIDE			 : Number	= 30 ; 
		
		private var _this					 : Sprite ; 
		private var _graphics				 : Shape	= new Shape();
		
		public function Wall(str:String)
		{
			super();
			
			_this = this ;  
			
			initUI(str);
		}
		
		private function initUI(str:String):void
		{
			if (str == CAN_WALK)
			{
				_graphics.graphics.lineStyle(0.1, 0x564654);
				_graphics.graphics.beginFill(0x564654);
			}
			else if (str == CAN_NOT_WALK)
			{
				_graphics.graphics.lineStyle(0.1, 0x999999);
				_graphics.graphics.beginFill(0x999999);
			}
			
			_graphics.graphics.drawRect(0, 0, SIDE, SIDE);
			
			_this.addChild(_graphics);
			
			reSize();
		}
		
		private function reSize():void
		{
			_graphics.x = 0 - _graphics.width / 2 ; 
			_graphics.y = 0 - _graphics.height / 2 ; 
		}
	}
}