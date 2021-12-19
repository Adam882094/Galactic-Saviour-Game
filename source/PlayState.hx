package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.math.FlxMath;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

enum GameState {
	Start;
	Stop;
}
	// global var
		var score = 0;
		var miss = 0;
		var reset = 650;
		var fistGame = 0;
		var level = 0;
		var b = 0;

		var scoreText:FlxText;
		var missText:FlxText;
		var startGame:FlxText;
		var endGame:FlxText;
		var title:FlxText;

		var background:FlxSprite;
		var alienOne:FlxSprite;
		var alienTwo:FlxSprite;
		var alienThree:FlxSprite;
		var alienFour:FlxSprite;
		var alienFive:FlxSprite;
		var friendly:FlxSprite;

		var easyBtn:FlxButton;
		var mediumBtn:FlxButton;
		var hardBtn:FlxButton;

		var speedTime:FlxTimer;

class PlayState extends FlxState
{
	
	override public function create()
	{
		super.create();

		//background music
		FlxG.sound.playMusic(AssetPaths.Tutorials_TurnBasedRPG_assets_music_HaxeFlixel_Tutorial_Game__ogg, 0.2, true);

		// Background image of space
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.spacee__png);
		add(background);

		// Adds alien image #1
		alienOne = new FlxSprite();
		alienOne.loadGraphic(AssetPaths.alienOne__png);
		alienOne.x = 900;
		alienOne.y = FlxG.random.int(0, 400);
		add(alienOne);

		// Adds alien image #2
		alienTwo = new FlxSprite();
		alienTwo.loadGraphic(AssetPaths.alienTwo__png);
		alienTwo.x = 900;
		alienTwo.y = FlxG.random.int(0, 400);
		add(alienTwo);

		// Adds alien image #3
		alienThree = new FlxSprite();
		alienThree.loadGraphic(AssetPaths.alienThree__png);
		alienThree.x = 900;
		alienThree.y = FlxG.random.int(0, 400);
		add(alienThree);

		// Adds alien image #4
		alienFour = new FlxSprite();
		alienFour.loadGraphic(AssetPaths.alienFour__png);
		alienFour.x = 900;
		alienFour.y = FlxG.random.int(0, 400);
		add(alienFour);

		// Adds alien image #5
		alienFive = new FlxSprite();
		alienFive.loadGraphic(AssetPaths.alienFive__png);
		alienFive.x = 900;
		alienFive.y = FlxG.random.int(0, 400);
		add(alienFive);

		// Adds alien image #5
		//friendly = new FlxSprite();
		//friendly.loadGraphic(AssetPaths.friendly__png);
		//friendly.x = 900;
		//friendly.y = FlxG.random.int(0, 400);
		//add(friendly);

		//adds score
		scoreText = new flixel.text.FlxText(0,0,0, " ", 20);
		add(scoreText);

		//adds misses
		missText = new flixel.text.FlxText(150,0,0, " ", 20);
		add(missText);

		//adds game over text
		endGame = new flixel.text.FlxText(100,40,0, " ", 60);
		add(endGame);

		title = new flixel.text.FlxText(0,0,0, "Galactic Saviour ", 60);
		add(title);

		startGame = new flixel.text.FlxText(0,115,0, "Welcome to the Galactic Saviours of Earth!\nYour mission is stop the alien ships from\nreaching our planet. Shoot the aliens with\nyour mouse. Good Luck!", 20);
		add(startGame);

		//easy button
		easyBtn = new FlxButton(125, 400, "Easy", easyPress);
		add(easyBtn);

		//medium button
		mediumBtn = new FlxButton(275, 400, "Medium", mediumPress);
		add(mediumBtn);

		//hard button
		hardBtn = new FlxButton(425, 400, "Hard", hardPress);
		add(hardBtn);

