package
{
	import flash.display.Sprite;
	
	[SWF (width=833,7, height=600,25, backgroundColor=0xFFFFFF)]
	public class arcanoid extends Sprite
	{
		public function arcanoid()
		{
			GameFacade.getInstance().init(this);
		}
	}
}