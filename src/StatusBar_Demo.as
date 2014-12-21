package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;

	import ru.kavolorn.ane.StatusBar;
	import ru.kavolorn.ane.StatusBarEvent;

	public class StatusBar_Demo extends Sprite
	{
		private var _updateHandler:uint;

		public function StatusBar_Demo()
		{
			loaderInfo.addEventListener(Event.COMPLETE, completeHandler);
		}

		private function completeHandler(event:Event):void
		{
			StatusBar.getInstance().addEventListener(StatusBarEvent.INITIALIZATION_ERROR, initializationErrorHandler);
			StatusBar.getInstance().initialize('eyJsaWNlbnNlIjoie1widGltZXN0YW1wXCI6MTQxOTA3Njk2OCxcImlkc1wiOltcInJ1Lmthdm9sb3JuLmFuZS5TdGF0dXNCYXIuRGVtb1wiXX0iLCJzaWduYXR1cmUiOiJEY2x0Sm9CV21QcVFwK04zcDZrRE9EOXZjcHlOWFp0MXppUmdFeStsZVJPdnNTczNINmZtT2NNK2pqbnlNSmNPeloxTGE4ZHRFQ0swT1BWN01WbDYwU1RLcTF1K3hxVzRoaTQ3YTkydHBxSTNFOWZ3QVlcL0lMaklOQ3o1Q1JBTkV4YitzZzJDMkZaM3ljc2RpcFVuUE1kbGt4RVBFNDgyV2VEanRqT3pYbW1SYUl0WU1nV2liTm5rYjlFT3dhalFHMHgyNlN1Ykl6NCtuNXVla3hnQVRROVJ0U29yVVMrT2Jjb3dUTzBvWWVjVFM1NmViRENrOUJXbzhYSkFKcnA5Z29RRTJwcTdxU3p2ejNvMFNIbmFMWnBxYVRpVnJmSmNmNkFweFlcL3ZvUldmQ21OV0RIWWtKeThoVVwvaExIVDNaODRDaEhUUFFXcGljNHFQWnpPWDRBQVE9PSJ9');

			var style:String = StatusBar.UIStatusBarStyleDefault;

			_updateHandler = setInterval(function ():void
			{
				StatusBar.getInstance().updateStatusBar(style);

				if (style == StatusBar.UIStatusBarStyleDefault)
				{
					style = StatusBar.UIStatusBarStyleLightContent
				}
				else
				{
					style = StatusBar.UIStatusBarStyleDefault;
				}
			}, 2000);
		}

		private function initializationErrorHandler(event:StatusBarEvent):void
		{
			trace(event.message);

			clearInterval(_updateHandler);
		}
	}
}
