package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setInterval;

	import ru.kavolorn.ane.StatusBar;
	import ru.kavolorn.ane.StatusBarEvent;

	public class StatusBar_Demo extends Sprite
	{
		public function StatusBar_Demo()
		{
			loaderInfo.addEventListener(Event.COMPLETE, completeHandler);
		}

		private function completeHandler(event:Event):void
		{
			StatusBar.setDebug(true);
			StatusBar.getInstance().addEventListener(StatusBarEvent.INITIALIZATION_ERROR, initializationErrorHandler);
			StatusBar.getInstance().addEventListener(StatusBarEvent.INITIALIZATION_SUCCESS, initializationSuccessHandler);
			StatusBar.getInstance().initialize('eyJsaWNlbnNlIjoie1widGltZXN0YW1wXCI6MTQyMTUxMjg5MSxcImlkc1wiOltcInJ1Lmthdm9sb3JuLmFuZS5TdGF0dXNCYXIuRGVtb1wiLFwiYWlyLnJ1Lmthdm9sb3JuLmFuZS5TdGF0dXNCYXIuRGVtb1wiLFwicnUua2F2b2xvcm4uYW5lLlN0YXR1c0Jhci5EZW1vLmRlYnVnXCIsXCJhaXIucnUua2F2b2xvcm4uYW5lLlN0YXR1c0Jhci5EZW1vLmRlYnVnXCJdfSIsInNpZ25hdHVyZSI6ImpLWGFDVkhXbnlOV2JqVTFYbkJibm5tazVuYWdxb2Y2dUlTTGI5cDdcL1FSMmYrWnBtVGFkb2FXbmRDT1gxWlFnMk1LNWQ0VjlFRGFUQkdrVEhOZkxuMFVkN3N5ekhoZW5saWpOdEN3cGRDVnArXC9nUVkxMTFhQlFvb21UdGpMUkFWTEx0bGdoUThJSGNSUEF1TW80Wnp5Z2ZEOWNCdkRZQVM2OVwvZk5INFBuQTdCZnFWMzZJbE5SME1RazBER2RsM0hEY3l4NlwvVTB4ek9Bd3o0RDdaYkVCaXc3bFRKRnphOXp0aWVVeVwvSzBoWHk2U2NsQzhCdERpTUZzNTV3cXFcL1Zac25vZENmTTN0NUVNdFNRQXlVa0RXSUN2a3J2M2tJWVhuTFBiWm5IWjZRUlp5c2krd1M5azlFUVc2cXVKb2hKd1wvVzFsRTcwN2JsanVhcjlFUEg1ZHc9PSJ9');
		}

		private function initializationErrorHandler(event:StatusBarEvent):void
		{
			trace(event.message);
		}

		private function initializationSuccessHandler(event:StatusBarEvent):void
		{
			trace(event.message);

			var style:String = StatusBar.UIStatusBarStyleDefault;

			setInterval(function ():void
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
	}
}
