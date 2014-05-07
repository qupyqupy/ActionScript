package com
{
	import com.qupy.effect.FlipCard;
	
	import flash.display.MovieClip;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _demo	 : FlipCard ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
		}
		
		private function initUI():void
		{
			_demo = new FlipCard('http://truth.bahamut.com.tw/s01/201209/a495b09a309593c27bcfc75ccb7ef04c.JPG', 'http://truth.bahamut.com.tw/s01/201209/5dc53d488c1a6fdb94d26c74641afc94.JPG');
			_this.addChild(_demo);
			
			_demo.x = 500 ; 
			_demo.y = 200 ; 
		}
	}
}
