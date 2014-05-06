package com
{
	import com.qupy.effect.RandomTxt;
	
	import flash.display.MovieClip;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _demo	 : RandomTxt	= new RandomTxt(); 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
		}
		
		private function initUI():void
		{
			_this.addChild(_demo);
			_demo.x = 300 ; 
			_demo.y = 300 ; 
			
			_demo.text = 'I am Qupy, I am very storng, and I am very love code, and I am very love play game.';
			_demo.start();
		}
	}
}
