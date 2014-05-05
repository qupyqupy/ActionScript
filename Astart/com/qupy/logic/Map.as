package com.qupy.logic
{
	import com.qupy.calculate.AStart;
	import com.qupy.logic.map.Wall;
	
	import flash.display.Sprite;
	import flash.display.Shape;
	
	public class Map extends Sprite
	{
		private var _this	 : Sprite ; 
		private var _path	 : Shape 	= new Shape();
		
		private var _pathArr : Array	= [] ;
		private var _mapArr	 : Array = [
				   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,1,1,1,1],
				   [1,1,1,0,1,1,1,0,0,0,0,1,0,1,0,1,0,1,1,1,1,1],
				   [1,0,1,1,1,1,1,0,0,0,0,1,0,1,0,1,0,1,1,1,1,1],
				   [1,0,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				   [1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1],
				   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0,1,1,1,0,0],
				   [0,1,1,0,1,1,1,0,0,0,0,1,0,1,0,1,0,1,1,0,1,1],
				   [1,1,1,1,1,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1,1,1],
				   [1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
				   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
				   [1,0,0,1,0,0,0,1,1,1,1,0,1,1,0,0,1,1,0,0,0,0]
				   ];
		
		
		public function Map()
		{
			super();
			
			_this = this ;  
			
			initUI();
		}
		
		private function initUI():void
		{
			for (var i : int = 0 ; i < _mapArr.length ; i++)
			{
				for (var j : int = 0 ; j < _mapArr.length ; j++)
				{
					var tmpWall : Wall = new Wall((_mapArr[i][j] == 0)?(Wall.CAN_NOT_WALK):(Wall.CAN_WALK))
					tmpWall.x = i * Wall.SIDE ; 
					tmpWall.y = j * Wall.SIDE ; 
					_this.addChild(tmpWall);
				}
			}
			
			_this.addChild(_path);
			
			_pathArr = AStart.aStartFindWay(_mapArr, {x:0,y:10}, {x:19,y:13});
			
			if (_pathArr.length == 1)
			{
				trace('no Way')
			}
			
			_path.graphics.lineStyle(3, 0x5599ff);
			_path.graphics.moveTo(_pathArr[0].x * Wall.SIDE, _pathArr[0].y * Wall.SIDE);
			
			for (i = 0 ; i < _pathArr.length ;i++)
			{
				_path.graphics.lineTo(_pathArr[i].x * Wall.SIDE, _pathArr[i].y * Wall.SIDE);
			}
		}
	}
}