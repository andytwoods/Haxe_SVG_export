package src.svg_export;
import hxColorToolkit.ColorToolkit;
import svg_export.constants.GradientType;
import svg_export.constants.InterpolationMethod;
import svg_export.constants.LineScaleMode;
import svg_export.constants.SpreadMethod;

/**
 * ...
 * port of https://github.com/claus/as3swf/blob/master/src/com/codeazur/as3swf/exporters/SVGShapeExporter.as
 */
class SVGShapeExporter extends DefaultSVGShapeExporter
{

	public function new() 
	{
		super();
	}
	
	static var s:Map<String,String> = ['name' => "s", 'uri' => "http://www.w3.org/2000/svg"];
	static var xlink:Map<String,String> = ['name' => "xlink", 'uri' => "http://www.w3.org/1999/xlink"];
			
	public var svg:Xml;
	var path:Xml;
	var gradients:Array<String>;
	


	override public function beginShape() {
		svg = Xml.parse('<svg Xmlns='+s['uri']+' Xmlns:xlink='+xlink['uri']+'><defs /><g /></svg>');
		gradients = new Array<String>();
	}
	
	override public function beginFill(color:Int, alpha:Float = 1.0) {
		finalizePath();
		path.set('stroke', 'none');
		
		path.set('fill', Std.string(ColorToolkit.toHex(color)));
		if (alpha != 1) { 
			path.set('fill-opacity', Std.string(alpha));			
			}
	}
		
		override public function beginGradientFill(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, spreadMethod:String = SpreadMethod.PAD, interpolationMethod:String = InterpolationMethod.RGB, focalPointRatio:Float = 0) {
			finalizePath();
			
			var gradient:Xml = (type == GradientType.LINEAR) ? Xml.parse('<linearGradient />') : Xml.parse('<radialGradient />');
			populateGradientElement(gradient, type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
			
			var id:Int = gradients.indexOf(gradient.nodeValue);
			if(id < 0) {
				id = gradients.length;
				gradients.push(gradient.nodeValue);
			}

			gradient.set('id', "gradient" + id);
			path.set('stroke', "none");
			path.set('fill', "url(#gradient" + id + ")");
			svg.addChild(gradient);
			
			//svg.s::defs.appendChild(gradient);
		}

		override public function beginBitmapFill(bitmapId:Int, matrix:Array<Array<Float>> = null, repeat:Bool = true, smooth:Bool = false) {
			throw("Bitmap fills are not yet supported for shape export.");
		}
		
		
		public function drawRect (x:Float, y:Float, width:Float, height:Float):Void {
		
		
		
		
	
	}
		
		
		override public function lineStyle(thickness:Float = 1, color:Int = 0, alpha:Float = 1.0, pixelHinting:Bool = false, scaleMode:String = LineScaleMode.NORMAL, startCaps:String = '', endCaps:String = '', joints:String = '', miterLimit:Float = 3) {
			finalizePath();
			path.set('fill', "none");
			path.set('stroke', Std.string(ColorToolkit.toHex(color)));
			path.set("stroke-width", Std.string(thickness));
			if (alpha != 1)  path.set("stroke-opacity", Std.string(alpha)) ;
			
			if (startCaps != '') throw "not implemented" ;
			if (joints != '') throw "not implemented" ;
			
			/*
			switch(startCaps) {
				case CapsStyle.NONE: path.@["stroke-linecap"] = "butt"; break;
				case CapsStyle.SQUARE: path.@["stroke-linecap"] = "square"; break;
				default: path.@["stroke-linecap"] = "round"; break;
			}
			switch(joints) {
				case JointStyle.BEVEL: path.@["stroke-linejoin"] = "bevel"; break;
				case JointStyle.ROUND: path.@["stroke-linejoin"] = "round"; break;
				default:
					path.@["stroke-linejoin"] = "miter";
					if(miterLimit >= 1 && miterLimit != 4) {
						path.@["stroke-miterlimit"] = miterLimit;
					}
					break;
			}
			*/
		}

		override public function lineGradientStyle(type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>> = null, spreadMethod:String = SpreadMethod.PAD, interpolationMethod:String = InterpolationMethod.RGB, focalPointRatio:Float = 0) {
			
			throw "not implemented";
			/*
			delete path.@["stroke-opacity"]
			var gradient:Xml = (type == GradientType.LINEAR) ? <linearGradient /> : <radialGradient />;
			populateGradientElement(gradient, type, colors, alphas, ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
			var id:int = gradients.indexOf(gradient.toXmlString());
			if(id < 0) {
				id = gradients.length;
				gradients.push(gradient.toXmlString());
			}
			gradient.@id = "gradient" + id;
			path.@stroke = "url(#gradient" + id + ")";
			path.@fill = "none";
			svg.s::defs.appendChild(gradient);
			*/
		}

		
		override function finalizePath() {
			throw "not implemented";
			/*
			if(path && pathData != "") {
				path.@d = StringUtils.trim(pathData);
				svg.s::g.appendChild(path);
			}
			path = <path />;
			super.finalizePath();
			*/
		}
		
		
		function populateGradientElement(gradient:Xml, type:String, colors:Array<Float>, alphas:Array<Float>, ratios:Array<Float>, matrix:Array<Array<Float>>, spreadMethod:String, interpolationMethod:String, focalPointRatio:Float) {
			throw "not implemented";
			/*
			gradient.@gradientUnits = "userSpaceOnUse";
			if(type == GradientType.LINEAR) {
				gradient.@x1 = -819.2;
				gradient.@x2 = 819.2;
			} else {
				gradient.@r = 819.2;
				gradient.@cx = 0;
				gradient.@cy = 0;
				if(focalPointRatio != 0) {
					gradient.@fx = 819.2 * focalPointRatio;
					gradient.@fy = 0;
				}
			}
			if(spreadMethod != SpreadMethod.PAD) { gradient.@spreadMethod = spreadMethod; }
			switch(spreadMethod) {
				case SpreadMethod.PAD: gradient.@spreadMethod = "pad"; break;
				case SpreadMethod.REFLECT: gradient.@spreadMethod = "reflect"; break;
				case SpreadMethod.REPEAT: gradient.@spreadMethod = "repeat"; break;
			}
			if(interpolationMethod == InterpolationMethod.LINEAR_RGB) { gradient.@["color-interpolation"] = "linearRGB"; }
			if(matrix) {
				var gradientValues:Array = [matrix.a, matrix.b, matrix.c, matrix.d, matrix.tx, matrix.ty];
				gradient.@gradientTransform = "matrix(" + gradientValues.join(" ") + ")";
			}
			for(var i:Int = 0; i < colors.length; i++) {
				var gradientEntry:Xml = <stop offset={ratios[i] / 255} />
				if(colors[i] != 0) { gradientEntry.@["stop-color"] = ColorUtils.rgbToString(colors[i]); }
				if(alphas[i] != 1) { gradientEntry.@["stop-opacity"] = alphas[i]; }
				gradient.appendChild(gradientEntry);
			}
			*/
		}
	
}