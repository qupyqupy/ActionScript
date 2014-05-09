package com
{
	import com.adobe.images.JPEGEncoderFast;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	public class main extends MovieClip
	{
		private var _this	 	: MovieClip ; 
		private var _imgLoader	: Loader			= new Loader();
		private var _imgByteArr	: ByteArray ; 
		private var _file	 	: FileReference 	= new FileReference();
		private var _jpgEnc	 	: JPEGEncoderFast	= new JPEGEncoderFast(100);
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			init(); 
		}
		
		private function init():void
		{
			_imgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			_imgLoader.load(new URLRequest('http://truth.bahamut.com.tw/s01/201109/e1c650dd57ba66c2659c198bbeff7269.JPG'));
		}
		
		private function completeHandler(ev:Event):void
		{
			_imgLoader.x = 300 ; 
			_imgLoader.y = 300 ; 
			_this.addChild(_imgLoader);
			
			createBitmap();
		}
		
		private function createBitmap():void
		{
			var bitmapdata 	: BitmapData = new BitmapData(150, 150, true, 0x000000);
			var matrix		: Matrix	 = new Matrix();
			
			matrix.tx = -400 ; 
			matrix.ty = -400 ; 
			
			bitmapdata.draw(_this, matrix);
			
			_imgByteArr = _jpgEnc.encode(bitmapdata);
			
			_file.save(_imgByteArr, 'sample.jpg');
		}
	}
}
