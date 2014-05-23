package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.DisplayObjectContainer;
	
	public class Inventar extends MovieClip{

		private var _itemListe:Array = new Array();
		private var _container:DisplayObjectContainer;
		
		private var _preparedCombineItem1:Item;
		private var _preparedCombineItem2:Item;
		
		
		public function Inventar() {

			this.addEventListener(Event.ENTER_FRAME, EnterAFrame);
		}
		
		private function EnterAFrame(evt:Event){
			for(var i = 0; i<_itemListe.length; i++) {
				_itemListe[i].x = this.x + 100*i + 55;
				_itemListe[i].y = this.y + 50;
			}
			
			if(_preparedCombineItem1 != null) {
				_preparedCombineItem1.x = stage.mouseX;
				_preparedCombineItem1.y = stage.mouseY;
			}
		}
		
		public function PrepareToCombine(item:Item){
			if(_preparedCombineItem1 == null && _preparedCombineItem2 == null){
				_preparedCombineItem1 = item;
			}
			
		}
		
		
		public function AddItem(item:Item) {
			if(_container == null)
				_container = item.GetContainer();
			if(!Contains(item)) {
				_itemListe.push(item);
			}
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
		
		private function Contains(item:Item):Boolean{
			for(var i = 0; i<_itemListe.length; i++) {
				if(_itemListe[i].name == item.name){
					return true;
				}
			}
			return false;
		}
		
		
	}
	
}
