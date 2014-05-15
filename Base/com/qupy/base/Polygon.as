package com.qupy.base
{
	import flash.display.Sprite;  
	import flash.display.Shape; 
	import flash.geom.Point;
	
	public class Polygon extends Sprite
	{
		public static const ROUND			: String = 'round';
		public static const TRIANGEL		: String = 'triangel';
		public static const RECTANGEL		: String = 'rectangel'; 
		public static const STAR			: String = 'star'; 
		public static const PENTAGON		: String = 'pentagon';
		public static const ROUND_RECT		: String = 'roundrect';
		public static const PARALLELOGRAM	: String = 'parallelogram';
		
		private var _this 		: Sprite ;
		private var _grpahics	: Shape 	= new Shape();
		
		private var _type		: String 	= ''; 
		private var _width		: Number	= 0 ; 
		private var _height		: Number	= 0 ; 
		private var _thickness	: Number ; 
		private var _lineColor	: uint ; 
		private var _fillColor	: uint ; 
		private var _angel		: Number ; 
		private var _pan		: Number ; 
		
		public function Polygon(thickness:Number, lineColor:uint, fillColor:uint, angel:Number = 20, pan:Number = 5):void
		{
			super();
			
			_this 		= this ; 
			_thickness	= thickness ; 
			_lineColor	= lineColor ;
			_fillColor	= fillColor ; 
			_angel		= angel ; 
			_pan		= pan ; 
			
			initUI();
		}
		
		private function initUI():void
		{
			_this.addChild(_grpahics);
		}
		
		private function reSize():void
		{
			_grpahics.scaleX = _grpahics.scaleY = 1 ; 
			
			if (_type == ROUND)
			{
				drawRound();
				_grpahics.x = 0 ; 
				_grpahics.y = 0 ; 
			}
			else if (_type == TRIANGEL)
			{
				drawTriangel();
				_grpahics.x = _width / 2 ; 
				_grpahics.y = 0 ; 
			}
			else if(_type == RECTANGEL)
			{
				drawTangel();
				_grpahics.x = 0 ; 
				_grpahics.y = 0 ; 
			}
			else if (_type == STAR)
			{
				drawStar();
				_grpahics.x = _width / 2;  
				_grpahics.y = _height / 2;  
			}
			else if (_type == PENTAGON)
			{
				drawPentagon();
				_grpahics.x = _width / 2 ; 
				_grpahics.y = _height / 2;  
			}
			else if (_type == ROUND_RECT)
			{
				drawRoundRect();
				_grpahics.x = 0 ; 
				_grpahics.y = 0 ; 
			}
			else if (_type == PARALLELOGRAM)
			{
				drawParallelogram();
				_grpahics.x = 0 ; 
				_grpahics.y = 0 ; 
			}			
		}
		
		private function drawRound():void
		{
			with(_grpahics.graphics)
			{
				clear();
				lineStyle(_thickness, _lineColor);
				beginFill(_fillColor);
				drawEllipse(0, 0, _width, _height);
				endFill();
			}
		}
		
		private function drawTriangel():void
		{
			with(_grpahics.graphics)
			{
				clear();
				lineStyle(_thickness, _lineColor);
				beginFill(_fillColor);
				moveTo(0, 0);
				lineTo(-(_width / 2), _height);
				lineTo((_width / 2), _height);
				lineTo(0, 0);
				endFill();
			}
		}
		
		private function drawTangel():void
		{
			with(_grpahics.graphics)
			{
				clear();
				lineStyle(_thickness, _lineColor);
				beginFill(_fillColor);
				drawRect(0, 0, _width, _height);
				endFill();
			}
		}
		
		private function drawStar():void
		{
			var nAngleDelta : Number = (Math.PI * 2) / 5;
			var nAngle		: Number = Math.PI * (0 - 90) / 180;
			var point		: Point  = new Point(Math.cos(nAngle + nAngleDelta / 2) * (_width / 4), Math.sin(nAngle + nAngleDelta /2) * (_width / 4));
			nAngle+=nAngleDelta;
				
			_grpahics.graphics.clear();
			_grpahics.graphics.lineStyle(_thickness, _lineColor);
			_grpahics.graphics.beginFill(_fillColor);
			_grpahics.graphics.moveTo(point.x, point.y);
			
			for (var i : int = 0 ; i < 5 ; i++)
			{
				point = null ; 
				point = new Point(Math.cos(nAngle) * _width / 2, Math.sin(nAngle) * _width / 2);
				_grpahics.graphics.lineTo(point.x, point.y);
				point = null ; 
				point = new Point(Math.cos(nAngle + nAngleDelta / 2) * (_width / 4), Math.sin(nAngle+nAngleDelta / 2) * (_width / 4));
				_grpahics.graphics.lineTo(point.x, point.y);
				nAngle += nAngleDelta;
			}
			
			_grpahics.graphics.endFill();
			_grpahics.height = _height ; 
		}
		
		private function drawPentagon():void
		{
			var rotat 		: Number = 198 * Math.PI / 180;
			var nAngle		: Number = (2 * Math.PI) / 5;
			var nRadius 	: Number = (_width / 2) / Math.sin(nAngle / 2);
			var point		: Point	 = new Point((Math.cos(rotat) * nRadius), (Math.sin(rotat) * nRadius));
			
			_grpahics.graphics.clear();
			_grpahics.graphics.lineStyle(_thickness, _lineColor);
			_grpahics.graphics.beginFill(_fillColor);
			_grpahics.graphics.moveTo(point.x, point.y);
			
			for (var i : int = 1 ; i <= 5 ; i++)
			{
				point = null ; 
				point = new Point( (Math.cos((nAngle * i) + rotat) * nRadius), (Math.sin((nAngle * i) + rotat) * nRadius));
				_grpahics.graphics.lineTo(point.x, point.y);
			}
			
			_grpahics.graphics.endFill();
			_grpahics.height = _height ; 
		}
		
		private function drawRoundRect():void
		{
			with(_grpahics.graphics)
			{
				clear();
				lineStyle(_thickness, _lineColor);
				beginFill(_fillColor);
				drawRoundRect(0, 0, _width, _height, _angel, _angel);
				endFill();
			}
		}
		
		private function drawParallelogram():void
		{
			with(_grpahics.graphics)
			{
				clear();
				lineStyle(_thickness, _lineColor);
				beginFill(_fillColor);
				moveTo(_pan, 0);
				lineTo(_width + _pan, 0);
				lineTo(_width, _height);
				lineTo(0 , _height);
				lineTo(_pan, 0);
				endFill();
			}
		}
		
		public function draw(string:String, w:Number, h:Number):void
		{
			_type 	= string ;
			_width	= w ; 
			_height = h ;  
			
			reSize();
		}
		
		public function set thickness(val:Number):void
		{
			_thickness = val ; 
		}
		
		public function set lineColor(val:uint):void
		{
			_lineColor = val ; 
		}
		
		public function set fillColor(val:uint):void
		{
			_fillColor = val ; 
		}
		
		public function set angel(val:Number):void
		{
			_angel = val ; 
		}
		
		public function set pan(val:Number):void
		{
			_pan = val ;
		}
		
		override public function set width(val:Number):void
		{
			_width = val ; 
			reSize();
		}
		
		override public function set height(val:Number):void
		{
			_height = val ; 
			reSize();
		}		
	}
}