/**
 * @ qupy
 * A星尋路程式，用於2D平面尋路，當地圖陣列內的值變成'X'，代表該區域被Close
 * 傳入的二維陣列，內容分別為０或是１，０代表不可移動，１代表可移動
 * ---------------------------------------------------------------------
 * 座標由左上角開始算起來
 * 0123456
 * 1
 * 2
 **/
package com.qupy.calculate
{
	import com.qupy.calculate.astart.* ; 
	
	public class AStart
	{
		private static const AREA_CLOSE	: String = 'X';
		
		/**
		 * 傳入［地圖陣列(二維陣列)，起始點索引、終點索引、是否計算斜邊路徑］
		 * 回傳每一步的陣列［X索引、Y索引、方向］如果回傳的陣列只有一個長度，代表目前沒有路可以
		 **/		
		public static function aStartFindWay(map:Array, sc:Object, ec:Object, bevel:Boolean = false):Array
		{
			var i,j			 : int ;
			var checkHavWay	 : Boolean		 = true ; 
			var si			 : IndexModels	 = new IndexModels(sc.x, sc.y);
			var ei			 : IndexModels	 = new IndexModels(ec.x, ec.y);
			var sliceArr	 : Array		 = map.concat();
			var tmpW		 : int			 = sliceArr.length ; 
			var tmpH		 : int			 = sliceArr[0].length ; 
			
			for (i = 0 ; i < tmpW ; i++)
			{
				for (j = 0 ; j < tmpH ; j++)
				{
					if (map[i][j] == 0)
					{
						sliceArr[i][j] = AREA_CLOSE;
					}
					else
					{
						sliceArr[i][j] = new PlaidInformation();
					}
				}
			}
			
			sliceArr[si.x][si.y].g = 0 ; 
			aStartFindHandler(si);
			
			/**
			 * 檢查方法(八方檢查)
			 **/
			function aStartFindHandler(obj:IndexModels):void
			{							
				sliceArr[obj.x][obj.y].route = obj ; 
				
				var compareG		 : Number = sliceArr[obj.x][obj.y].g + 1;
				var compareBevelG	 : Number = sliceArr[obj.x][obj.y].g + 1.41;
				var k,m				 : int ; 
				
				for (k = -1 ; k <= 1 ; k++)
				{
					var wBolA : Boolean = (obj.x + k) >=0 ; 
					var wBolB : Boolean = (obj.x + k) < tmpW ; 
					
					if ( wBolA && wBolB)
					{
						for(m = -1 ; m <= 1 ; m++)
						{
							var tmpWx : int		 = obj.x + k ; 
							var tmpWy : int		 = obj.y + m ; 
							var hBolA : Boolean	 = (obj.y + m) >=0 ; 
							var hBolB : Boolean	 = (obj.y + m) < tmpH ; 
							var hBolC : Boolean	 = (k!=0 || m!=0) ; 
							var hBolD : Boolean	 = sliceArr[tmpWx][tmpWy] != AREA_CLOSE;
							
							if ((hBolA && hBolB) && (hBolC) && (hBolD))
							{
								//判斷是不是斜角，加的變量不一樣
								var isBevel : Boolean = ((k ==-1 && m == -1) || (k == 1 && m == 1) || (k == -1 && m == 1) || (k == 1 && m == -1));
								
								if (!(isBevel && !bevel))
								{								
									var tmpIndexModels	 : IndexModels	 = new IndexModels(tmpWx,tmpWy) ; 
									var g				 : Number		 = (isBevel)?(compareBevelG):(compareG);
									var h				 : Number		 = Estimation.euclidian(ei, tmpIndexModels);
									var f				 : Number		 = g + h ; 
									
									sliceArr[tmpWx][tmpWy].g			 = g ;
									sliceArr[tmpWx][tmpWy].h			 = h ;
									sliceArr[tmpWx][tmpWy].f			 = f ;
									sliceArr[tmpWx][tmpWy].routeSlice	 = sliceArr[obj.x][obj.y].routeSlice;
									
									//假如到終點的話就回家
									if (tmpWx == ei.x && tmpWy == ei.y)
									{
										sliceArr[tmpWx][tmpWy].route = new IndexModels(ei.x, ei.y) ; 
										return 
									}
								}
							}
						}
					}
				}
				
				sliceArr[obj.x][obj.y] = AREA_CLOSE;
				
				//檢查有最低F的IndexModels做遞回
				var compareX : int		 = -1 ;  
				var compareY : int		 = -1 ; 
				var compareF : Number	 = 0 ;  
				
				for (k = 0 ; k < tmpW ; k++)
				{
					for (m = 0 ; m < tmpH ; m++)
					{
						if (sliceArr[k][m] != AREA_CLOSE && sliceArr[k][m].f != 0)
						{
							if (compareF == 0 || sliceArr[k][m].f < compareF)
							{
								compareF = sliceArr[k][m].f ; 
								compareX = k ; 
								compareY = m ;
							}
						}
					}
				}
				
				if (compareX == -1 || compareY == -1)
				{
					checkHavWay = false ; 
				}
				else
				{
					aStartFindHandler(new IndexModels(compareX, compareY));
				}
			}
			
			if (checkHavWay)
			{
				return sliceArr[ei.x][ei.y].routeSlice;
			}
			else
			{
				return [new IndexModels(si.x, si.y)];
			}
		}
	}
}