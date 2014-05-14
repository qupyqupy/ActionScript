package com.qupy.logic
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;

	public class InputItem extends MovieClip
	{
		private var _this 		: MovieClip ; 
		private var _bg			: Shape			= new Shape();
		private var _txt		: TextField		= new TextField();
		private var _textFormat	: TextFormat	= new TextFormat('Arial', 50, 0x942671);	

		public function InputItem()
		{
			super();
		
			_this = this ; 
		
			initUI();
		}
		
		private function initUI():void
		{
			_this.buttonMode 		= true ;
			
			with(_bg.graphics)
			{
				lineStyle(1, 0x000000, 0);
				beginFill(0x649731);
				drawRect(0, 0, 100, 100);
				endFill();
			}
		
			_txt.selectable 		= false ; 
			_txt.mouseEnabled		= false ; 
			_txt.defaultTextFormat	= _textFormat ; 
			_txt.autoSize			= TextFieldAutoSize.LEFT ; 
			_txt.width 				= _bg.width ; 
			_txt.height				= _bg.height ; 
			_this.text				= 'ans';
		
			_this.addChild(_bg);
			_this.addChild(_txt);
		}
	
		private function reSize():void
		{
			_txt.x = (_bg.width - _txt.textWidth) / 2 ; 
			_txt.y = (_bg.height - _txt.textHeight) / 2 ; 
		}
	
		public function set text(val:String):void
		{
			_txt.text = val ;  
			reSize();
		}
		
		public function get text():String
		{
			return _txt.text ; 
		}
	}
}