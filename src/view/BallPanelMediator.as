package view
{
	import config.GeneralNotification;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	import mx.core.mx_internal;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class BallPanelMediator extends Mediator
	{
		public static const NAME:String='BallPanelMediator';
		protected var objPanelLogic:PanelViewLogic;
		protected var objBallLogic:BallViewLogic;
		protected var _stage:Stage;
		public function BallPanelMediator()
		{
			super(NAME);
			onRegister();
		}
		override public function onRegister():void
		{
			var panel:MovieClip;
			var ball:MovieClip;
			var gamepage:levels= new levels;
			sendNotification(GeneralNotification.addVisualElement,gamepage); 
			panel=(gamepage['panel']as MovieClip);
			objPanelLogic= new PanelViewLogic(panel);
			ball=(gamepage['ball']as MovieClip);
			objBallLogic= new BallViewLogic(ball,panel);
			gamepage.addEventListener(Event.ENTER_FRAME,call);
		}
		
		protected function call(event:Event):void
		{
			objPanelLogic.movePanel();
			objBallLogic.moveBall();
		}
	}
}