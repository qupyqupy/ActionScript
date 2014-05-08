/**
 * Qupy
 * 文字格式的處理
 **/
 
package com.qupy.tools
{
	
	public class StringUtil
	{
		/**
		 * 類似C的String.Format的方法
		 * stringFormat('我是{GodName},你是{GodName}的奴隸,奴隸的名字是{SuperManName},我們要一起去打{BadManName},然後把漂亮的公主{GirlName}救回來',{mark:'GodName', change:'Qupy'}, {mark:'SuperManName', change:'Arach'}, {mark:'BadManName', change:'Brsaker'}, {mark:'GirlName', change:'Caster'})
		 * 傳回來［我是Qupy,你是Qupy的奴隸,奴隸的名字是Arach,我們要一起去打Brsaker,然後把漂亮的公主Caster救回來］
		 **/
		public static function stringFormat(string:String, ... args):String
		{
			var tmpStr	: String = string ;
			var tmpArr	: Array  = args.slice() ;
			var tmpLen	: int 	 = tmpArr.length ;
			var i		: int ;
			
			for (i = 0 ; i < tmpLen ; i++)
			{
				tmpStr = tmpStr.replace(new RegExp((("\\{" + tmpArr[i]['mark']) + "\\}"), "gm"), tmpArr[i]['change']);
			}
			return tmpStr;
		}
		
		/**
		 * 傳入整數秒數，回傳時間格式
		 * Sample : 傳入66，回傳00:01:06
		 **/		
		public static function timeFormat(val:int):String
		{
			var second	: int = val % 60 ;  
			var min		: int = (val / 60) ; 
			var hour	: int = min / 60 ; 
			min = min % 60 ; 
			
			var tmpStr	: String  = ((String(hour).length == 1)?('0' + hour):(hour)) + ':' 
									+ ((String(min).length == 1)?('0' + min):(min)) + ':' 
									+ ((String(second).length == 1)?('0' + second):(second));
			return tmpStr ; 
		}
	}
}
