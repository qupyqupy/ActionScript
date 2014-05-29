package com.qupy.tools.captcha
{
	import flash.events.Event; 
	import flash.media.Sound ;
	import flash.media.SoundChannel ; 
	import flash.utils.getDefinitionByName;
	
	public class CaptchaVoice
	{
		private var _channel	: SoundChannel 	= new SoundChannel();
		private var _sound		: Sound ;
		private var _class		: Class ; 
		private var _char		: String		= '' ;
		
		public function CaptchaVoice()
		{
		}
		
		private function completeHandler(ev:Event):void
		{
			if (_char != '')
			{
				_channel.removeEventListener(Event.SOUND_COMPLETE, completeHandler);
				_channel= null ; 
				_sound 	= null ; 
				_class	= null ; 
				_class 	= getDefinitionByName('captcha' + _char.charAt(0)) as Class;
				_sound	= new _class();
				_char	= _char.substr(1, _char.length);
				_channel= _sound.play(0, 1);
				_channel.addEventListener(Event.SOUND_COMPLETE, completeHandler);
			}
		}
		
		public function stop():void
		{
			_char = '' ; 
			_channel.stop();
		}
		
		public function set char(val:String):void
		{
			_char = val.toLocaleLowerCase() ;  
			completeHandler(null);
		}
	}
}