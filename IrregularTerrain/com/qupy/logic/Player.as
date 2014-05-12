package com.qupy.logic
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	
	public class Player extends Sprite
	{
		private var _this 		: Sprite ; 
		private var _graphcis	: MovieClip = new player();
		
		public function Player():void
		{			
			super();
			
			_this 	= this ; 
			
			initUI();
		}
		
		private function initUI():void
		{
			_this.addChild(_graphcis);
		}
		
	}
}