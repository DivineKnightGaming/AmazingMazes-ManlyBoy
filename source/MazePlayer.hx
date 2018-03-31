package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import flixel.input.gamepad.FlxGamepad;
//import flixel.input.gamepad.XboxButtonID;
//import flixel.input.gamepad.OUYAButtonID;

/**
 * ...
 * @author .:BuzzJeux:.
 */
enum MoveDirection
{
	UP;
	DOWN;
	LEFT;
	RIGHT;
}

class MazePlayer extends FlxSprite
{
	/**
	 * How big the tiles of the tilemap are.
	 */
	private static inline var TILE_SIZE:Int = 16;
	/**
	 * How many pixels to move each frame. Has to be a divider of TILE_SIZE 
	 * to work as expected (move one block at a time), because we use the
	 * modulo-operator to check whether the next block has been reached.
	 */
	#if mobile
	private static inline var MOVEMENT_SPEED:Int = 2;
	#else
	private static inline var MOVEMENT_SPEED:Int = 1;
	#end
	/**
	 * Flag used to check if char is moving.
	 */ 
	public var moveToNextTile:Bool;
	/**
	 * Var used to hold moving direction.
	 */ 
	private var moveDirection:MoveDirection;
	
	private var _gamePad:FlxGamepad;
	
	public function new(X:Int, Y:Int)
	{
		// X,Y: Starting coordinates
		super(X, Y);
		
		// Make the player graphic.
		//makeGraphic(TILE_SIZE, TILE_SIZE, 0xffc04040);
		loadGraphic(Reg.player, true, 16, 16);
		
		animation.add("walkdown", [1, 0, 1, 2], 4, true);
		animation.add("walkup", [4, 3, 4, 5], 4, true);
		animation.add("walkleft", [7, 6, 7, 8], 4, true);
		animation.add("walkright", [10, 9, 10, 11], 4, true);
		
		animation.play("walkup");
		//moveDirection = MoveDirection.UP;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);  
		
		_gamePad = FlxG.gamepads.lastActive;
		if (_gamePad == null)
		{
			// Make sure we don't get a crash on neko when no gamepad is active
			_gamePad = FlxG.gamepads.getByID(0);
		}
		
		// Move the player to the next block
		if (!Reg.watchFlag)
		{
			if (moveToNextTile)
			{
				switch (moveDirection)
				{
					case UP:
						y -= MOVEMENT_SPEED;
						animation.play("walkup");
					case DOWN:
						y += MOVEMENT_SPEED;
						animation.play("walkdown");
					case LEFT:
						x -= MOVEMENT_SPEED;
						animation.play("walkleft");
					case RIGHT:
						x += MOVEMENT_SPEED;
						animation.play("walkright");
				}
			}
			
			// Check if the player has now reached the next block
			if ((x % TILE_SIZE == 0) && (y % TILE_SIZE == 0))
			{
				moveToNextTile = false;
			}
			
			/*if (y > 576)
			{
				moveToNextTile = false;
				y = 576;
			}*/
			// Check for WASD or arrow key presses and move accordingly
			if (FlxG.keys.anyPressed(["DOWN", "S"]) ||  ( Reg.usegamepad && _gamePad.pressed.DPAD_DOWN))
			{
				moveTo(MoveDirection.DOWN);
			}
			else if (FlxG.keys.anyPressed(["UP", "W"]) ||  ( Reg.usegamepad && _gamePad.pressed.DPAD_UP))
			{
				moveTo(MoveDirection.UP);
			}
			else if (FlxG.keys.anyPressed(["LEFT", "A"]) ||  ( Reg.usegamepad && _gamePad.pressed.DPAD_LEFT))
			{
				moveTo(MoveDirection.LEFT);
			}
			else if (FlxG.keys.anyPressed(["RIGHT", "D"]) ||  ( Reg.usegamepad && _gamePad.pressed.DPAD_RIGHT))
			{
				moveTo(MoveDirection.RIGHT);
			}
		}
	}
	
	public function moveTo(Direction:MoveDirection):Void
	{
		// Only change direction if not already moving
		if (!moveToNextTile)
		{
			moveDirection = Direction;
			moveToNextTile = true;
		}
	}
}
