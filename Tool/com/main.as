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
			trace('隨機取得值=' + Mathematics.getRandomVal([30,6,9,12,15,18,21,24,27,33,36]));
			trace('重新排列陣列=' + Mathematics.getRandomArray([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]));
		}
	}
}
