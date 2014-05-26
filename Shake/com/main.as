package com
{
	import flash.display.MovieClip;

	public class main extends MovieClip
	{
		private var _this	: MovieClip ; 
		private var _demo	: ShakeSprite	= new ShakeSprite();
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
		}
		
		private function initUI():void
		{
			with(_demo.graphics)
			{
				lineStyle(1);
				beginFill(0x123456);
				drawCircle(0, 0, 50);
			}
			
			_demo,x = 300 ; 
			_demo.y = 300 ; 
			_demo.scaleX = 0.3 ; 
			_demo.init();
			_demo.start();
			_this.addChild(_demo);		
		}
	}
}

import flash.display.MovieClip;
import flash.events.Event;

class ShakeSprite extends MovieClip
{
	private var _this		: MovieClip ; 
	
	private var _sx 		: Number ; 
	private var _sy 		: Number ; 
	private var _sRotation 	: Number ; 
	private var _shake		: int			= 10 ; 
	
	public function ShakeSprite():void
	{
		super();
		
		_this = this ; 
	}
	
	public function init():void
	{
		_sx 		= _this.x ; 
		_sy 		= _this.y ; 
		_sRotation	= _this.rotation ; 
	}
	
	public function start():void
	{
		_this.addEventListener(Event.ENTER_FRAME, shakeHandler);
	}
	
	private function shakeHandler(ev:Event):void
	{
		_this.x 		= Math.sin(uint(Math.random() * _shake)) + _sx;
		_this.y 		= Math.cos(uint(Math.random() * _shake)) + _sy;
		_this.rotation 	= Math.cos(uint(Math.random() * _shake)) + _sRotation;
	}
}