		//setGameStyle(Paused);
	}

	

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (miss >= 3)
		{
			gameOver();
		}

		//Alien speed
		if (level == 1)
		{
			alienOne.x = alienOne.x - 2;
			alienTwo.x = alienTwo.x - 2;
			alienThree.x = alienThree.x - 2;
			alienFour.x = alienFour.x - 2;
			alienFive.x = alienFive.x - 2;

		}

		if (level == 2)
		{
			alienOne.x = alienOne.x - 3;
			alienTwo.x = alienTwo.x - 3;
			alienThree.x = alienThree.x - 3;
			alienFour.x = alienFour.x - 3;
			alienFive.x = alienFive.x - 3;
		
		}

		if (level == 3)
		{
				alienOne.x = alienOne.x - 2 - b;
				alienTwo.x = alienTwo.x - 3 - b;
				alienThree.x = alienThree.x - 4 - b;
				alienFour.x = alienFour.x - 2 - b;
				alienFive.x = alienFive.x - 2 - b;
		}

		if (alienOne.x < 0)
		{
			funMiss();
			alienOne.x = reset;
			alienOne.y = FlxG.random.int(0, 400);
		}
		if (alienTwo.x < 0)
		{
			funMiss();
			alienTwo.x = reset;
			alienTwo.y = FlxG.random.int(0, 400);
		}
		if (alienThree.x < 0)
		{
			funMiss();
			alienThree.x = reset;
			alienThree.y = FlxG.random.int(0, 400);
		}
		if (alienFour.x < 0)
		{
			funMiss();
			alienFour.x = reset;
			alienFour.y = FlxG.random.int(0, 400);
		}
		if (alienFive.x < 0)
		{
			funMiss();
			alienFive.x = reset;
			alienFive.y = FlxG.random.int(0, 400);
		}

		if(FlxG.mouse.overlaps(alienOne)){
			if(FlxG.mouse.pressed) {
				funScore();
				alienOne.x = reset;
				alienOne.y = FlxG.random.int(0, 400);
			}
		}
		if(FlxG.mouse.overlaps(alienTwo)){
			if(FlxG.mouse.pressed) {
				funScore();
				alienTwo.x = reset;
				alienTwo.y = FlxG.random.int(0, 400);
			}
		}
		if(FlxG.mouse.overlaps(alienThree)){
			if(FlxG.mouse.pressed) {
				funScore();
				alienThree.x = reset;
				alienThree.y = FlxG.random.int(0, 400);
			}
		}
		if(FlxG.mouse.overlaps(alienFour)){
			if(FlxG.mouse.pressed) {
				funScore();
				alienFour.x = reset;
				alienFour.y = FlxG.random.int(0, 400);
			}
		}
		if(FlxG.mouse.overlaps(alienFive)){
			if(FlxG.mouse.pressed) {
				funScore();
				alienFive.x = reset;
				alienFive.y = FlxG.random.int(0, 400);
			}
		}
		
	}

	function easyPress(){
		restart();
		level = 1;
	}

	function mediumPress(){
		restart();
		level = 2;
	}

	function hardPress(){
		restart();
		level = 3;
		new FlxTimer().start(5.0, funTime, 0);
	}

	function funTime(timer:FlxTimer){
		if (level == 3)
		{
			b++;
		}
	}

	function restart(){ //restarts entire game
		startGame.text = " ";
		endGame.text = " ";
		title.text = " ";
		easyBtn.x = -400;
		mediumBtn.x = -400;
		hardBtn.x = -400;
		score = 0;
		miss = 0;
		b = 0;
		missText.text = " ";
		missText.text = "Misses: " + miss;
		scoreText.text = " ";
		scoreText.text = "Score: " + score;
		alienOne.x = FlxG.random.int(600, 900);
		alienOne.y = FlxG.random.int(0, 400);
		alienTwo.x = FlxG.random.int(600, 900);
		alienTwo.y = FlxG.random.int(0, 400);
		alienThree.x = FlxG.random.int(600, 900);
		alienThree.y = FlxG.random.int(0, 400);
		alienFour.x = FlxG.random.int(600, 900);
		alienFour.y = FlxG.random.int(0, 400);
		alienFive.x = FlxG.random.int(600, 900);
		alienFive.y = FlxG.random.int(0, 400);

	}

	function gameOver(){
		alienOne.x = 800;
		alienTwo.x = 800;
		alienThree.x = 800;
		alienFour.x = 800;
		alienFive.x = 800;
		missText.text = " ";
		scoreText.text = " ";
		endGame.text = "Game Over\nFinal Score:\n        " + score + "\nPlay Again?";
		easyBtn.x = 125;
		mediumBtn.x = 275;
		hardBtn.x = 425;
		level = 0;
	}

	function funMiss(){
		FlxG.sound.play(AssetPaths.loser__wav);
		miss++;
		missText.text = " ";
		missText.text = "Misses: " + miss;
	}

	function funScore(){
		FlxG.sound.play(AssetPaths.laser__wav);
		score++;
		scoreText.text = " ";
		scoreText.text = "Score: " + score;
	}
}
