package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.DisplayObjectContainer;
	
	public class Item extends MovieClip{

		private var _inventar:Inventar;

		private var _name:String;
		private var _suitableItem:Item;
		private var _container:DisplayObjectContainer;
		private var _stored:Boolean = false;
		
		public function Item() {
			this.addEventListener(MouseEvent.CLICK, ItemPicked);
			this.buttonMode = true;
		}
		
		public function GetContainer():DisplayObjectContainer {
			return _container;
		}
		
		private function ItemPicked(evt:MouseEvent){
			var dc:DisplayObjectContainer = evt.target.parent;

			if(_inventar == null)
				for (var i:uint = 0; i < dc.numChildren; i++)
				{
					var element = dc.getChildAt(i);
					if (element is Inventar)
					{
						_inventar = element;
						
					}
				}
			_inventar.AddItem(this);
			_stored = true;
			this.removeEventListener(MouseEvent.CLICK, ItemPicked);
			this.addEventListener(MouseEvent.CLICK, StoredItemClicked);	
		}
		
		private function StoredItemClicked(evt:MouseEvent){
			_inventar.PrepareToCombine(this);
		}

	}
	
}
