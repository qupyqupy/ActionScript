/**
 * 不規則地形圖
 **/
package com.qupy.calculate
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	public class IrregularTerrain extends Sprite
	{
		public static const WALK_FORWARD	: String 		= 'walkforward';
		public static const WALK_REVERSE	: String		= 'walkreverse';
		
		private var _this 			: Sprite ;
		private var _source			: MovieClip ;
		private var _bmp			: Bitmap ;
		private var _bmpdata		: BitmapData ;
		
		public function IrregularTerrain(obj:MovieClip):void
		{			
			super();
			
			_this 	= this ; 
			_source	= obj ;
			
			initUI();
		}
		
		private function initUI():void
		{
			_bmpdata		 = new BitmapData(_source.width, _source.height, true, 0);
			_bmpdata.draw(_source);
			_bmp			 = new Bitmap(_bmpdata);
			_bmp.smoothing	 = true ; 
			_bmp.filters	 = [new GlowFilter(0, 1, 2, 2, 8, 1)];
			_this.addChild(_bmp);
		}
		
		private function getAngel(p1:Point, p2:Point, direct:String = WALK_FORWARD):Number
		{
			var angel : Number = Math.atan2(Math.abs(p1.y - p2.y), Math.abs(p1.x - p2.x)) / Math.PI * 180 ; 
			
			if (direct == WALK_FORWARD)
			{
				if (p1.y > p2.y)
				{
					angel = 360 - angel ; 
				}
			}
			else if (direct == WALK_REVERSE)
			{
				if (p2.y > p1.y)
				{
					angel = 360 - angel ; 
				}
			}
			return angel ; 
		}
		
		public function initLocation(speed:Number):Object
		{
			var p1 		: Point ;
			var p2 		: Point ; 
			
			for (var i : Number = 0 ; i < _bmpdata.width ; i += speed)
			{
				for (var j : Number = 0 ; j < _bmpdata.height ; j += 1)
				{
					if (_bmpdata.getPixel32(i, j) != 0 &&
						_bmpdata.getPixel32(i, j -1) == 0)
					{
						if (i == 0)
						{
							p1 = new Point(i, j);
						}
						
						if (i == (0 + speed))
						{
							p2 = new Point(i, j);
						}						
					}
					
					if (p1 != null && p2 != null)
					{
						break; 
					}
				}
				
				if (p1 != null && p2 != null)
				{
					break; 
				}
			}
			
			return {x:i, y:j, rotation:getAngel(p1, p2)};
		}
		
		public function getLocation(p1:Point, p2:Point, direct:String = WALK_FORWARD):Object
		{
			var i 		: Number = 0 ;  
			var angel 	: Number ; 
			
			for (i = 0 ; i < _bmpdata.height ; i += 1)
			{
				if (_bmpdata.getPixel32(p2.x, i) != 0 &&
					_bmpdata.getPixel32(p2.x, i - 1))
				{
					p2.y = i ; 
					break; 
				}
			}
			
			angel = getAngel(p1, p2, direct);
			
			for (i = 0 ; i < _bmpdata.height ; i += 1)
			{
				if (_bmpdata.getPixel32(p2.x, i) != 0 &&
					_bmpdata.getPixel32(p2.x, i - 1))
				{
					p2.y = i ; 
					break; 
				}
			}
			
			return {x:p2.x, y:p2.y, rotation:angel};
		}
	}
}