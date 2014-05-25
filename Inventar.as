package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.DisplayObjectContainer;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	
	public class Inventar extends MovieClip{

		private var _itemListe:Array = new Array();
		private var _container:DisplayObjectContainer;
		private var _inventarIsOpen:Boolean = false;
		private var _preparedCombineItem:Item;
		private var _orgPosition:Number;
		private var _storedItem:Item;
		private var _storedItemActivated:Boolean = false;
		
													 
		
		
		public function Inventar() {
			_orgPosition = this.y;
			this.y = 2000;
			stage.addEventListener(Event.ENTER_FRAME, EnterAFrame);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, toggleInventar);
			
			
		}
		
		private function toggleInventar(evt:KeyboardEvent){
			if(evt.keyCode == 73) {
				if(_inventarIsOpen){
					this.y = 2000;
					_inventarIsOpen = false;
				}
				else {
					this.y = _orgPosition;
					_inventarIsOpen = true;
				}
			}
		}
		
		private function EnterAFrame(evt:Event){
			for(var i = 0; i<_itemListe.length; i++) {
				_itemListe[i].x = this.x + 150*(i%5) + 55;
				_itemListe[i].y = this.y + Math.floor(i/5) * 150 + 75;
			}
			
			if(_preparedCombineItem != null) {
				_preparedCombineItem.x = stage.mouseX;
				_preparedCombineItem.y = stage.mouseY;
			}
			if(_storedItem != null){
				_storedItem.x = _storedItem._itemHolder.x;
				_storedItem.y = _storedItem._itemHolder.y;
			}
		
			if(_storedItem != null && !_storedItemActivated){
				_storedItem.addEventListener(MouseEvent.CLICK, activateStoredItem);
			}
			
			if(_storedItemActivated){
				_storedItem.x = stage.mouseX;
				_storedItem.y = stage.mouseY;
				
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
				if(_preparedCombineItem.hitTestObject(_preparedCombineItem._itemHolder)){
					_storedItem = _preparedCombineItem;
					_storedItemActivated = false;
					
				}
				else if(_preparedCombineItem.hitTestObject(_itemListe[i]) && _preparedCombineItem != _itemListe[i]){
					CombiningCheck(_itemListe[i]);
				}

			}	
			_preparedCombineItem.removeEventListener(MouseEvent.MOUSE_UP, dropItem);
			_preparedCombineItem = null;
			

			
		}
		
		private function activateStoredItem(evt:MouseEvent){
			_storedItem.removeEventListener(MouseEvent.CLICK, activateStoredItem);
			_storedItem.addEventListener(MouseEvent.CLICK, deactivateStoredItem);
			_storedItemActivated = true;
		}
		
		private function deactivateStoredItem(evt:MouseEvent){
			
			_storedItemActivated = false;
			_storedItem.removeEventListener(MouseEvent.CLICK, deactivateStoredItem);
			
			if(_storedItem.hitTestObject(this)){
				_storedItem = null;
			}
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
