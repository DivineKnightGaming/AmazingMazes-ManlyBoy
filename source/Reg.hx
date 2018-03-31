package;

import flixel.util.FlxSave;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
//import flixel.effects.FlxSpriteFilter;
import flixel.group.FlxGroup;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	public static var highScore:Int = 0;
	
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];
	
	public static var gameZoom:Int = 4;
	
	public static var text:FlxText;
	public static var controlsText:FlxText;
	public static var sprite:FlxSprite;
	public static var button:FlxButton;
	
	public static var manlyBoy="assets/images/manly_boy.png";
	public static var manlyBoySp:FlxSprite;
	
	public static var windowX = 80;
	public static var windowY = 18;
	
	public static var dkLogo="assets/images/dklogo_bw_sm.png";
	public static var dkLogoSp:FlxSprite;
	
	public static var amazingMazesLogo="assets/images/amazingMazes.png";
	
	public static var player="assets/images/player.png";
	public static var playerSp:FlxSprite;
	public static var flag="assets/images/flag.png";
	public static var flagSp:FlxSprite;
	public static var watchFlag:Bool;
	
	public static var hud="assets/images/hud.png";
	public static var hudSp:FlxSprite;
	public static var bestTxt:FlxText;
	public static var currTxt:FlxText;
	public static var currTime:Float = 0;
	
	public static var startWav="assets/sounds/start.wav";
	public static var winWav="assets/sounds/win.wav";
	public static var selectWav="assets/sounds/select.wav";
	
	public static var currentTimer:Float = 0;
	public static var mazeSelect:Int = 0;
	public static var mazes:Array<String> = ["assets/data/maze_1.tmx", "assets/data/maze_2.tmx", "assets/data/maze_3.tmx", "assets/data/maze_4.tmx",
												"assets/data/maze_5.tmx","assets/data/maze_6.tmx","assets/data/maze_7.tmx","assets/data/maze_8.tmx"];
	public static var bestTimes:Array<Array<Float>> = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
														[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]];
	public static var mazeButtons:Array<String> = ["assets/images/maze_1.png", "assets/images/maze_2.png", "assets/images/maze_3.png", "assets/images/maze_4.png"
													,"assets/images/maze_5.png","assets/images/maze_6.png","assets/images/maze_7.png","assets/images/maze_8.png"];
	public static var mazeButtonSprites:Array<FlxSprite> = [null,null,null,null,null,null,null,null];
	public static var mazeSelectImg="assets/images/maze_select.png";
	public static var selectSp:FlxSprite;
	
	public static var fullScreen:Bool = false;
	
	
	/*public static var buttonO="A";
	public static var buttonU="X";
	public static var buttonY="Start";
	public static var buttonA="B";*/
	
	public static var controls="Keyboard";
	public static var dpad="Arrows";
	public static var buttonO="Space";
	public static var buttonU="Q";
	public static var buttonY="G";
	public static var buttonA="Z";
	public static var usegamepad:Bool = true;
		
	
}
