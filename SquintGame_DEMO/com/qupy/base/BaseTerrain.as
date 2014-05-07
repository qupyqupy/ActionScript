package com.qupy.base
{
	import com.Center;
	import com.qupy.event.MapEvent;
	
	import flash.display.Shape;
	
	public class BaseTerrain extends Shape
	{
		private var _this 	: Shape ; 
		private var _w		: Number ; 
		private var _h		: Number ; 
		private var _l		: Number ; 
		private var _hx		: Number ; 
		private var _hy		: Number ; 
		private var _indexH	: int ; 
		private var _indexV	: int ; 
		
		public function BaseTerrain(w:Number, h:Number, l:Number)
		{
			super();
				
			_this	= this ; 
			_w		= w ; 
			_h		= h ; 
			_l		= l ; 
			
			initClass();
			drawTerrain();
		}
		
		private function initClass():void
		{
			Center.eventDispatcher.addEventListener(MapEvent.TERRAIN_DISPLAY, displayHandler);
		}
		
		private function drawTerrain():void
		{
			with(_this.graphics)
			{
				clear();
				lineStyle(1, 0xffffff);
				beginFill(0x000000);
				moveTo(_w / 2, 0 - _l);
				lineTo(_w, _h / 2 - _l);
				lineTo(_w / 2, _h - _l);
				lineTo(0, _h / 2 - _l);
				lineTo(_w / 2, 0 - _l);
	
				lineStyle(1, 0xffffff);
				beginFill(0x555555);
				moveTo(0, _h / 2 - _l);
				lineTo(0, _h / 2);
				lineTo(_w / 2, _h);
				lineTo(_w / 2, _h - _l);
	
				lineStyle(1, 0xffffff);
				beginFill(0xcccccc);
				moveTo(_w / 2, _h);
				lineTo(_w / 2, _h - _l);
				lineTo(_w, _h / 2 - _l);
				lineTo(_w, _h / 2);
				endFill();
			}
			
			_hx	= (_w + 0) / 2 ; 
			_hy = ((0 - _l) + (_h - _l)) / 2 ;
		}
		
		/**
		 * 控制地形塊地顯現
		 **/
		private function displayHandler(ev:MapEvent):void
		{
			if ((Math.abs(Center.player.indexH - _indexH) + Math.abs(Center.player.indexV - _indexV)) < 20)
			{
				_this.visible = true ; 
			}
			else
			{
				_this.visible = false ; 
			}
		}
		
		public function get hx():Number
		{
			return _hx + _this.x ; 
		}
		
		public function get hy():Number
		{
			return _hy + _this.y ; 
		}
		
		public function set w(val:Number):void
		{
			_w = val ;
			drawTerrain();
		}
		
		public function set h(val:Number):void
		{
			_h = val ;
			drawTerrain();
		}
		
		public function set l(val:Number):void
		{
			_l = val ;
			drawTerrain();
		}
		
		public function set indexH(val:int):void
		{
			_indexH = val ; 
		}
		
		public function set indexV(val:int):void
		{
			_indexV = val ; 
		}
	}
}