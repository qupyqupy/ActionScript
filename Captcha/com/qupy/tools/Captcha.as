package com.qupy.tools
{
	import com.qupy.tools.captcha.CaptchaVoice;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;  
	import flash.geom.Matrix; 
	
	public class Captcha extends Sprite
	{
		private var _this		: Sprite;
		private var _txt		: TextField 	= new TextField() ;
		private var _txtTft		: TextFormat 	= new TextFormat() ;
		private var _bmd		: BitmapData;
		private var _bmp		: Bitmap;
		private var _voice		: CaptchaVoice	= new CaptchaVoice();
		private var _bg			: Shape			= new Shape(); 
		
		private var _length		: int 			= 5;
		private var _width		: Number 		= 5;
		private var _height		: Number 		= 5;
		private var _charW		: Number		= _width / _length ; 
		private var _charH		: Number		= _height ;  
		private var _char		: String 		= 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgihklmnopqrstuvwxyz0123456789';
		private var _code		: String;
		private var _fontSize	: Array 		= [14, 16, 18, 20, 22]; 
		
		public function Captcha()
		{
			super();

			_this 	= this;	

			initUI();
		}
		
		private function initUI():void
		{
			_txt.autoSize 	= TextFieldAutoSize.LEFT;
			_txtTft.bold	= true ; 
			_txtTft.size	= _fontSize[int(Math.random() * _fontSize.length)]
			
			_bmd 			= new BitmapData(_width, _height, true, 0);
			_bmp 			= new Bitmap(_bmd, 'auto', true);
			
			_this.addChild(_bg);
			_this.addChild(_bmp);
			
			createCode();
		}
		
		private function reSize():void
		{
			with(_bg.graphics)
			{
				clear(); 
				lineStyle(1, 0x888888);
				drawRect(0, 0, _width, _height);
				endFill();
			}
			
			_charW 			= _width / _length ; 
			_charH			= _height ;  
			
			_bmd			= null ; 
			_bmd			= new BitmapData(_width, _height, true, 0);
			_bmp.bitmapData	= _bmd ; 
			
			_bmd.fillRect(_bmd.rect, 0);
			
			for (var i : int = 0 ; i < _length ; i++)
			{
				_txt.text 		= _code.charAt(i);
				_txtTft.size	= _fontSize[int(Math.random() * _fontSize.length)];
				
				_txt.setTextFormat(_txtTft);
				
				var tempBmd : BitmapData = new BitmapData(_charW, _charH, true , 0);
				tempBmd.draw(_txt);
				var tempBmp	: Bitmap	 = new Bitmap(tempBmd, 'auto', true);
				tempBmp.rotation  = Math.random() * 50 - 25 ; 
				var sprite	: Sprite	 = new Sprite();  
				sprite.addChild(tempBmp);
				var matrix	: Matrix	 = new Matrix(1, 0, 0, 1, i * _charW + 2, 0); 
				_bmd.draw(sprite, matrix);
			}
		}
		
		public function voice():void
		{
			_voice.char = _code ; 
		}

		public function createCode():void
		{
			_voice.stop();
			
			_code = '';
			
			for (var i : int = 0 ; i < _length ; i++)
			{
				_code += _char.charAt(int(Math.random() * _char.length));
			}
			
			_code = _code.toLowerCase();
			
			reSize();
		}

		public function set length(val:int):void
		{
			_length = val;
			
			reSize();
		}
		
		public function set fontSize(val:Array):void
		{
			_fontSize = val ; 
			
			reSize();
		}
		
		public function get code():String
		{
			return _code ; 
		}
		
		override public function set width(val:Number):void
		{
			_width = (val <= _length) ? (_length) : (val) ; 
		}
		
		override public function set height(val:Number):void
		{
			_height = (val <= _length) ? (_length) : (val) ; 
			
			reSize();
		}
		
		override public function get width():Number
		{
			return _width ; 
		}
		
		override public function get height():Number
		{
			return _height ;
		}
	}
}
