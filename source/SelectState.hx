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
class SelectState extends FlxState
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
		
		Reg.text = new FlxText(Reg.windowX+0,Reg.windowY+4,160,"Pick A Maze");
		Reg.text.size = 16;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeSelect = 0;
		
		Reg.mazeButtonSprites[0] = new FlxSprite( Reg.windowX+10, 60, Reg.mazeButtons[0]);
		//Reg.mazeButtonSprites[0].x = (FlxG.width * 0.25) - (Reg.mazeButtonSprites[0].width / 2);
		add(Reg.mazeButtonSprites[0]);
		
		min = Std.string(Std.int(Reg.bestTimes[0][0] / 60));
		sec = Std.int(Reg.bestTimes[0][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[0].x-12),80,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeButtonSprites[1] = new FlxSprite( Reg.windowX+50, 60, Reg.mazeButtons[1]);
		//Reg.mazeButtonSprites[1].x = (FlxG.width * 0.75) - (Reg.mazeButtonSprites[1].width / 2);
		add(Reg.mazeButtonSprites[1]);
		
		min = Std.string(Std.int(Reg.bestTimes[1][0] / 60));
		sec = Std.int(Reg.bestTimes[1][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[1].x-12),80,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeButtonSprites[2] = new FlxSprite( Reg.windowX+90, 60, Reg.mazeButtons[2]);
		//Reg.mazeButtonSprites[2].x = (FlxG.width * 0.25) - (Reg.mazeButtonSprites[2].width / 2);
		add(Reg.mazeButtonSprites[2]);
		
		min = Std.string(Std.int(Reg.bestTimes[2][0] / 60));
		sec = Std.int(Reg.bestTimes[2][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[2].x-12),80,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeButtonSprites[3] = new FlxSprite( Reg.windowX+130, 60, Reg.mazeButtons[3]);
		//Reg.mazeButtonSprites[3].x = (FlxG.width * 0.75) - (Reg.mazeButtonSprites[3].width / 2);
		add(Reg.mazeButtonSprites[3]);
		
		min = Std.string(Std.int(Reg.bestTimes[3][0] / 60));
		sec = Std.int(Reg.bestTimes[3][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[3].x-12),80,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeButtonSprites[4] = new FlxSprite( Reg.windowX+10, 100, Reg.mazeButtons[4]);
		//Reg.mazeButtonSprites[0].x = (FlxG.width * 0.25) - (Reg.mazeButtonSprites[0].width / 2);
		add(Reg.mazeButtonSprites[4]);
		
		min = Std.string(Std.int(Reg.bestTimes[4][0] / 60));
		sec = Std.int(Reg.bestTimes[4][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[4].x-12),120,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeButtonSprites[5] = new FlxSprite( Reg.windowX+50, 100, Reg.mazeButtons[5]);
		//Reg.mazeButtonSprites[5].x = (FlxG.width * 0.75) - (Reg.mazeButtonSprites[5].width / 2);
		add(Reg.mazeButtonSprites[5]);
		
		min = Std.string(Std.int(Reg.bestTimes[5][0] / 60));
		sec = Std.int(Reg.bestTimes[5][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[5].x-12),120,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeButtonSprites[6] = new FlxSprite( Reg.windowX+90, 100, Reg.mazeButtons[6]);
		//Reg.mazeButtonSprites[6].x = (FlxG.width * 0.25) - (Reg.mazeButtonSprites[6].width / 2);
		add(Reg.mazeButtonSprites[6]);
		
		min = Std.string(Std.int(Reg.bestTimes[6][0] / 60));
		sec = Std.int(Reg.bestTimes[6][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[6].x-12),120,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		Reg.mazeButtonSprites[7] = new FlxSprite( Reg.windowX+130, 100, Reg.mazeButtons[7]);
		//Reg.mazeButtonSprites[7].x = (FlxG.width * 0.75) - (Reg.mazeButtonSprites[7].width / 2);
		add(Reg.mazeButtonSprites[7]);
		
		min = Std.string(Std.int(Reg.bestTimes[7][0] / 60));
		sec = Std.int(Reg.bestTimes[7][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		Reg.text = new FlxText((Reg.mazeButtonSprites[7].x-12),120,40,min+":"+secSt);
		Reg.text.size = 8;
		Reg.text.alignment = "center";
		add(Reg.text); 
		
		
		Reg.selectSp = new FlxSprite( Reg.mazeButtonSprites[0].x-2, Reg.mazeButtonSprites[0].y-2, Reg.mazeSelectImg);
		add(Reg.selectSp);
		
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
		Reg.mazeButtonSprites[0].destroy();
		Reg.mazeButtonSprites[1].destroy();
		Reg.mazeButtonSprites[2].destroy();
		Reg.mazeButtonSprites[3].destroy();
		Reg.selectSp.destroy();
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
		
		if (FlxG.keys.anyJustPressed(["LEFT", "A"]) ||  ( Reg.usegamepad && _gamePad.justPressed.DPAD_LEFT ))
		{
			FlxG.sound.play(Reg.selectWav);
			
			Reg.mazeSelect--;
			if(Reg.mazeSelect < 0)
			{
				Reg.mazeSelect = 7;
			}
			Reg.selectSp.x = Reg.mazeButtonSprites[Reg.mazeSelect].x-2;
			Reg.selectSp.y = Reg.mazeButtonSprites[Reg.mazeSelect].y-2;
		}
		else if (FlxG.keys.anyJustPressed(["RIGHT", "D"]) ||  ( Reg.usegamepad && _gamePad.justPressed.DPAD_RIGHT))
		{
			FlxG.sound.play(Reg.selectWav);
			
			Reg.mazeSelect++;
			if(Reg.mazeSelect > 7)
			{
				Reg.mazeSelect = 0;
			}
			Reg.selectSp.x = Reg.mazeButtonSprites[Reg.mazeSelect].x-2;
			Reg.selectSp.y = Reg.mazeButtonSprites[Reg.mazeSelect].y-2;
		}
		
		if (FlxG.keys.justPressed.ENTER || FlxG.keys.justPressed.SPACE ||  ( Reg.usegamepad && _gamePad.justPressed.A))
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
		FlxG.switchState(new PlayState());
	}
}
