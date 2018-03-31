package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
//import flixel.util.FlxMath;
import flixel.input.gamepad.FlxGamepad;
//import flixel.input.gamepad.XboxButtonID;
//import flixel.input.gamepad.OUYAButtonID;
import flash.system.System;

/**
 * A FlxState which can be used for the game's menu.
 */
class WinState extends FlxState
{
	public var min:String;
	public var sec:Int;
	public var secSt:String;
	private var _gamePad:FlxGamepad;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		FlxG.cameras.bgColor = 0xffacacac;
		
		Reg.manlyBoySp = new FlxSprite( 0, 0, Reg.manlyBoy);
		add(Reg.manlyBoySp);
		
		Reg.text = new FlxText(Reg.windowX+0,Reg.windowY+0,160,"You Made It!");
		Reg.text.size = 16;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		min = Std.string(Std.int(Reg.currTime / 60));
		sec = Std.int(Reg.currTime % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText(Reg.windowX+0,Reg.windowY+26,160,"Your Time: "+min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.text = new FlxText(Reg.windowX+0,Reg.windowY+40,160,"Best Times: ");
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		for (i in 0...Reg.bestTimes[Reg.mazeSelect].length)
		{
			if(Reg.currTime < Reg.bestTimes[Reg.mazeSelect][i] || Reg.bestTimes[Reg.mazeSelect][i] == 0)
			{
				Reg.bestTimes[Reg.mazeSelect].insert(i, Reg.currTime);
				break;
			}
		}
		
		for (i in 0...10)
		{
		
			min = Std.string(Std.int(Reg.bestTimes[Reg.mazeSelect][i] / 60));
			sec = Std.int(Reg.bestTimes[Reg.mazeSelect][i] % 60);
			if (sec < 10)
			{
				secSt = "0" + Std.string(sec);
			}
			else
			{
				secSt = Std.string(sec);
			}
			
			if (i < 5)
			{
				Reg.text = new FlxText(Reg.windowX+0,Reg.windowY+50+(i*10),80,(i+1)+": "+min+":"+secSt);
				Reg.text.size = 8;
				Reg.text.alignment = "center";
				add(Reg.text);
			}
			else
			{
				Reg.text = new FlxText(Reg.windowX+80,Reg.windowY+50+((i-5)*10),80,(i+1)+": "+min+":"+secSt);
				Reg.text.size = 8;
				Reg.text.alignment = "center";
				add(Reg.text);
			}
		}
		
		Reg.text = new FlxText(Reg.windowX+0,Reg.windowY+120,160,"Press "+Reg.buttonO+" To Play Again.");
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		SaveScores.save();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		Reg.manlyBoySp.destroy();
		Reg.text.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_gamePad = FlxG.gamepads.lastActive;
		if (_gamePad == null)
		{
			// Make sure we don't get a crash on neko when no gamepad is active
			_gamePad = FlxG.gamepads.getByID(0);
		}
		
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE || ( Reg.usegamepad && _gamePad.justPressed.A))
		{
			this.goToPlay();
		}
		if (FlxG.keys.anyJustPressed(["ESCAPE"]))
		{
			SaveScores.save();
			System.exit(0);
		}
	}	
	
	private function goToPlay():Void
	{
		FlxG.switchState(new SelectState());
	}
}
