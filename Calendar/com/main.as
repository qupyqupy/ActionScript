package com
{
	import com.qupy.tools.Calendar;
	
	import flash.display.MovieClip;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		private var _calendar: Calendar		= new Calendar();
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			trace(_calendar.elapsedDays(2016, 5, 30));
			trace(_calendar.weekDay(2084, 7, 13));
			trace(_calendar.monthDays(2016, 2));
		}
	}
}
