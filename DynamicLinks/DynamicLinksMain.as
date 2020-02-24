﻿package
{
	import appManager.displayContentElemets.LightImage;
	import contents.LinkData;
	import contents.PageData;
	import contents.displayPages.DynamicLinks;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	public class DynamicLinksMain extends Sprite
	{
		private var myPage:PageData;

		private var myLinks:myDynamicLink;

		private var firstElement:MovieClip ;
		
		public function DynamicLinksMain()
		{
			super();

			firstElement = Obj.get("first_mc",this);
			
			myLinks = Obj.findAllClass(myDynamicLink,this)[0];
			
			myPage = new PageData();
			myPage.id = "myPage1";
			for(var i = 0 ; i<10000 ; i++)
			{
				var link:LinkData = new LinkData();
				if(Math.floor(Math.random()*2)==0)
				{
					link.iconURL = "http://cdn.tabnak.ir/files/fa/news/1396/2/2/714884_531.jpg";
				}
				else
				{
					link.iconURL = "http://cdn.tabnak.ir/files/fa/news/1396/2/2/714887_507.jpg";
				}
				myPage.links1.push(link);
			}
			
			
			generateLinks(null);
			stage.addEventListener(MouseEvent.CLICK,generateLinks);
		}
		
		protected function generateLinks(event:MouseEvent):void
		{
			//stage.removeEventListener(MouseEvent.CLICK,generateLinks);
			myLinks.addFirstDisplayElemntForTheList(firstElement);
			myLinks.setUp(myPage);
		}
	}
}