package src.svg_export;
import svg_export.constants.InterpolationMethod;
import svg_export.constants.LineScaleMode;
import svg_export.constants.SpreadMethod;

/**
 * ...
 * @author 
 */
class DefaultShapeExporter implements IShapeExporter
{

	public function new() 
	{
		
	}

		
	public function beginShape() {}
	public function endShape() {}

	public function beginFills() {}
	public function endFills() {}

	public function beginLines() {}
	public function endLines() {}
	
	public function beginFill(color:Int, alpha:Float = 1.0) { }
	
	public function beginGradientFill(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, spreadMethod:String = SpreadMethod.PAD, interpolationMethod:String = InterpolationMethod.RGB, focalPointRatio:Float = 0) { }
	
	public function beginBitmapFill(bitmapId:Int, matrix:Array<Array<Float>> = null, repeat:Bool = true, smooth:Bool = false) {}
	public function endFill() {}
	
	public function lineStyle(thickness:Float = 1, color:Int = 0, alpha:Float = 1.0, pixelHinting:Bool = false, scaleMode:String = LineScaleMode.NORMAL, startCaps:String = null, endCaps:String = null, joints:String = null, miterLimit:Float = 3) {}
	public function lineGradientStyle(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, spreadMethod:String = SpreadMethod.PAD, interpolationMethod:String = InterpolationMethod.RGB, focalPointRatio:Float = 0) {}

	public function moveTo(x:Float, y:Float) {}
	public function lineTo(x:Float, y:Float) {}
	public function curveTo(controlX:Float, controlY:Float, anchorX:Float, anchorY:Float) {}
	
}