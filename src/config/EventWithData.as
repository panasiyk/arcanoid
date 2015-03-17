package config
{
	import flash.events.Event;
	
	public class EventWithData extends Event
	{
		protected var _data:Object;
		
		public function EventWithData(type:String, data:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this._data=data;
			super(type, bubbles, cancelable);
		}
		
		public function get data():Object{
			return _data;
		}
		
		public function set data(value:Object):void{
			_data=value;
		}
	}
}