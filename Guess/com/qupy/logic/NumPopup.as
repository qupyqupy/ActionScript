package com.qupy.logic
{
	import com.Center;
	import com.gs.*;
	import com.gs.easing.*;
	import com.gs.plugins.*;	
	
	import fl.controls.Button;	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;  

	public class NumPopup extends MovieClip
	{
		private var _this 		: MovieClip ; 
		private var _bg			: PopupBg		= new PopupBg();
		
		private var _listX		: int			= -40 ; 
		private var _listY		: int			= -40 ;
		private var _array		: Array			= [];
		
		public function NumPopup()
		{
			super();
		
			_this = this ; 
		
			initUI();
		}
		
		private function initUI():void
		{
			_this.addChild(_bg);
			
			for (var i : int = 0 ; i < 10 ; i++)
			{
				var tmpBtn : Button = new Button(); 
				tmpBtn.label	= String(i);
				tmpBtn.width	= 20 ;  
				tmpBtn.height	= 17 ;  
				tmpBtn.x		= _listX ; 
				tmpBtn.y		= _listY ;
				
				_listX			= _listX + tmpBtn.width + 8 ;  
				
				if (_listX > 25)
				{
					_listX = -40 ; 
					_listY = _listY + tmpBtn.height + 5 ;
				}
				
				tmpBtn.addEventListener(MouseEvent.CLICK, clickHandler);
				_this.addChild(tmpBtn);
				_array.push(tmpBtn);
			}		
		}
		
		private function clickHandler(ev:MouseEvent):void
		{
			Center.inputOb.text = ev.currentTarget.label ; 
			hide();
		}
		
		private function hide():void
		{
			_this.visible = false ; 
		}
		
		public function show(obj:Object, arr:Array):void
		{
			_this.visible 	= true ;  
			_this.alpha 	= 0 ;  
			_this.x			= obj.x + _this.width - 30 ;  
			_this.y			= obj.y + _this.height ; 
			
			TweenMax.killTweensOf(_this, true);
			TweenLite.to(_this, 0.5, {autoAlpha:1});
			
			for (var i : int = 0 ; i < _array.length ; i++)
			{
				_array[i].enabled = true ; 
			}
			
			for (i = 0 ; i < arr.length ; i++)
			{
				if (arr[i].text != 'ans')
				{
					_array[int(arr[i].text)].enabled = false ; 
				}
			}
		}
	}
}