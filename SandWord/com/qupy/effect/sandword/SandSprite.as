package com.qupy.effect.sandword
{
	import com.gs.*; 
	import com.gs.easing.*;
	import com.gs.plugins.*;
	import com.qupy.events.SandWordEvent;
	import com.qupy.effect.SandWord;
	
	import flash.display.Sprite ; 
	import flash.display.Shape ; 
	import flash.events.Event; 
	
	public class SandSprite extends Sprite
	{
		private var _this 		: Sprite ; 	
		private var _graphics	: Shape 		= new Shape(); 
		
		private var _x	  		: Number ; 
		private var _y	  		: Number ; 
		private var _color		: uint ; 	
		private var _range		: int			= 20 ;  
		private var _sec		: Number		= 2 ; 
		
		public function SandSprite(color:uint, tx:Number, ty:Number):void
		{
			super(); 
			
			_this 	= this ;  
			_x		= tx ; 
			_y		= ty ; 
			_color	= color ; 
			
			initUI();
			initClass(); 
		}
		
		private function initUI():void
		{
			_this.x = _x ; 
			_this.y = _y ; 
			
			with(_graphics.graphics)
			{
				lineStyle(1, _color);
				beginFill(_color);
				drawRect(0, 0, 1, 1);
			}
			
			_this.addChild(_graphics);
			_this.cacheAsBitmap = true ; 
		}
		
		private function initClass():void
		{
			SandWord.DISPATCHER.addEventListener(SandWordEvent.START_MOVE, startHandler);
			SandWord.DISPATCHER.addEventListener(SandWordEvent.STOP_MOVE, stopHandler); 
			SandWord.DISPATCHER.addEventListener(SandWordEvent.KILL_SELF, removeHandler);	
			_this.addEventListener(Event.ENTER_FRAME, touchHandler);
		}
		
		private function touchHandler(ev:Event):void
		{
			if (Math.abs(_this.x - _this.parent.mouseX) < _range && 
				Math.abs(_this.y - _this.parent.mouseY) < _range)
			{
				_this.removeEventListener(Event.ENTER_FRAME, touchHandler)
				TweenMax.to(_this, _sec-1, {onComplete:backHandler, bezier:[], x:Math.random() * _this.stage.stageWidth - (_this.stage.stageWidth / 2), y:Math.random() * _this.stage.stageHeight - (_this.stage.stageHeight / 2), ease:Sine.easeInOut});
			}
		}
		
		private function backHandler():void
		{
			TweenMax.to(_this, _sec, {onComplete:addTouchLister, bezier:[], x:_x, y:_y, ease:Quad.easeIn});
		}
		
		private function addTouchLister():void
		{
			_this.addEventListener(Event.ENTER_FRAME, touchHandler) ; 
		}
		
		private function startHandler(ev:SandWordEvent):void
		{
			TweenMax.to(_this, Math.random() * _sec, {bezier:[], x:_x, y:_y, ease:Elastic.easeInOut});
		}
		
		private function stopHandler(ev:SandWordEvent):void
		{
			TweenLite.killTweensOf(_this); 
		}
		
		private function removeHandler(ev:SandWordEvent):void
		{
			_this.parent.removeChild(_this);
		}
	}
}

