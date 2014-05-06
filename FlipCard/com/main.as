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
			_demo = new FlipCard('http://photos.supremepsychics.com/images/psy/streams/l/1/LovePsychic1_th_213.jpg', 'http://photos.supremepsychics.com/images/psy/streams/d/l/DivineAngel_th_213.jpg');
			_this.addChild(_demo);
			
			_demo.x = 500 ; 
			_demo.y = 200 ; 
		}
	}
}
