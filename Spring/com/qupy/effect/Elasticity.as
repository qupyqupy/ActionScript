/**
 * Qupy
 * 彈簧的類，功用可以讓傳入的 MovieClip 具有彈簧的移動效果
 * 當靠近周圍 _radius 的範圍內，就會啟動
 * 調整_parameterA、_parameterB可以改變整個視覺的效果
 * 緩動方式分為兩種，１、自動（在一定的範圍內自動吸附在滑鼠指標上）
 * 　　　　　　　　　２、手動拉（用滑鼠指標去拖拉目標）
 * _updataFun是在本類可視物件在緩動時調用的方法
 **/
package com.qupy.effect
{
	import flash.display.MovieClip; 
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Elasticity
	{
		public static const DRAG_MODE	 : String = 'dragmode';
		public static const AUTO_MODE	 : String = 'automode';
		public static const CLOSE_MODE	 : String = 'closemode';
		
		private var _this		 : MovieClip ; 
		private var _parent		 : MovieClip ;
		
		private var _radius		 : Number		 = 100 ; 
		private var _parameterA	 : Number		 = 0.6 ; 	
		private var _parameterB	 : Number		 = 0.5 ; 	
		private var _startX		 : Number ; 
		private var _startY		 : Number ; 
		private var _xSpeed		 : Number ; 
		private var _ySpeed		 : Number ; 
		private var _disX		 : Number ; 
		private var _disY		 : Number ; 
		private var _targetX	 : Number ; 
		private var _targetY	 : Number ; 
		private var _updataFun	 : Function		 = new Function();
		
		public function Elasticity(obj:MovieClip):void
		{
			_this	 = obj ; 
			_parent	 = MovieClip(_this.parent) ; 
			
			initInformation();
		}		
		
		private function initInformation():void
		{
			_startX	 = _this.x ;  
			_startY	 = _this.y ;
			_xSpeed	 = 0 ;  
			_ySpeed	 = 0 ;  
			_disX	 = 0 ;  
			_disY	 = 0 ;  
			_targetX = 0 ;  
			_targetY = 0 ; 
		}
		
		private function mouseDragHandler(ev:Event):void
		{
			if (ev.type == Event.ENTER_FRAME)
			{
				_this.x = _parent.mouseX;  
				_this.y = _parent.mouseY; 
				
				_updataFun(); 
			}
			else if (ev.type == MouseEvent.MOUSE_DOWN)
			{
				_this.addEventListener(Event.ENTER_FRAME, mouseDragHandler);
				_this.stage.addEventListener(MouseEvent.MOUSE_UP, mouseDragHandler);
				_this.removeEventListener(Event.ENTER_FRAME, backSquareHandler);
			}
			else if (ev.type == MouseEvent.MOUSE_UP)
			{
				_this.removeEventListener(Event.ENTER_FRAME, mouseDragHandler);
				_this.stage.removeEventListener(MouseEvent.MOUSE_UP, mouseDragHandler);
				_this.addEventListener(Event.ENTER_FRAME, backSquareHandler);
			}
		}
		
		private function backSquareHandler(ev:Event):void
		{
			_disX	 = _parent.mouseX - _startX ;  
			_disY	 = _parent.mouseY - _startY ; 
			
			_targetX = _startX ;  
			_targetY = _startY ; 
			_xSpeed	 = (_targetX - _this.x) * _parameterA + _xSpeed * _parameterB ; 
			_this.x	 += _xSpeed ; 
			_ySpeed	 = (_targetY - _this.y) * _parameterA + _ySpeed * _parameterB ; 
			_this.y	 += _ySpeed ; 
			
			_updataFun(); 
			
			if (_this.x == _targetX  && _this.y == _targetY)
			{
				_this.removeEventListener(Event.ENTER_FRAME, backSquareHandler); 
			}
		}
		
		private function autoHandler(ev:Event):void
		{
			_disX = _parent.mouseX - _startX ;  
			_disY = _parent.mouseY - _startY ; 
			
			if (Math.sqrt(_disX * _disX + _disY * _disY) < _radius)
			{
				_targetX = _parent.mouseX ;  
				_targetY = _parent.mouseY ;  
			}
			else
			{
				_targetX = _startX ;  
				_targetY = _startY ; 
			}
			
			_xSpeed = (_targetX - _this.x) * _parameterA + _xSpeed * _parameterB ; 
			_this.x += _xSpeed ; 
			_ySpeed = (_targetY - _this.y) * _parameterA + _ySpeed * _parameterB ; 
			_this.y += _ySpeed ; 
			
			_updataFun();
		}
		
		public function set runMode(val:String):void
		{
			_this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDragHandler);
			_this.removeEventListener(Event.ENTER_FRAME, autoHandler);
			
			if (val == DRAG_MODE)
			{
				_this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDragHandler);
			}
			else if (val == AUTO_MODE)
			{
				_this.addEventListener(Event.ENTER_FRAME, autoHandler);
			}
		}
		
		public function set radius(val:Number):void
		{
			_radius = val ; 
		}
		
		public function set parameterA(val:Number):void
		{
			_parameterA = val ; 
		}
		
		public function set parameterB(val:Number):void
		{
			_parameterB = val ;
		}
		
		public function set updataFun(fun:Function):void
		{
			_updataFun = fun ; 
		}
	}
}

