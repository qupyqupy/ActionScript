package com.qupy.effect
{
	import com.gs.*;
	import com.gs.easing.*;
	import com.gs.plugins.*;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Effect
	{		
		public function Effect()
		{
			TweenPlugin.activate([AutoAlphaPlugin]);
			TweenPlugin.activate([BezierPlugin]);
		}
		
		/**
		 * 貝茲曲線的移動
		 **/
		public function bezierCurves(obj:Object, sec:Number, target:Point, fun:Function = null):void
		{
			TweenMax.to(obj, sec, {bezier:[{x:(obj.x + target.x) / 2, y:(obj.y + target.y) / 2 - 50}, {x:target.x, y:target.y}], onComplete:fun, ease:Quad.easeIn});
		}
		
		/**
		 * 普通位移
		 **/
		 public function toMove(obj:Object, sec:Number, target:Point):void
		 {
			TweenMax.to(obj, sec, {bezier:[{x:target.x, y:target.y}], ease:'none'});
		 }
				
		/**
		 * 淡入之後淡出
		 * sec => 淡入後幾秒後淡出
		 */
		public function fadeInAndOut(obj:Object, sec:Number):void
		{
			TweenMax.killTweensOf(obj, true);
			TweenLite.to(obj, 0.6, {autoAlpha:1, onComplete:fadeOut});
			
			function fadeOut():void
			{
				TweenLite.to(obj, 0.4, {autoAlpha:0, delay:sec});
			}
		}		
		
		/**
		 * 控制物件淡入淡出
		 */
		 public function alphaTween(obj:Object, second:Number, target:Number, fun:Function, val:Array):void
		 {
			 TweenMax.killTweensOf(obj, true);
			 TweenLite.to(obj, second, {autoAlpha:target, onComplete:fun, onCompleteParams:val});
		 }
		 		
		/**
		 * 當滑鼠滑過的時候，按鈕物件會變暗，滑出時恢復正常
		 */
		public function basicBtnEffect(mc:Object):void
		{
			mc.addEventListener(MouseEvent.ROLL_OVER, eventHandler);
			mc.addEventListener(MouseEvent.ROLL_OUT, eventHandler);
			
			function eventHandler(ev:MouseEvent):void
			{
				if (ev.type == MouseEvent.ROLL_OVER)
				{
					TweenMax.to(mc, 0.5, {colorMatrixFilter:{colorize:0x333333, amount:0.3}});
				}
				else if (ev.type == MouseEvent.ROLL_OUT)
				{
					TweenMax.to(mc, 0.3, {colorMatrixFilter:{colorize:0x333333, amount:0}});
				}
			}
		}		
	}
}