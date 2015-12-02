package src.svg_export;
import svg_export.constants.InterpolationMethod;
import svg_export.constants.LineScaleMode;
import svg_export.constants.SpreadMethod;
import svg_export.utils.NumberUtils;

/**
 * ...
 * @author 
 */
class DefaultSVGShapeExporter extends DefaultShapeExporter
{

	public function new() 
	{
		super();
	}
	
		static var DRAW_COMMAND_L:String = "L";
		static var DRAW_COMMAND_Q:String = "Q";

		var currentDrawCommand:String = "";
		var pathData:String;
		
		
		override public function beginFill(color:Int, alpha:Float = 1.0){
			finalizePath();
		}
		
		override public function beginGradientFill(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>>  = null, spreadMethod:String = SpreadMethod.PAD, interpolationMethod:String = InterpolationMethod.RGB, focalPointRatio:Float = 0){
			finalizePath();
		}

		override public function beginBitmapFill(bitmapId:Int, matrix:Array<Array<Float>>  = null, repeat:Bool = true, smooth:Bool = false){
			finalizePath();
		}
		
		override public function endFill(){
			finalizePath();
		}

		override public function lineStyle(thickness:Float = 0, color:Int = 0, alpha:Float = 1.0, pixelHinting:Bool = false, scaleMode:String = LineScaleMode.NORMAL, startCaps:String = null, endCaps:String = null, joints:String = null, miterLimit:Float = 3){
			finalizePath();
		}
		
		override public function moveTo(x:Float, y:Float){
			currentDrawCommand = "";
			pathData += "M" +
				NumberUtils.roundPixels20(x) + " " + 
				NumberUtils.roundPixels20(y) + " ";
		}
		
		override public function lineTo(x:Float, y:Float){
			if(currentDrawCommand != DRAW_COMMAND_L) {
				currentDrawCommand = DRAW_COMMAND_L;
				pathData += "L";
			}
			pathData += 
				NumberUtils.roundPixels20(x) + " " + 
				NumberUtils.roundPixels20(y) + " ";
		}
		
		override public function curveTo(controlX:Float, controlY:Float, anchorX:Float, anchorY:Float){
			if(currentDrawCommand != DRAW_COMMAND_Q) {
				currentDrawCommand = DRAW_COMMAND_Q;
				pathData += "Q";
			}
			pathData += 
				NumberUtils.roundPixels20(controlX) + " " + 
				NumberUtils.roundPixels20(controlY) + " " + 
				NumberUtils.roundPixels20(anchorX) + " " + 
				NumberUtils.roundPixels20(anchorY) + " ";
		}
		
		override public function endLines(){
			finalizePath();
		}

		
		function finalizePath(){
			pathData = "";
			currentDrawCommand = "";
		}
	
}