package view
{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	
	public class BallViewLogic extends EventDispatcher
	{
		protected var _ball:MovieClip;
		protected var _panel:MovieClip;
		protected var ballSpeedX:Number=4;
		protected var ballSpeedY:Number=4;
		protected var speed:Number=4;
		
		public function BallViewLogic(ball:MovieClip,panel:MovieClip)
		{
			super();
			_ball=ball;
			_panel=panel;
			_ball.rotation=300;
			
		}
		public function moveBall():void
		{
			bounceWalls();
			if(_ball.hitTestObject(_panel)){
				calcBallAngle();
			}
			
			_ball.x-=speed*Math.cos(_ball.rotation*(Math.PI/180));
			_ball.y-=speed*Math.sin(_ball.rotation*(Math.PI/180));
		}
		
		private function calcBallAngle():void
		{
			var ballPosition:Number = _ball.x -_panel.x;
			var hitPercent:Number = (ballPosition / (_panel.width - _ball.width)) - 0.5;
			_ball.rotation = hitPercent * 10;
			//ballSpeedY *=-1;
		}
		
		private function bounceWalls():void
		{
		if (_ball.stage==null)
		{return}
		
		if(_ball.x+(0.5*_ball.width) >= _ball.stage.stageWidth-_ball.width){//правая сторона
			if(_ball.rotation<=90){
				_ball.rotation=180-_ball.rotation;
			}
			else{
			_ball.rotation=180+(360-_ball.rotation);
			}
		}
		//левая сторона
		if(_ball.x-(0.5*_ball.width) <= 0){
			if(_ball.rotation<=90){
				_ball.rotation=180-_ball.rotation;
			}
			else{
				_ball.rotation=180+(360-_ball.rotation);
			}
		}
		//нижняя сторона
		if(_ball.y+(0.5*_ball.height) >= _ball.stage.stageHeight-_ball.height){
			if(_ball.rotation<=270){
				_ball.rotation=_ball.rotation-90;
			}
			else{
				_ball.rotation=_ball.rotation+180;
			}
		}
		//верхняя сторона
		if(_ball.y-(0.5*_ball.height) <= 0){
			if(_ball.rotation<=90){
				_ball.rotation=360-_ball.rotation;
			}
			else{
			_ball.rotation=180+(180-_ball.rotation);
				}
			
		}
		}
	}
}