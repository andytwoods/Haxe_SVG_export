package svg_export;
import openfl.display.Graphics;
import openfl.display.Shape;
import src.svg_export.SVGShapeExporter;
import svg_export.constants.GradientType;

/**
 * ...
 * @author 
 */
class ShapeSVG extends Shape
{
	var svg:SVGShapeExporter;
	
	@:noCompletion private var __g:Layer;
	
	public function new() 
	{
		super();
	}
	
	public var g (get, null):Layer;
	
		
	@:noCompletion private function get_g ():Layer {
		
		if (__g == null) {
			__g = new Layer (svg, this.graphics);
			svg = new SVGShapeExporter();
			svg.beginShape();
		}
		
		return __g;
		
	}
	
}

class Layer  {
	
	private var svg:SVGShapeExporter;
	private var gra:Graphics;
	
	
	public function new(svg:SVGShapeExporter, gra:Graphics) {
		this.svg = svg;
		this.gra = gra;
	}

	public function beginFill(color:Int, alpha:Float = 1.0):Void {
		svg.beginFill(color, alpha);
		gra.beginFill(color, alpha);
	}
	
	public function beginGradientFill(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, spreadMethod:String = "pad", interpolationMethod:String = "rgb", focalPointRatio:Float = 0):Void {
		throw 'not developed yet';
		////svg.beginGradientFill(type, colors,alphas,ratios,matrix,spreadMethod,interpolationMethod,focalPointRatio);
		//gra.beginGradientFill(type, colors,alphas,ratios,matrix,spreadMethod,interpolationMethod,focalPointRatio);
	}
	
	public function beginBitmapFill(bitmapId:Int, matrix:Array<Array<Float>> = null, repeat:Bool = true, smooth:Bool = false):Void {
		throw 'not developed yet';
		////svg.beginBitmapFill(bitmapId, matrix, repeat, smooth);
		//gra.beginBitmapFill(bitmapId, matrix, repeat, smooth);
	}
	
	
	public function endFill():Void {
		//svg.endFill();
		gra.endFill();
	}

	public function lineStyle(thickness:Float = 0, color:Int = 0, alpha:Float = 1.0, pixelHinting:Bool = false, scaleMode:String = "normal", startCaps:String = null, endCaps:String = null, joints:String = null, miterLimit:Null<Float> = null):Void {
		//svg.lineStyle(thickness, color, alpha, pixelHinting, scaleMode, startCaps, endCaps, joints, miterLimit);
		gra.lineStyle(thickness, color, alpha);
		
	}
	
	public function lineGradientStyle(type:GradientType, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, 
	spreadMethod:String = "pad", interpolationMethod:String = "rgb", focalPointRatio:Float = 0):Void {
		throw 'not developed yet';
		////svg.lineGradientStyle(type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
		//gra.lineGradientStyle(type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
	}

	public function moveTo(x:Float, y:Float):Void {
		//svg.moveTo(x, y);
		gra.moveTo(x, y);
	}
	
	public function lineTo(x:Float, y:Float):Void {
		//svg.lineTo(x, y);
		gra.lineTo(x, y);		
	}

	public function curveTo(controlX:Float, controlY:Float, anchorX:Float, anchorY:Float):Void {
		//svg.curveTo(controlX, controlY, anchorX, anchorX);
		gra.curveTo(controlX, controlY, anchorX, anchorX);
	}
	
}