/**
 * Qupy
 * 以亂數顯示內容的文字框
 **/
package com.qupy.effect
{
	import flash.events.TimerEvent;
	import flash.text.TextField ; 
	import flash.text.TextFieldAutoSize ;
	import flash.utils.Timer;
	
	public class RandomTxt extends TextField
	{
		private var _this 		: TextField ;  
		private var _timer		: Timer				= new Timer(10);
		
		private var _mark		: Number			= 0 ; 
		private var _willTxt	: String			= '' ; 
		private var _willTxtLen	: int				= _willTxt.length ;  
		private var _txtArr		: Vector.<String> 	= new Vector.<String>;
		private var _txt		: String 			= '0123456789/*-+.abcdefghijklnmopqrstuvwxyzABCEFGHIJKLMNOPQRSTUVWXYZ';
		private var _txtLen		: int				= _txt.length ; 
		
		public function RandomTxt():void
		{
			super();
			
			_this = this ; 
			
			initUI();
			initClass();
		}
		
		private function initUI():void
		{
			_this.autoSize = TextFieldAutoSize.LEFT ; 
		}
		
		private function initClass():void
		{
			_timer.addEventListener(TimerEvent.TIMER, timeUpHandler);
		}
		
		private function timeUpHandler(ev:TimerEvent):void
		{
			var tmpStr : String = '' ;  
			var ranStr : int ; 
			
			for (var i : int = 0 ; i < _willTxtLen ; i++)
			{
				ranStr = Math.floor(Math.random() * _txtLen);
				
				if (i > _mark)
				{
					tmpStr += _txt.charAt(ranStr)
				}
				else
				{
					tmpStr += _txtArr[i] ; 
				}
			}
			
			_this.text  = tmpStr ; 
			_mark 		+= 1 
			
			if (_mark >= _willTxtLen)
			{
				_timer.stop();
			}
		}
		
		public function start(val:int = 10):void
		{
			_timer.delay = val;
			
			_txtArr		 = null 
			_txtArr		 = new Vector.<String>;
			_mark		 = 0 ; 
			
			_willTxt	 = _this.text ; 
			_willTxtLen	 = _willTxt.length ; 
			_txtLen		 = _txt.length ; 
			
			for (var i : int = 0 ; i < _willTxtLen ; i++)
			{
				_txtArr.push(_willTxt.charAt(i));
			}
			
			_timer.start();
		}
		
		public function stop():void
		{
			_mark = 0 ; 
			_timer.stop();
		}
		
		public function set txt(val:String):void
		{
			if (_txt != '')
			{
				_txt = val ; 
			}
		}
	}
}