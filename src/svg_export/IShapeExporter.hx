package src.svg_export;

/**
 * ...
 * @author 
 */
interface IShapeExporter
{

	public function beginShape():Void;
	public function endShape():Void;
	
	public function beginFills():Void;
	public function endFills():Void;
	
	public function beginLines():Void;
	public function endLines():Void;
	
	public function beginFill(color:Int, alpha:Float = 1.0):Void;
	
	public function beginGradientFill(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, spreadMethod:String = "pad", interpolationMethod:String = "rgb", focalPointRatio:Float = 0):Void;
	
	public function beginBitmapFill(bitmapId:Int, matrix:Array<Array<Float>> = null, repeat:Bool = true, smooth:Bool = false):Void;
	public function endFill():Void;

	public function lineStyle(thickness:Float = NaN, color:Int = 0, alpha:Float = 1.0, pixelHinting:Bool = false, scaleMode:String = "normal", startCaps:String = null, endCaps:String = null, joints:String = null, miterLimit:Float = 3):Void;
	public function lineGradientStyle(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, spreadMethod:String = "pad", interpolationMethod:String = "rgb", focalPointRatio:Float = 0):Void;

	public function moveTo(x:Float, y:Float):Void;
	public function lineTo(x:Float, y:Float):Void;
	public function curveTo(controlX:Float, controlY:Float, anchorX:Float, anchorY:Float):Void;
	
}