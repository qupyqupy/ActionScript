package com.qupy.effect
{
	import com.qupy.events.SandWordEvent;
	import com.qupy.effect.sandword.SandSprite ; 
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class SandWord extends MovieClip
	{
		public static const DISPATCHER	: EventDispatcher 	= new EventDispatcher(); 
		
		private var _this		 		: MovieClip ; 
		private var _txt				: TextField			= new TextField(); 
		private var _bitmapdata			: BitmapData ; 
		private var _textFormat			: TextFormat ;
		private var _word				: String ; 
		
		public function SandWord(val:String, format:TextFormat):void
		{
			super();
			
			_this 			= this ; 
			_word			= val ; 
			_textFormat		= format ; 
			
			initUI();
		}
		
		private function initUI():void
		{
			_txt.autoSize 			= TextFieldAutoSize.LEFT;
			_txt.defaultTextFormat 	= _textFormat ; 
			_txt.text 				= _word ; 
			
			_bitmapdata 			= new BitmapData(_txt.width, _txt.height, false, 0x000000);
			_bitmapdata.draw(_txt);
			
			
			var tmpVal 	: int = 0 ; 
			var tmpColor: uint; 
			
			for (var i : int = 0 ; i < _bitmapdata.width ; i++ )
			{
				for (var j : int = 0 ; j < _bitmapdata.height ; j++)
				{
					tmpColor = _bitmapdata.getPixel(i,j);
					
					if (tmpColor != 0x000000)
					{
						tmpVal++
						
						var tmpSprite : SandSprite = new SandSprite(tmpColor, i, j);
						_this.addChild(tmpSprite);
					}
				}
			}
		}
		
		public function StartParticle():void
		{
			DISPATCHER.dispatchEvent(new SandWordEvent(SandWordEvent.START_MOVE));
		}
		
		public function StopParticle():void
		{
			DISPATCHER.dispatchEvent(new SandWordEvent(SandWordEvent.STOP_MOVE));
		}
		
		public function RemoveParticle():void
		{
			DISPATCHER.dispatchEvent(new SandWordEvent(SandWordEvent.KILL_SELF));
		}
	}
}

