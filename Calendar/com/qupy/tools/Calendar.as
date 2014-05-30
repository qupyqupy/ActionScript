package com.qupy.tools
{	
	public class Calendar
	{
		private var _days		: Array = [0,31,59,90,120,151,181,212,243,273,304,334];;
		private var _monthDay	: Array = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		
		public function Calendar():void
		{
			
		}
		
		private function isLeap(year:int):Boolean
		{
			if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
			{
				return true ; 
			}
			else
			{
				return false ; 
			}
		}
		
		public function monthDays(year:int, month:int):int
		{
			if (month == 2)
			{
				if (isLeap(year))
				{
					return _monthDay[month] + 1;
				}
				else
				{
					return _monthDay[month];
				}
			}
			else
			{
				return _monthDay[month];
			}
		}
		
		public function elapsedDays(year:int, month:int, day:int):int
		{
			var tmp : int = _days[month - 1] + day + ((isLeap(year) && month > 2) ? (1) : (0));
			return tmp ;
		}
		
		public function weekDay(year:int, month:int, day:int):int
		{
			var tmp : int = ((year-1) + (year-1)/4 - (year-1)/100 + (year-1)/400 + elapsedDays(year, month, day)) % 7 ; 
			return tmp ; 
		}
	}
}