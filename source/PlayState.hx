package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
//import flixel.util.FlxMath;
import flash.Lib;
import flixel.FlxCamera;
import flixel.input.gamepad.FlxGamepad;
//import flixel.input.gamepad.XboxButtonID;
//import flixel.input.gamepad.OUYAButtonID;
import flash.system.System;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	
	public var player:MazePlayer;
	private var _level:MazeTiledLevel;
	private var hudCam:FlxCamera;
	private var playerCam:FlxCamera;
	private var mbCam:FlxCamera;
	private var currentTimer:Float;
	private var flagTimer:Float;
	public var min:String;
	public var sec:Int;
	public var secSt:String;
	public var winMaze:Bool;
	public var watchFlag:Bool;
	private var _gamePad:FlxGamepad;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		FlxG.mouse.visible = false;
		FlxG.cameras.bgColor = 0xffacacac;
		
		// Load the level's tilemaps
		_level = new MazeTiledLevel(Reg.mazes[Reg.mazeSelect], this);
		
		// Add tilemaps
		add(_level.backgroundLayer);
		
		// Add tilemaps
		add(_level.foregroundTiles);
		
		// Load player and objects of the Tiled map
		_level.loadObjects(this);
		
		Reg.manlyBoySp = new FlxSprite( 0, 5000, Reg.manlyBoy);
		add(Reg.manlyBoySp);
		mbCam = new FlxCamera(0, 0, 320, 180);
		//FlxG.camera.setScrollBoundsRect(0, 0, fullWidth, fullHeight, true);
		mbCam.setScrollBoundsRect(0, 5000, 320, 180);
		mbCam.follow(Reg.manlyBoySp);
		FlxG.cameras.add(mbCam);
		
		flagTimer = 2.5;
		//FlxG.camera.follow(player, FlxCamera.STYLE_SCREEN_BY_SCREEN);
		playerCam = new FlxCamera(Reg.windowX*Reg.gameZoom, Reg.windowY*Reg.gameZoom, 160, 128);
		playerCam.setScrollBoundsRect(0, 0, _level.fullWidth, _level.fullHeight);
		Reg.watchFlag = true;
		playerCam.follow(Reg.flagSp, LOCKON, 1);
		FlxG.cameras.add(playerCam);
		//playerCam.style = FlxCamera.STYLE_LOCKON;
		//playerCam.style = FlxCamera.STYLE_SCREEN_BY_SCREEN;
		
		Reg.hudSp = new FlxSprite(0, 4576, Reg.hud);
		add(Reg.hudSp);
		
		Reg.currentTimer = 0;
		Reg.currTxt = new FlxText(100,4578,48,"Cur: 0:00");
		Reg.currTxt.setFormat(null, 8, 0x000000);
		Reg.currTxt.alignment = "right";
		add(Reg.currTxt); 
		
		min = Std.string(Std.int(Reg.bestTimes[Reg.mazeSelect][0] / 60));
		sec = Std.int(Reg.bestTimes[Reg.mazeSelect][0] % 60);
		if (sec < 10)
		{
			secSt = "0" + Std.string(sec);
		}
		else
		{
			secSt = Std.string(sec);
		}
		
		Reg.bestTxt = new FlxText(4,4578,64,"Best: "+min+":"+secSt);
		Reg.bestTxt.setFormat(null, 8, 0x000000);
		Reg.bestTxt.alignment = "right";
		add(Reg.bestTxt); 
		
		hudCam = new FlxCamera(Reg.windowX*Reg.gameZoom, (Reg.windowY+128)*Reg.gameZoom, 160, 16);
		hudCam.setScrollBoundsRect(0, 4576, 160, 16);
		hudCam.follow(Reg.hudSp);
		FlxG.cameras.add(hudCam);
		
		FlxG.sound.play(Reg.startWav);
		winMaze = false;
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		//_level.destroy();
		/*Reg.manlyBoySp.destroy();
		mbCam.destroy();
		Reg.text.destroy();
		playerCam.destroy();
		Reg.hudSp.destroy();
		Reg.currTxt.destroy();
		Reg.bestTxt.destroy();
		hudCam.destroy();
		player.destroy();*/
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
		
		if (Reg.watchFlag)
		{
			flagTimer -= FlxG.elapsed;
			if (flagTimer <= 0)
			{
				Reg.watchFlag = false;
				playerCam.follow(player, LOCKON, 1);
			}
		}
		else{
			Reg.currentTimer += FlxG.elapsed;
			min = Std.string(Std.int(Reg.currentTimer / 60));
			sec = Std.int(Reg.currentTimer % 60);
			if (sec < 10)
			{
				secSt = "0" + Std.string(sec);
			}
			else
			{
				secSt = Std.string(sec);
			}
			
			Reg.currTxt.text = "Cur: "+min+":"+secSt;
			// Collide with foreground tile layer
			if (_level.collideWithLevel(player))
			{
				// Resetting the movement flag if the player hits the wall 
				// is crucial, otherwise you can get stuck in the wall
				player.moveToNextTile = false;
			}
			if((player.moveToNextTile == false && FlxG.overlap(Reg.flagSp, player)) || FlxG.keys.anyJustPressed(["L"]))
			{
				if(winMaze == false)
				{
					FlxG.sound.play(Reg.winWav);
					haxe.Timer.delay(goToWin, 500);
					Reg.currTime = Reg.currentTimer;
					winMaze = true;
				}
			}
		}
		if (FlxG.keys.anyJustPressed(["B"]) ||  ( Reg.usegamepad && _gamePad.justPressed.BACK))
		{
			this.goToPlay();
		}
		if (FlxG.keys.anyJustPressed(["ESCAPE"]))
		{
			SaveScores.save();
			System.exit(0);
		}
	}	
	
	public function goToWin()
	{
		FlxG.switchState(new WinState());
	}
	
	private function goToPlay():Void
	{
		FlxG.switchState(new SelectState());
	}
}
