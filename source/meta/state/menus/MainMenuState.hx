package meta.state.menus;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.mouse.FlxMouse;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import meta.MusicBeat.MusicBeatState;
import meta.data.dependency.Discord;

using StringTools;

class MainMenuState extends MusicBeatState
{
	var background:FlxSprite;
	var storymode:FlxSprite;
	var freeplay:FlxSprite;
	var settings:FlxSprite;
	var menuPath:String = 'menus/dreamerfunkin/';
	override function create()
	{
		super.create();

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		#if !html5
		Discord.changePresence('MENU SCREEN', 'Main Menu');
		#end

		ForeverTools.resetMenuMusic();

		FlxG.mouse.enabled = true;
		FlxG.mouse.useSystemCursor = true;
		FlxG.mouse.visible = true;

		// warning: coding is gonna be shit from now on lol
		background = new FlxSprite().loadGraphic(Paths.image(menuPath + 'background'));
		background.screenCenter();
		background.scrollFactor.set();
		background.antialiasing = true;
		add(background);

		storymode = new FlxSprite(358, 342);
		storymode.frames = Paths.getSparrowAtlas(menuPath + 'dreams');
		storymode.scrollFactor.set();
		storymode.antialiasing = true;
		add(storymode);

		freeplay = new FlxSprite(898, 383);
		freeplay.frames = Paths.getSparrowAtlas(menuPath + 'freeplay');
		freeplay.scrollFactor.set();
		freeplay.antialiasing = true;
		add(freeplay);

		settings = new FlxSprite(1154, 93).loadGraphic(Paths.image(menuPath + 'settings'));
		settings.scrollFactor.set();
		settings.antialiasing = true;
		add(settings);
	}
	override function update(elapsed:Float)
	{
		if (FlxG.mouse.overlaps(storymode))
		{
			Main.switchState(this, new StoryMenuState());
		}
		if (FlxG.mouse.overlaps(freeplay))
		{
			Main.switchState(this, new FreeplayState());
		}
		if (FlxG.mouse.overlaps(settings))
		{
			Main.switchState(this, new OptionsMenuState());
		}
	}
}
