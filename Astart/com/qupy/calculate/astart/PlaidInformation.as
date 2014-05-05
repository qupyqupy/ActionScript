package com.qupy.calculate.astart
{
	import com.qupy.calculate.astart.IndexModels;
	
	public class PlaidInformation
	{
		private var _g			 : Number = 0 ;
		private var _h			 : Number = 0 ;  
		private var _f			 : Number = 0  ; 
		private var _indexArr	 : Array = [] ; 
		
		public function PlaidInformation()
		{

		}
		
		public function set g(val:Number):void
		{
			_g = val ; 
		}
		
		public function set h(val:Number):void
		{
			_h = val ; 
		}
		
		public function set f(val:Number):void
		{
			_f = val ; 
		}
		
		public function set route(obj:IndexModels):void
		{
			_indexArr.push(obj);
		}
		
		public function set routeSlice(arr:Array):void
		{
			_indexArr = arr.concat();
		}
		
		public function get g():Number
		{
			return _g ; 
		}
		
		public function get h():Number
		{
			return _h ; 
		}
		
		public function get f():Number
		{
			return _f ; 
		}
		
		public function get routeSlice():Array
		{
			return _indexArr;
		}
	}
}