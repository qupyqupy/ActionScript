package com.qupy.calculate.astart
{
	public class IndexModels
	{
		private var _x : int;
		private var _y : int;

		public function IndexModels(vx:int,vy:int)
		{
			_x = vx;
			_y = vy;
		}

		public function get x():int
		{
			return _x;
		}

		public function get y():int
		{
			return _y;
		}

		public function set x(val:int):void
		{
			_x = val;
		}

		public function set y(val:int):void
		{
			_y = val;
		}
	}

}