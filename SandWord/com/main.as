package com
{
	import com.qupy.effect.SandWord;
	
	import flash.display.MovieClip;
	import flash.text.TextFormat;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
		}
		
		private function initUI():void
		{
			var tmp : SandWord = new SandWord('Qupy是一個超級謙虛的天才', new TextFormat('Arial', 50, 0x115599, true));
			_this.addChild(tmp);
			
			tmp.x = 300 ; 
			tmp.y = 300 ; 
			tmp.StartParticle();
		}
	}
}
