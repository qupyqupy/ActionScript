package com.qupy.event
{
	import flash.events.Event;
	
	public class MapEvent extends Event
	{
		public static const TERRAIN_DISPLAY		: String		= 'terraindisplay';
		
		public function MapEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}