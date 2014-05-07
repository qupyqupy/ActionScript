package com 
{
	import com.qupy.effect.Effect;
	import com.qupy.logic.Map;
	import com.qupy.logic.Player;
	
	import flash.events.EventDispatcher;
	
	public class Center
	{
		public static var eventDispatcher	: EventDispatcher = new EventDispatcher();
		public static var effect			: Effect ; 
		
		public static var map				: Map ; 
		public static var player			: Player ;
	}
}