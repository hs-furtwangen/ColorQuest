package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;
	
	public class ShadowPuzzle extends MovieClip{

		private var _partHolder:Array;
		private var _activePart:MovieClip;
		private var _emptyPart:MovieClip;
		private var _isMoving:Boolean;
		private var _movingSpeed:Number = 25;
		private var _savePoint:Point;

		public function ShadowPuzzle() {
			InitializePuzzeParts();
			this.addEventListener(Event.ENTER_FRAME, EnterAFrame);
		}
		
		private function EnterAFrame(evt:Event){
			if(_isMoving && _activePart != null){
				MovePart();
			}
			SolveCheck();
		}
		
		public function MovePart(){
			var p1:Point = new Point(_activePart.x, _activePart.y);
			var p2:Point = new Point(_emptyPart.x, _emptyPart.y);

			//Abstands Vektor berechnen
			var tmpDif:Point =  p1.subtract(p2);
			
			// Normalisierte Richtung
			var normDir:Point = new Point(tmpDif.x/tmpDif.length, tmpDif.y/tmpDif.length);
			
			_activePart.x = _activePart.x - normDir.x*_movingSpeed;
			_activePart.y = _activePart.y - normDir.y*_movingSpeed;
			
			if(Point.distance(p1,p2)< 30){
				_isMoving = false;
				_emptyPart.x = _savePoint.x;
				_emptyPart.y = _savePoint.y;
				
				// swap index
				var tmpIndex = _partHolder.indexOf(_activePart);
				_partHolder[_partHolder.indexOf(_emptyPart)] = _activePart;
				_partHolder[tmpIndex] = _emptyPart;
				
				
			}
			

			
			
		}
		
		private function InitializePuzzeParts(){
			_partHolder = new Array();
			
			_partHolder.push(new shadow_p6());
			_partHolder[0].SetIndex(5);
			
			_partHolder.push(new shadow_p14());
			_partHolder[1].SetIndex(13);
			
			_partHolder.push(new shadow_p5());
			_partHolder[2].SetIndex(4);
			
			_partHolder.push(new shadow_p16());
			_partHolder[3].SetIndex(15);
			
			_partHolder.push(new shadow_p7());
			_partHolder[4].SetIndex(6);
			
			_partHolder.push(new shadow_p12());
			_partHolder[5].SetIndex(11);
			
			_partHolder.push(new shadow_p11());
			_partHolder[6].SetIndex(10);
			
			_partHolder.push(new shadow_p8());
			_partHolder[7].SetIndex(7);
			_partHolder[7].visible = false;
			_emptyPart = _partHolder[7];
			
			_partHolder.push(new shadow_p1());
			_partHolder[8].SetIndex(0);
			
			_partHolder.push(new shadow_p15());
			_partHolder[9].SetIndex(14);
			
			_partHolder.push(new shadow_p13());
			_partHolder[10].SetIndex(12);
			
			_partHolder.push(new shadow_p3());
			_partHolder[11].SetIndex(2);
			
			_partHolder.push(new shadow_p10());
			_partHolder[12].SetIndex(9);
			
			_partHolder.push(new shadow_p9());
			_partHolder[13].SetIndex(8);
			
			_partHolder.push(new shadow_p4());
			_partHolder[14].SetIndex(3);
			
			_partHolder.push(new shadow_p2());
			_partHolder[15].SetIndex(1);
			
			for(var i = 0;i<_partHolder.length;i++) {
				this.parent.addChild(_partHolder[i]);
				this.parent.setChildIndex(_partHolder[i], this.parent.numChildren-1);
				_partHolder[i].x = this.x + (i%4) * 150;
				_partHolder[i].y = this.y + Math.floor(i/4) * 150;
				_partHolder[i].buttonMode = true;
				_partHolder[i].addEventListener(MouseEvent.CLICK, puzzlePartClicked);
				
			}
		}
		
		private function puzzlePartClicked(evt:MouseEvent){
			if(!_isMoving){
				_activePart = _partHolder[_partHolder.indexOf(evt.target)];
				var p1:Point = new Point(_emptyPart.x, _emptyPart.y);
				var p2:Point = new Point(_activePart.x, _activePart.y);
				
				if(Point.distance(p1, p2) < 160){
					_savePoint = new Point(_activePart.x, _activePart.y);
					_isMoving = true;
				}
			}
		}
		
		private function SolveCheck(){
			for(var i = 0;i<_partHolder.length;i++) {
				if(i != _partHolder[i].GetIndex())
					return;
			}
			trace("SOLVED!");
			_emptyPart.visible = true;
			
			for(var k = 0;k<_partHolder.length;k++) {
				_partHolder[k].removeEventListener(MouseEvent.CLICK, puzzlePartClicked);
				
			}
			
			
		}
		
		

	}
	
}
