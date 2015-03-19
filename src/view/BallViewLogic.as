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
		protected var speed:Number=6;
		
		public function BallViewLogic(ball:MovieClip,panel:MovieClip)
		{
			super();
			_ball=ball;
			_panel=panel;
			_ball.rotation=120;
			
		}
		public function moveBall():void
		{
			bounceWalls();
			/*if(_ball.hitTestObject(_panel)){
				calcBallAngle();
			}*/
			
			_ball.x+=speed*Math.cos(_ball.rotation*(Math.PI/180));
			_ball.y+=speed*Math.sin(_ball.rotation*(Math.PI/180));
		}
		
		/*private function calcBallAngle():void
		{
			var ballPosition:Number = _ball.x -_panel.x;
			var hitPercent:Number = (ballPosition / (_panel.width - _ball.width))-.5 ;
			_ball.rotation *= -hitPercent;
		}*/
		
		private function bounceWalls():void
		{
		if (_ball.stage==null)
		{return}
		//правая сторона
		if(_ball.x+(0.5*_ball.width) >= _ball.stage.stageWidth){
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
		if(_ball.y+(0.5*_ball.height)>= _ball.stage.stageHeight){
			_ball.rotation=360-_ball.rotation;
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