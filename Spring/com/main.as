package com
{
	import com.qupy.effect.Elasticity;
	
	import flash.display.MovieClip;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _demoUI	 : MovieClip 	= new MovieClip(); 
		
		private var _demo	 : Elasticity ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
			initClass();
		}
		
		private function initUI():void
		{
			with(_demoUI.graphics)
			{
				lineStyle(1);
				beginFill(0x000099);
				drawRect(-50, -50, 100, 100);
			}
			
			_this.addChild(_demoUI);
			
			reSize();
		}
		
		private function initClass():void
		{
			_demo = new Elasticity(_demoUI);
			_demo.runMode = Elasticity.DRAG_MODE ; 
		}
		
		private function reSize():void
		{
			_demoUI.x = 300 ; 
			_demoUI.y = 300 ; 
		}
	}
}
