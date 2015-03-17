package controller
{
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.BallPanelMediator;
	import view.BallViewLogic;
	
	public class StartCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void
		{
			facade.registerMediator(new BallPanelMediator());
		}
	}
}