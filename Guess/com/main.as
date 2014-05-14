package com
{
	import com.Center;
	import com.qupy.logic.*;
	
	import fl.controls.Button;
	import fl.controls.List;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize; 
	
	public class main extends MovieClip
	{
		private var _this	 	: MovieClip ; 
		private var _numPopup	: NumPopup		= new NumPopup();
		private var _resetBtn	: Button		= new Button(); 
		private var _submitBtn	: Button		= new Button(); 
		private var _showAnsBtn	: Button		= new Button(); 
		private var _resultTxt	: TextField		= new TextField();
		private var _list		: List			= new List();
		
		private var _math		: int			= 0 ; 
		private var _ansIcon	: Array			= [] ; 
		private var _inputIcon	: Array			= [] ; 
		private var _randomArray: Array			= [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
		private var _ansArray	: Array			= getAnsArray() ; 
		
		public function main()
		{
			super() ; 
			
			_this = this ; 
			
			initUI(); 
			initClass();
		}
		
		private function initUI():void
		{
			_list.width				= _this.stage.stageWidth ; 
			_list.height			= 160 ; 
			_list.y					= 340 ; 
			
			_resetBtn.buttonMode	= true ; 
			_submitBtn.buttonMode	= true ;
			_showAnsBtn.buttonMode	= true ; 			
			
			_resetBtn.label			= 'Reset';
			_resetBtn.width 		= 50 ;  
			_resetBtn.height		= 25 ; 
			_resetBtn.x				= 0 ; 
			_resetBtn.y				= _this.stage.stageHeight - _resetBtn.height - _list.height - 25;  
	
			_showAnsBtn.label		= 'Look Answer';
			_showAnsBtn.width		= 100 ; 
			_showAnsBtn.height		= 25 ;
			_showAnsBtn.x			= _this.stage.stageWidth - _showAnsBtn.width;  
			_showAnsBtn.y			= _this.stage.stageHeight - _showAnsBtn.height - _list.height - 25;  
	
			_submitBtn.label		= 'Answer';
			_submitBtn.width		= 80 ; 
			_submitBtn.height		= 25 ;
			_submitBtn.x			= (_this.stage.stageWidth - _submitBtn.width) / 2 ;  
			_submitBtn.y			= _this.stage.stageHeight - _submitBtn.height - _list.height - 25;  
		
			for (var i : int = 0 ; i < 4 ; i++)
			{
				var tmpObj : AnsItem = new AnsItem();
				tmpObj.x			 = 50 + (i * 100) + (20 * i) ; 
				tmpObj.y			 = 30 ;
				_ansIcon.push(tmpObj);
				_this.addChild(tmpObj);
			}
			
			for (i = 0 ; i < 4 ; i++)
			{
				var tmpObj2 : InputItem = new InputItem();
				tmpObj2.x				= 50 + (i * 100) + (20 * i);
				tmpObj2.y				= 150 ; 
				_inputIcon.push(tmpObj2);
				_this.addChild(tmpObj2);
			}
			
			_numPopup.alpha				= 0 ; 
			_numPopup.visible			= false;  
			
			_resultTxt.autoSize			= TextFieldAutoSize.LEFT;
			_resultTxt.defaultTextFormat= new TextFormat('Arial', 16) ;
			_resultTxt.width			= _this.stage.stageWidth ; 
			_resultTxt.selectable		= false ; 
			_resultTxt.mouseEnabled		= false ;  
			_resultTxt.text				= '......................';
			_resultTxt.x				= (_this.stage.stageWidth - _resultTxt.textWidth) / 2;  
			_resultTxt.y				= _this.stage.stageHeight - 50 - _list.height - 25;
			
			_this.addChild(_resultTxt);
			_this.addChild(_resetBtn);
			_this.addChild(_showAnsBtn);
			_this.addChild(_submitBtn);
			_this.addChild(_list);
			_this.addChild(_numPopup);			
		}
		
		private function initClass():void
		{
			_resetBtn.addEventListener(MouseEvent.CLICK, resetHandler);
			_showAnsBtn.addEventListener(MouseEvent.CLICK, showAnsHandler);
			_submitBtn.addEventListener(MouseEvent.CLICK, submitHandler);
			
			for (var i : int = 0 ; i < _inputIcon.length ; i++)
			{
				_inputIcon[i].addEventListener(MouseEvent.CLICK, inputHandler);
			}
		}
		
		private function inputHandler(ev:MouseEvent):void
		{
			Center.inputOb = ev.currentTarget ; 
			_numPopup.show(Center.inputOb, _inputIcon);
		}
		
		private function resetHandler(ev:MouseEvent):void
		{
			_list.removeAll();
			_math				= 0 ; 
			_resultTxt.text		= '......................';
			_resultTxt.x		= (_this.stage.stageWidth - _resultTxt.textWidth) / 2;  
	
			_ansArray = getAnsArray();
	
			for (var i : int = 0 ; i < _inputIcon.length ; i++)
			{
				_inputIcon[i].text	= 'ans'; 
			}
	
			for (i = 0 ; i < _ansIcon.length ; i++)
			{
				_ansIcon[i].text	= '?'; 
			}
		}

		private function showAnsHandler(ev:MouseEvent):void
		{
			for (var i : int = 0 ; i < _ansIcon.length ; i++)
			{
				_ansIcon[i].text	= _ansArray[i]; 
			}
		}		
		
		private function submitHandler(ev:MouseEvent):void
		{
			_math ++ ; 
			
			var tmpa : int = 0 ; 
			var tmpb : int = 0 ; 
			
			for (var i : int = 0 ; i < _ansArray.length ; i++)
			{
				if (_inputIcon[i].text != 'ans')
				{
					if (_ansArray[i] == int(_inputIcon[i].text))
					{
						tmpa ++ ;
					}
				}
				
				for (var j : int = 0 ; j < _inputIcon.length ; j++)
				{
					if (_inputIcon[j].text != 'ans')
					{
						if (_ansArray[i] == int(_inputIcon[j].text) &&
							_ansArray[j] != int(_inputIcon[j].text))
						{
							tmpb ++ ; 
						}
					}
				}
			}
			
			if (tmpa == 4 && tmpb == 0)
			{
				_list.addItem({label:'恭喜你猜對了', value:_math});
				_resultTxt.text	= '恭喜你猜對了';
				_resultTxt.x	= (_this.stage.stageWidth - _resultTxt.textWidth) / 2;
			}
			else
			{
				_list.addItem({label:'猜第' + _math + '次: ' + tmpa + 'A ' + tmpb + 'B' + '(' + _inputIcon[0].text + ', ' + _inputIcon[1].text + ', ' + _inputIcon[2].text + ', ' + _inputIcon[3].text + ')', value:_math});
				_resultTxt.text	= '猜第' + _math + '次: ' + tmpa + 'A ' + tmpb + 'B';
				_resultTxt.x	= (_this.stage.stageWidth - _resultTxt.textWidth) / 2;  
			}
		}
		
		private function getAnsArray():Array
		{
			var returnArr	: Array	= [null,null,null,null] ; 
			var tempArr 	: Array = _randomArray.slice(); 
	
			for (var i : int = 0 ; i < 4 ; i++)
			{
				var tempInt	= int(Math.random() * tempArr.length) ; 
				returnArr[i] = tempArr[tempInt] ; 
				tempArr.splice(tempInt, 1);
			}
			return returnArr ; 
		}
	}
}
