package view
{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.ui.Mouse;
	
	public class PanelViewLogic extends EventDispatcher
	{
		protected var _panel:MovieClip;
		public function PanelViewLogic(data:MovieClip)
		{
			_panel=data;
			super();
		}
		public function movePanel():void
		{
			Mouse.hide();
			if (_panel.stage==null)
			{return}
			_panel.x= _panel.stage.mouseX-_panel.width;
			if(_panel.stage.mouseX < _panel.width / 2){
				_panel.x = 0;
			}
			if(_panel.stage.mouseX > _panel.stage.stageWidth - _panel.width / 2){
				_panel.x = _panel.stage.stageWidth - _panel.width;
			}
		}
	}
}