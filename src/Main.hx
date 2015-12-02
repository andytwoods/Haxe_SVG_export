package;

import openfl.display.Sprite;
import openfl.Lib;
import src.svg_export.SVGShapeExporter;
import svg_export.ShapeSVG;

/**
 * ...
 * @author 
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		var s:ShapeSVG = new ShapeSVG();
		
		addChild(s);
		s.g.beginFill(0xFFFFFF);
		s.g.moveTo(0, 0);
		s.g.lineTo(0, 100);
		s.g.lineTo(100, 100);
		s.g.lineTo(100, 0);
		s.g.lineTo(0, 0);
		s.g.endFill();
		
		trace(s.export());
		
	}

}
