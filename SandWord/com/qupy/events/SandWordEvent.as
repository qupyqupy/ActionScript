package com.qupy.events
{
	import flash.events.Event;
	
	public class SandWordEvent extends Event
	{
		public static const START_MOVE 	: String = 'startmove';
		public static const STOP_MOVE 	: String = 'stopmove';
		public static const KILL_SELF 	: String = 'killself';
	
		public function SandWordEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable)
		}
	}
}