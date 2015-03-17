package
{
	import config.GeneralNotification;
	
	import controller.StartCommand;
	
	import flash.display.Sprite;
	
	import model.GameInfo;
	
	import org.puremvc.as3.patterns.facade.Facade;
	
	import view.BallPanelMediator;
	import view.MainMediator;
	
	public class GameFacade extends Facade
	{
		protected static var _instance:GameFacade;
		public static function getInstance():GameFacade{
			if(_instance==null){
				_instance=new GameFacade();
			}
			return _instance;
		}
		public function init(sprite:Sprite):void
		{
			registerMediator(new MainMediator(sprite));
			registerCommand(GeneralNotification.START, StartCommand);
			sendNotification(GeneralNotification.START);
			
			
		}
	}
}