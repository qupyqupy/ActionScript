package com
{
	import com.qupy.tools.*;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _val	 : int			= 0 ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			//改變物件顏色
			Behavior.changeColor(_this.obj, 0xff000);
			
			trace('最大公約數=' + Mathematics.getHCF(30,6,9,12,15,18,21,24,27,33,36));
			trace('隨機取得值=' + Mathematics.getRandomVal([30,6,9,12,15,18,21,24,27,33,36]));
			trace('重新排列陣列=' + Mathematics.getRandomArray([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]));
			trace('兩點之間的距離=' + Mathematics.getDistance(new Point(_this.obj.x, _this.obj.y), new Point(_this.mouseX, _this.mouseY)));
			trace('String.Format=' + StringUtil.stringFormat('我是{GodName},你是{GodName}的奴隸,奴隸的名字是{SuperManName},我們要一起去打{BadManName},然後把漂亮的公主{GirlName}救回來',{mark:'GodName', change:'Qupy'}, {mark:'SuperManName', change:'Arach'}, {mark:'BadManName', change:'Brsaker'}, {mark:'GirlName', change:'Caster'}));
			trace('時間格式=' + StringUtil.timeFormat(86));
			
			_this.addEventListener(Event.ENTER_FRAME, moveHandler);
			_this.stage.addEventListener(MouseEvent.MOUSE_DOWN, walkHandler);
		}
		
		private function walkHandler(ev:Event):void
		{
			
			if (ev.type == Event.ENTER_FRAME)
			{
				_this.obj.x += _this.obj.mx ; 
				_this.obj.y += _this.obj.my ; 
			}
			else if (ev.type == MouseEvent.MOUSE_DOWN)
			{
				var tmpObj : Object = Mathematics.getAngelMove(_this.obj.rotation, 30);
				_this.obj.mx = tmpObj.x ; 
				_this.obj.my = tmpObj.y ; 
				_this.addEventListener(Event.ENTER_FRAME, walkHandler);
				_this.removeEventListener(Event.ENTER_FRAME, moveHandler);
			}			
		}
		
		private function moveHandler(ev:Event):void
		{
			//取得兩點之間的角度
			_this.obj.rotation = Mathematics.getRotation(new Point(_this.obj.x, _this.obj.y), new Point(_this.mouseX, _this.mouseY));
			
			//計算物件的圓形軌跡
			/*_val ++ ; 			
			if (_val % 5 == 0)
			{
				var tmp : Point = Mathematics.getCircularTrack(new Point(_this.obj.x, _this.obj.y), new Point(500, 300), 100);
				_this.obj.x = tmp.x ;
				_this.obj.y = tmp.y ; 
			}*/
			
		}
	}
}
