package model
{
	import flash.display.Stage;
	import flash.geom.Point;
	
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class GameInfo extends Proxy
	{
		public static const NAME:String='GameInfo';
		protected var _stage:Stage;
		
		public function GameInfo(data:Stage)
		{
			_stage=data;
			super(NAME, data);
		}
		public function get mouseCoord():Stage{
			
			return _stage;
		}
	}
}