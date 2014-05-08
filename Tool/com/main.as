package com
{
	import com.qupy.tools.*;
	
	import flash.display.MovieClip;

	public class main extends MovieClip
	{
		private var _this	 : MovieClip ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			
			trace('最大公約數=' + Mathematics.getHCF(30,6,9,12,15,18,21,24,27,33,36));
		}
	}
}
