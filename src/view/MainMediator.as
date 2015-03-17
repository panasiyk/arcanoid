package view
{
	import config.GeneralNotification;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MainMediator extends Mediator
	{
		public static const NAME:String='MainMediator';
		public function MainMediator(viewComponent:Object=null)
		{
			super(NAME,viewComponent);
		}
		override public function listNotificationInterests():Array
		{
			return [GeneralNotification.addVisualElement,
			];
		}
		override public function handleNotification(notification:INotification):void{
			
			switch(notification.getName())
			{
				case GeneralNotification.addVisualElement:
				{
					mainView.addChild(notification.getBody() as DisplayObject);
					break;
				}
			}
		}
		protected function get mainView():DisplayObjectContainer{
			return viewComponent as DisplayObjectContainer;
		}
	}
}