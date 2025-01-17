package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Achievements;
import Controls;

using StringTools;

class OptionsState extends MusicBeatState
{
	var songs:Array<SongMetadata> = [];

	var curDifficulty:Int = -1;
	var options:Array<String> = ['Controls', 'Adjust Delay and Combo', 'Graphics', 'isso nao e uma musica secreta', 'Visuals and UI', 'Gameplay'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	private static var lastDifficultyName:String = '';
	private var camAchievement:FlxCamera;
	public static var menuBG:FlxSprite;
	var scoreBG:FlxSprite;
	var scoreText:FlxText;
	var diffText:FlxText;
	
	var intendedScore:Int = 0;
	var intendedRating:Float = 0;

	private var grpSongs:FlxTypedGroup<Alphabet>;

	function openSelectedSubstate(label:String) {
		switch(label) {
			case 'Note Colors':
				#if mobile
				removeVirtualPad();
				#end
				openSubState(new options.NotesSubState());
			case 'isso nao e uma musica secreta':
				#if ACHIEVEMENTS_ALLOWED
				Achievements.loadAchievements();
				var achieveID:Int = Achievements.getAchievementIndex('segredos');
				if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //gaysex
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
				}
				#end
				PlayState.storyPlaylist = ['dropped'];
				PlayState.isStoryMode = true;

				PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + '-hard', PlayState.storyPlaylist[0].toLowerCase());
				PlayState.campaignScore = 0;
				PlayState.campaignMisses = 0;
				LoadingState.loadAndSwitchState(new PlayState(), true);
				FreeplayState.destroyFreeplayVocals();
			case 'Controls':
				#if mobile
				removeVirtualPad();
				#end
				openSubState(new options.ControlsSubState());
			case 'Graphics':
				#if mobile
				removeVirtualPad();
				#end
				openSubState(new options.GraphicsSettingsSubState());
			case 'Visuals and UI':
				#if mobile
				removeVirtualPad();
				#end
				openSubState(new options.VisualsUISubState());
			case 'Gameplay':
				#if mobile
				removeVirtualPad();
				#end
				openSubState(new options.GameplaySettingsSubState());
			case 'Adjust Delay and Combo':
				LoadingState.loadAndSwitchState(new options.NoteOffsetState());
		}
	}

	var selectorLeft:Alphabet;
	var selectorRight:Alphabet;
	
	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('segredos', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "segredos"');
	}
	#end

	override function create() {
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		#if desktop
		DiscordClient.changePresence("Options Menu", null);
		#end

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		bg.color = 0xFFea71fd;
		bg.updateHitbox();

		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true);
			optionText.screenCenter();
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}

		selectorLeft = new Alphabet(0, 0, '>', true);
		add(selectorLeft);
		selectorRight = new Alphabet(0, 0, '<', true);
		add(selectorRight);

		#if mobile
		var tipText:FlxText = new FlxText(10, FlxG.height - 24, 0, 'Press C to customize your mobile controls', 16);
		tipText.setFormat(Paths.font('vcr.ttf'), 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		tipText.borderSize = 2.4;
		tipText.scrollFactor.set();
		add(tipText);
		#end

		changeSelection();
		ClientPrefs.saveSettings();
		
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;
		FlxG.cameras.add(camAchievement, false);
		
		scoreBG = new FlxSprite(scoreText.x - 6, 0).makeGraphic(1, 66, 0xFF000000);
		scoreBG.alpha = 0.6;
		add(scoreBG);
		
		scoreText = new FlxText(FlxG.width * 0.7, 5, 0, "", 32);
		scoreText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		add(scoreText);
		
		scoreText.alpha = 0;
		
		diffText = new FlxText(scoreText.x, scoreText.y);
		diffText.font = scoreText.font;
		add(diffText);
		
		if(lastDifficultyName == '')
		{
			lastDifficultyName = CoolUtil.defaultDifficulty;
		}
		curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(lastDifficultyName)));
		
		#if mobile
		addVirtualPad(UP_DOWN, A_B_C);
		#end
		
		changeDiff();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
	}

	override function update(elapsed:Float) {
		super.update(elapsed);
		
		curDifficulty = 2;
		changeDiff();
		if (controls.UI_LEFT_P)
			changeDiff(0);
		else if (controls.UI_RIGHT_P)
			changeDiff(0);

		if (controls.UI_UP_P) {
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (controls.ACCEPT) {
			openSelectedSubstate(options[curSelected]);
		}
		
		#if mobile
		if (virtualPad.buttonC.justPressed) {
		  #if mobile 
		  removeVirtualPad();
		  #end
		  openSubState(new mobile.MobileControlsSubState());
		}
		#end
	}
	
	function changeDiff(change:Int = 0)
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = CoolUtil.difficulties.length-1;
		if (curDifficulty >= CoolUtil.difficulties.length)
			curDifficulty = 0;

		lastDifficultyName = CoolUtil.difficulties[curDifficulty];

		#if !switch
		intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);
		intendedRating = Highscore.getRating(songs[curSelected].songName, curDifficulty);
		#end
		
		#if PRELOAD_ALL
		FlxG.sound.music.volume = 0;
		FlxG.sound.playMusic(Paths.inst(songs[curSelected].songName), 0);
		#end

		PlayState.storyDifficulty = curDifficulty;
		diffText.text = '< ' + CoolUtil.difficultyString() + ' >';
		positionHighscore();
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
				selectorLeft.x = item.x - 63;
				selectorLeft.y = item.y;
				selectorRight.x = item.x + item.width + 15;
				selectorRight.y = item.y;
			}
		}
		FlxG.sound.play(Paths.sound('scrollMenu'));
		
		CoolUtil.difficulties = CoolUtil.defaultDifficulties.copy();
		var diffStr:String = WeekData.getCurrentWeek().difficulties;
		if(diffStr != null) diffStr = diffStr.trim(); //Fuck you HTML5

		if(diffStr != null && diffStr.length > 0)
		{
			var diffs:Array<String> = diffStr.split(',');
			var i:Int = diffs.length - 1;
			while (i > 0)
			{
				if(diffs[i] != null)
				{
					diffs[i] = diffs[i].trim();
					if(diffs[i].length < 1) diffs.remove(diffs[i]);
				}
				--i;
			}

			if(diffs.length > 0 && diffs[0].length > 0)
			{
				CoolUtil.difficulties = diffs;
			}
		}
		
		if(CoolUtil.difficulties.contains(CoolUtil.defaultDifficulty))
		{
			curDifficulty = Math.round(Math.max(0, CoolUtil.defaultDifficulties.indexOf(CoolUtil.defaultDifficulty)));
		}
		else
		{
			curDifficulty = 0;
		}

		var newPos:Int = CoolUtil.difficulties.indexOf(lastDifficultyName);
		//trace('Pos of ' + lastDifficultyName + ' is ' + newPos);
		if(newPos > -1)
		{
			curDifficulty = newPos;
		}
	}
	
	private function positionHighscore() {
		diffText.x = Std.int(scoreBG.x + (scoreBG.width / 2));
		diffText.x -= diffText.width / 2;
	}
}

class SongMetadata
{
	public var songName:String = "";
	
	public function new(song:String)
	{
		this.songName = song;
		this.folder = Paths.currentModDirectory;
		if(this.folder == null) this.folder = '';
	}
}
