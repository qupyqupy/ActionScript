/**
 * Qupy
 * 改變物件屬性的行為
 **/
 
package com.qupy.tools
{
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	import flash.geom.Transform;
	
	public class Behavior
	{
		/**
		 * 改變物件的顏色
		 **/
		public static function changeColor(obj:DisplayObject, color:uint):void
		{
			var trans 		: Transform		 = new Transform(obj);
			var colorTrans	: ColorTransform = new ColorTransform();
			
			colorTrans.color 		= color;
			trans.colorTransform	= colorTrans;
		}
	}
}
