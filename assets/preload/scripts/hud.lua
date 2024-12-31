local ShowSplash=false
local frame = 150
local hitCombo = 0
function onCreatePost()
if not isPixel6 or not isPixel7 then 
ShowSplash=true
end

if songName == 'Third Cheat' then
makeLuaSprite('blackOut', nil, 0, 0)
makeGraphic('blackOut', screenWidth, screenHeight, '000000')
setObjectCamera('blackOut', 'hud')
addLuaSprite('blackOut')
end

mal = getProperty('iconP2.animation.name')
bien = getProperty('iconP1.animation.name')

makeAnimatedLuaSprite('scary', 'Health', 365 -10, 25)
addAnimationByPrefix('scary', 'barra', 'Health', 12, true);
setObjectCamera('scary', 'hud')
scaleObject('scary', 1.55, 1.55);
addLuaSprite('scary', true)

makeAnimatedLuaSprite('upscril', 'support', 365 -10, 25)
addAnimationByPrefix('upscril', 'barra', 'Health', 12, true);
setObjectCamera('upscril', 'hud')
scaleObject('upscril', 1.55, 1.55);
addLuaSprite('upscril', true)

makeAnimatedLuaSprite('oponenteIcon',nil, 350 -10, 85)
loadGraphic('oponenteIcon','icons/icon-'..mal, frame)
addAnimation('oponenteIcon','icons/icon-'..mal, {0, 1}, 0, true)
setObjectCamera('oponenteIcon', 'hud')
addLuaSprite('oponenteIcon', true)

makeAnimatedLuaSprite('playericon',nil, 800 -10, 115)
loadGraphic('playericon','icons/icon-'..bien, frame)
addAnimation('playericon','icons/icon-'..bien, {0, 1}, 0, true)
setObjectCamera('playericon', 'hud')
setProperty('playericon.flipX', true)
addLuaSprite('playericon', true)

makeAnimatedLuaSprite('rating', 'conter_assets', -450, -70);
setObjectCamera('rating', 'hud')
scaleObject('rating', 1.25, 1.25);
-- Animations
addAnimationByPrefix('rating', 'goofy', 'sick', 24, false);
addAnimationByPrefix('rating', 'godness', 'good', 24, false);
addAnimationByPrefix('rating', 'trash', 'bad', 24, false);
addAnimationByPrefix('rating', 'horrible', 'shit', 24, false);
-- Add Imagw lol
addLuaSprite('rating', false);

setProperty('healthBar.scale.x', 0.30)
setProperty('healthBar.scale.y', 9.45)
setProperty('healthBar.x', 355 -10)
setProperty('healthBar.y', 97)

setProperty('iconP2.visible', false);
setProperty('scoreTxt.visible', false);
setProperty('healthBarBG.visible', false);
setProperty('iconP1.visible', false);
setProperty('grpNoteSplashes.visible', false);
setProperty('showComboNum', false)
setProperty('showCombo', false)
setProperty('showRating', false)

setObjectOrder('blackOut', 1)
setObjectOrder('healthBar', 3)
setObjectOrder('scary', 4)
setObjectOrder('upscril', 5)
setObjectOrder('oponenteIcon', 6)
setObjectOrder('playericon', 7)
setObjectOrder('rating', 35)
end

function opponentNoteHit() --Tenq ser justo né
if getProperty('health') > 0.1 then
setProperty('health', getProperty('health') - 0.02);
end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if not isSustainNote then
hitCombo = getProperty(hitCombo)+ 1
end
doTweenX('bob', 'rating', -215, 2.6, 'expoout');

local rating = getPropertyFromGroup('notes', id, 'rating')

if rating == 'sick' then
playAnim('rating', 'goofy', true);
end
if rating == 'good' then
playAnim('rating', 'godness', true);
end
if rating == 'bad' then
playAnim('rating', 'trash', true);
end
if rating == 'shit' then
playAnim('rating', 'horrible', true);
end
end

function onStepHit()
if curStep == 32 and songName == 'Third Cheat' then 
doTweenAlpha('BlackOutBye', 'blackOut', 0, 5, 'Linear')
end
if curStep == 416 and songName == 'Third Cheat' then 
doTweenAlpha('HiAgainBlackOut', 'blackOut', 1, 4.25, 'Linear')
end
end

function noteMiss(id, direction, noteType, isSustainNote)
if getProperty('songMisses')+ 1 and hitCombo >= 10  then
triggerEvent("Play Animation", "PLAYERMISS", "DAD")
triggerEvent("Play Animation", "misses", "GF")
hitCombo = 0
end
end

function onUpdate()
if not downscroll then
setProperty('scary.y', 575)
setProperty('upscril.y', 485)
setProperty('healthBar.y', 647)
setProperty('oponenteIcon.y', 545)
setProperty('playericon.y', 575)
setProperty('rating.y', 70)
end

setProperty('rating.angle',  40)
setProperty('oponenteIcon.scale.x', getProperty('iconP2.scale.x'))
setProperty('oponenteIcon.scale.y', getProperty('iconP2.scale.y'))

setProperty('playericon.scale.x', getProperty('iconP1.scale.x'))
setProperty('playericon.scale.y', getProperty('iconP1.scale.y'))

if getProperty('health') > 1.6 then
setProperty('oponenteIcon.animation.curAnim.curFrame', '1')
setProperty('playericon.curAnim.curFrame', '1')
end
if getProperty('health') < 1.6 and getProperty('health') > 0.4 then
setProperty('oponenteIcon.animation.curAnim.curFrame', '0')
setProperty('playericon.animation.curAnim.curFrame', '0')
end
end

function onEndSong()
doTweenX('bob', 'rating', -450, 1.4, 'expoin');
end
