package com
{
	import com.Center;
	import com.qupy.effect.Effect;
	import com.qupy.logic.Map;
	import com.qupy.logic.Player;
	
	import flash.display.MovieClip;
	
	public class main extends MovieClip
	{		
		private var _this 		: MovieClip ; 

		private var _mapUI		: Map			= new Map();
		private var _playerUI	: Player		= new Player();
		
		public function main()
		{
			_this = this ; 
			
			initUI();
		}
		
		private function initUI():void
		{
			Center.effect		= new Effect();
			
			Center.map			= _mapUI ; 
			Center.player		= _playerUI ; 
			
			_mapUI.addChild(_playerUI);
			_this.addChild(_mapUI);
			
			Center.map.init();
			Center.player.init();
		}
	}
}