package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	
	public class Inventar extends MovieClip{

		private var _itemListe:Array = new Array();
		private var _container:DisplayObjectContainer;
		
		private var _preparedCombineItem:Item;
		
													 
		
		
		public function Inventar() {

			this.addEventListener(Event.ENTER_FRAME, EnterAFrame);
		}
		
		private function EnterAFrame(evt:Event){
			for(var i = 0; i<_itemListe.length; i++) {
				_itemListe[i].x = this.x + 100*i + 55;
				_itemListe[i].y = this.y + 50;
			}
			
			if(_preparedCombineItem != null) {
				_preparedCombineItem.x = stage.mouseX;
				_preparedCombineItem.y = stage.mouseY;
			}
			
			
		}
		
		public function PrepareToCombine(item:Item){
			_preparedCombineItem = item;
			_container.setChildIndex(_preparedCombineItem, _container.numChildren-1);
			_preparedCombineItem.addEventListener(MouseEvent.MOUSE_UP, dropItem);
			
		
		}
		
		private function dropItem(evt:Event){
			/// ITEM COLLISION CHECK
			for(var i = 0; i<_itemListe.length; i++) {
				if(_preparedCombineItem.hitTestObject(_itemListe[i]) && _preparedCombineItem != _itemListe[i]){
					CombiningCheck(_itemListe[i]);
				}
			}
			
			_preparedCombineItem.addEventListener(MouseEvent.MOUSE_UP, dropItem);
			_preparedCombineItem = null;
			
		}
		
		private function CombiningCheck(item:Item){
			trace("combined");

			
		}
		
		public function AddItem(item:Item) {
			if(_container == null)
				_container = item.GetContainer();
			_itemListe.push(item);
			
		}
		
		public function RemoveItem(item:Item) {
			var tmpArray:Array = new Array();
			for(var i = 0; i<_itemListe.length; i++) {
				if(_itemListe[i].name != item.name){
					tmpArray.push(item);
				}
			}
			_itemListe = tmpArray;
		}
		
		public function CombineItem(item1:Item, item2:Item) {
			
		}
		
		
		
		
	}
	
}
