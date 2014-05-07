package com.qupy.logic
{
	import com.Center;
	import com.qupy.base.BaseTerrain;
	import com.qupy.event.MapEvent;
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Map extends MovieClip
	{
		private const TERRAIN_WIDTH		: Number		= 50 ;
		private const TERRAIN_HEIGHT	: Number		= 35 ;
		
		private var _this 				: MovieClip ; 
		
		private var _terrainArray		: Array			= [] ; 		
		
		public function Map()
		{
			super();
				
			_this	= this ; 			
		}
		
		private function initUI():void
		{			
			var count	: int		= 100 ; 
			var bx 		: Number 	= 150 ; 
			var by 		: Number 	= 30 ;  
			var lx 		: Number 	= bx ; 
			var ly 		: Number 	= by ; 
			
			for (var i : int = 1 ; i <= count ; i++)
			{	
				var tmpArr : Array = [] ; 
				
				for (var j : int = 1 ; j <= 100 ; j++)
				{
					var tmp : BaseTerrain = new BaseTerrain(TERRAIN_WIDTH, TERRAIN_HEIGHT, Math.random() * 30);
					tmp.x 				= lx ; 
					tmp.y 				= ly ; 
					tmp.cacheAsBitmap	= true ; 
					tmp.indexV			= i ; 
					tmp.indexH			= j ; 
					tmpArr.push(tmp);
				
					lx += TERRAIN_WIDTH / 2 ;
					ly += TERRAIN_HEIGHT / 2 ; 
				
					_this.addChild(tmp);
				}
				
				_terrainArray.push(tmpArr);
				
				bx -=  TERRAIN_WIDTH / 2;
				by +=  TERRAIN_HEIGHT / 2;

				lx = bx;
				ly = by;
			}
		}
		
		private function changeMapCoordinate():void
		{
			var tp	: Point	= new Point(Center.player.x, Center.player.y);			
			Center.effect.toMove(_this, Center.player.moveTime * 5, new Point(((_this.stage.stageWidth / 2) - _this.localToGlobal(tp).x + _this.x), ((_this.stage.stageHeight / 2) - _this.localToGlobal(tp).y + _this.y)));
			Center.eventDispatcher.dispatchEvent(new MapEvent(MapEvent.TERRAIN_DISPLAY));
		}		
		
		public function init():void
		{
			initUI();
		}
		
		public function playCoordinate(val:int, val2:int):Boolean
		{
			if (String(_terrainArray[val]) != 'undefined'  && String(_terrainArray[val][val2]) != 'undefined')
			{
				Center.effect.bezierCurves(Center.player, Center.player.moveTime, new Point(_terrainArray[val][val2].hx, _terrainArray[val][val2].hy), switchDepths);
				
				function switchDepths():void
				{
					_this.setChildIndex(Center.player, _this.numChildren - 1);
					_this.setChildIndex(Center.player, _this.getChildIndex(_terrainArray[val][val2]) + 1);	
				}
				
				changeMapCoordinate();
				return true ; 
			}
			else
			{
				return false ; 
			}
		}
		
		public function get terrainArray():Array
		{
			return _terrainArray;
		}
	}
}