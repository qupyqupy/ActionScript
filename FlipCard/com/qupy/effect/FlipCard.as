package com.qupy.effect
{
	import com.gs.* ; 
	import com.gs.easing.* ; 
	import com.gs.plugins.* ; 
	import com.qupy.effect.flipcard.ImgSprite;
	
	import flash.display.Sprite;  
	import flash.events.MouseEvent;
	
	public class FlipCard extends Sprite
	{
		private var _this		 : Sprite ; 
		private var _fSprite	 : ImgSprite ;
		private var _bSprite	 : ImgSprite ; 
		
		private var _callBack	 : Function		= function(val:Boolean){};
		private var _isFront	 : Boolean		= true ; 
		private var _furl		 : String ; 
		private var _burl		 : String ; 
		
		public function FlipCard(fimg:String, bimg:String):void
		{
			super();
			
			_this = this ; 
			_furl = fimg ; 
			_burl = bimg ; 
			
			initUI();
			initClass(); 
		}
		
		private function initUI():void
		{
			_fSprite = new ImgSprite(_furl);
			_bSprite = new ImgSprite(_burl);
			
			_this.addChild(_bSprite);
			_this.addChild(_fSprite);
		}
		
		private function initClass():void
		{
			_this.addEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function clickHandler(ev:MouseEvent):void
		{
			if (_this.rotationY > 90)
			{
				turnFront();
			}
			else if (_this.rotationY <= 90)
			{
				turnBack();
			}
		}
		
		private function turnFront():void
		{
			TweenMax.to(_this, 1 ,{bezier:[], rotationY:0, onUpdate:checkDepths, onComplete:flipComplete});
		}
		
		private function turnBack():void
		{
			TweenMax.to(_this, 1, {bezier:[], rotationY:180, onUpdate:checkDepths, onComplete:flipComplete});			
		}
		
		private function checkDepths():void
		{
			if (_this.rotationY > 90 && _this.getChildIndex(_bSprite) == 0)
			{
				_this.setChildIndex(_bSprite, _this.numChildren - 1);
			}
			else if (_this.rotationY <= 90 && _this.getChildIndex(_fSprite) == 0)
			{
				_this.setChildIndex(_fSprite, _this.numChildren - 1);
			}
		}
		
		private function flipComplete():void
		{
			if (_this.rotationY > 90)
			{
				_isFront = false ; 
			}
			else if (_this.rotationY <= 90)
			{
				_isFront = true ; 
			}
			
			_callBack(_isFront);
		}
		
		public function set callBack(fun:Function):void
		{
			_callBack = fun ; 
		}
	}
}