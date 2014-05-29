package com
{
	import com.qupy.tools.Captcha;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class main extends MovieClip
	{
		private var _this		: MovieClip ; 
		
		private var _reSel		: Sprite		= new Sprite();
		private var _sound		: Sprite		= new Sprite();
		private var _captcha	: Captcha		= new Captcha();
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
			initClass();
		}
		
		private function initUI():void
		{
			with(_reSel.graphics)
			{
				lineStyle(1);
				beginFill(0x123456);
				drawRect(0, 0, 30, 30);
				endFill();
			}
			
			with(_sound.graphics)
			{
				lineStyle(1);
				beginFill(0x654321);
				drawRect(0, 0, 30, 30);
				endFill();
			}
			
			_reSel.x 		= 50 ; 
			_sound.x 		= 100 ; 
			
			_reSel.y 		= 100 ; 
			_sound.y 		= 100 ; 
			
			_captcha.width 	= 200 ;  
			_captcha.height = 80 ; 
			_captcha.fontSize = [30, 40, 50, 60];
			
			_this.addChild(_reSel);
			_this.addChild(_sound);
			_this.addChild(_captcha);
		}
		
		private function initClass():void
		{
			_reSel.addEventListener(MouseEvent.CLICK, reSelHandler);
			_sound.addEventListener(MouseEvent.CLICK, soundHandler);
		}
		
		private function reSelHandler(ev:MouseEvent):void
		{
			_captcha.createCode();
		}
		
		private function soundHandler(ev:MouseEvent):void
		{
			_captcha.voice();
		}
	}
}