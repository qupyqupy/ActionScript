package com.qupy.logic
{
	import com.Center;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.setTimeout;
	
	public class Player extends MovieClip
	{
		private var _this 		: MovieClip ; 
		private var _modeling	: Sprite 		= new Sprite(); 
		private var _indexV		: int			= 0 ; 
		private var _indexH		: int			= 0 ; 
		private var _moveTime	: Number		= 0.3 ; 
		private var _isMoved	: Boolean		= false ; 		
		
		public function Player()
		{
			super();
				
			_this	= this ; 		
		}
		
		private function initUI():void
		{
			with(_modeling.graphics)
			{
				lineStyle(1, 0x000000);
				beginFill(0xffffff);
				drawCircle(0, 0, 10);				
			}		
			
			_this.addChild(_modeling);
			
			Center.map.playCoordinate(_indexV, _indexH);
		}
		
		private function initClass():void
		{
			_this.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function keyDownHandler(ev:KeyboardEvent):void
		{
			if (_isMoved) return ; 
			
			_isMoved = true ; 
			
			if (ev.keyCode == Keyboard.HOME || ev.keyCode == Keyboard.LEFT)
			{
				_indexH -= 1 ; 
			}
			else if (ev.keyCode == Keyboard.PAGE_UP || ev.keyCode == Keyboard.UP)
			{
				_indexV -= 1 ; 
			}
			else if (ev.keyCode == Keyboard.PAGE_DOWN || ev.keyCode == Keyboard.RIGHT)
			{
				_indexH += 1 ; 
			}
			else if (ev.keyCode == Keyboard.END || ev.keyCode == Keyboard.DOWN)
			{
				_indexV += 1 ; 
			}
			
			if(Center.map.playCoordinate(_indexV, _indexH))
			{
				setTimeout(function(){
						   _isMoved = false ;
						   }, _moveTime * 1000)
			}
			else
			{
				if (ev.keyCode == Keyboard.HOME || ev.keyCode == Keyboard.LEFT)
				{
					_indexH += 1 ; 
				}
				else if (ev.keyCode == Keyboard.PAGE_UP || ev.keyCode == Keyboard.UP)
				{
					_indexV += 1 ; 
				}
				else if (ev.keyCode == Keyboard.PAGE_DOWN || ev.keyCode == Keyboard.RIGHT)
				{
					_indexH -= 1 ; 
				}
				else if (ev.keyCode == Keyboard.END || ev.keyCode == Keyboard.DOWN)
				{
					_indexV -= 1 ; 
				}
				
				_isMoved = false ; 
			}
		}
		
		public function init():void
		{
			initUI();
			initClass();
		}
		
		public function get moveTime():Number
		{
			return _moveTime ; 
		}	
		
		public function get indexH():int
		{
			return _indexH ; 
		}
		
		public function get indexV():int
		{
			return _indexV ; 
		}
	}
}