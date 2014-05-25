package 
{ 
    import flash.display.Sprite; 
    import flash.text.*; 
    import flash.events.MouseEvent; 
 
    public class TextScrollExample extends Sprite 
    { 
        private var myTextBox:TextField = new TextField(); 
        var myText:String = "Hello world and welcome to the show. It's really nice to meet you. Take your coat off and stay a while. OK, show is over. Hope you had fun. You can go home now. Don't forget to tip your waiter. There are mints in the bowl by the door. Thank you. Please come again."; 
 
 		var textOwl1 : String = "As long as I remain in this world I shall hinder your evil deeds.";
		var textOwl1 : String = "This is not over yet. Light, you have been fooled. The forest is dying due to the lack of colors and the pollution of the world. The witch has already trapped the other colors - only Black and You managed to escape her. We don't know the whereabouts of Black though. I am the last of the three Guardians who has remained its memory but my power is fading away while we are talking. I soon won't be able to keep up this form. Please help us to rescue our world. Take this part of me. It will help to clear the way for you.";
		var textWitch1 : String = "Light - I summon you. The world is in need of Your help. A Darkness is spreading and the world is at the edge of distruction.
									The Black Forest absorbs the colors of life - you are the only one left. Red, Blue, Green and Black are already lost within the depth of the forest. You need to bring them back to restore the balance of this world. For this you have to make your way into the lion's den. Go into the forest and free the colors for the sake of all of us.";
		var textWitch2 : String = "Light - I see you followed my call.
									Did you really believe the forest would capture the colors? Did you really believe you could safe them? The forest needs the colors to live and she would never hurt her beloved creatures. But I - the Witch - need to take over the control over the colors to enhance my power. You really are the only one left. Since you are too powerful I had to lure you inside the eternal darkness of this forest where you are weakened.";
		var textRabbit1 : String = "Dear Light, would you please have some time for us? We are desperately in need of somebody who can help us.			
									The forest is withering - there is not enough food to feed all her creatures and the sickness is spreading. It's a sickness of the heart - we are losing our inner selves the darker this place gets.
									I need medicine for my family to stop this insanity. Please collect the incredients for it by searching and clicking on them - they will appear in your inventory. When you have all the items, combine them in the most useful way by clicking on one of them and dragging it onto another.
									For the medicine we need the one thing that all rabbits love, a bowl to put it in and a special magic incredient.";
		var textRabbit2 : String = "Thank you, Light. This will not rescue us but it will at least delay the spreading of the sickness in my family.
									You were a big help - come back whenever you need help and I will try to be there for you.";
		var textRabbit3 : String = "My memory seems to come back with each step you make. You have encountered the Old Frog? He once was one of the three wise guardians of this forest. With the humans polluting the earth he got corrupted and confused. But he can be safed. His heart is frozen and you have to renew it. Here - take mine. The Frog is a powerful creature. You need my help.";
		var textRabbit4 : String = "Your heart is as pure as the light you emit. Hm... there might me another chance - but it is only a legend. Legend has it that in the deepest heart of the forest lies the heart of Eternal Darkness - the fifth color that completes the circle.
									It might be powerful enough to rescue the Old Frog.";
		var textRabbit5 : String = "Farewell my friend - I shall leave this place to the spirit world. Take my heart and do not let my sacrifice be in vain.";
		var textWerewolf : String = "What do we have here? A Light. Do you really think you can defeat me? You are just a mere Light with no power here. 
									You neither have a weapon nor the strength to scare me. The only thing scarier than me is mankind itself. And even if you could get past me you also don't have the key to free the color.";
		var textTroll : String = "Argh Light get Lost you hurt my eyes. To my luck your light is not strong enough to get rid of me.";
		var textFrog1 : String = "I want to destroy everything. This world has no right to exist anymore. Who are you?....
									And who am I? Why am I still alive although my heart is no more.
									... Have you seen this white creature over there? Why do I always see it? Get out of here. NOW."
		var textFrog2 : String = "Hey what did you give me? My Chest - it's burning? This feeling ...";
		
		
        public function TextScrollExample() 
        { 
			myTextBox.x = 5;
			myTextBox.y = 600;
            myTextBox.text = myText; 
            myTextBox.width = 1280;
            myTextBox.height = 80; 
            myTextBox.multiline = true; 
            myTextBox.wordWrap = true; 
            myTextBox.blendMode = BlendMode.LAYER;
			myTextBox.alpha = .7;
			myTextBox.backgroundColor = 0x000000;
			myTextBox.background = true;
 
 			//myTextBox.textColor = 0xFFFFFF;
			
            var format : TextFormat = new TextFormat(); 
            format.font = "Verdana"; 
			 
            format.color = 0xFFFFCC; 
            format.size = 20;
 			myTextBox.setTextFormat(format);
            //myTextBox.defaultTextFormat = format; 
            addChild(myTextBox); 
            myTextBox.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownScroll); 
        } 
 
        public function mouseDownScroll(event:MouseEvent):void 
        { 
            myTextBox.scrollV++; 
        } 
    } 
}