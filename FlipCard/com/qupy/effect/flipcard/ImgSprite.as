package com.qupy.effect.flipcard
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;  
	import flash.net.URLRequest;
	
	public class ImgSprite extends Sprite
	{
		private var _this		 : Sprite ;
		private var _url		 : String ; 
		private var _loader		 : Loader  = new Loader();
		
		public function ImgSprite(url:String):void
		{
			super();
			
			_this = this ; 
			_url  = url ; 
			
			init();
		}
		
		private function init():void
		{
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			_loader.load(new URLRequest(_url));
			_this.addChild(_loader);
		}
		
		private function completeHandler(ev:Event):void
		{
			_loader.x = 0 - (_loader.width) / 2 ;  
			_loader.y = 0 - (_loader.height) / 2 ; 
		}		
	}
}