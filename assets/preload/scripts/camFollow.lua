-- By Ansfoxy (Thx)

local moveMult = 15
local time = 0.5
local ease = 'linear'
local gf=false
local bf=true
local dad=true

local followchars = true;

function onUpdatePost()
if followchars == true then
if mustHitSection == false then
if dad and getProperty('dad.animation.curAnim.name') == 'singLEFT' or dad and getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', -moveMult, time, ease)
end
if dad and getProperty('dad.animation.curAnim.name') == 'singRIGHT' or dad and getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', moveMult, time, ease)
end
if dad and getProperty('dad.animation.curAnim.name') == 'singUP' or dad and getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', -moveMult, time, ease)
end
if dad and getProperty('dad.animation.curAnim.name') == 'singDOWN' or dad and getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', moveMult, time, ease)
end
if dad and getProperty('dad.animation.curAnim.name') == 'idle' or dad and getProperty('dad.animation.curAnim.name') == 'idle-alt' then
 doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
if dad and getProperty('dad.animation.curAnim.name') == 'danceLeft' or dad and getProperty('dad.animation.curAnim.name') == 'danceRight' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
if gf and getProperty('gf.animation.curAnim.name') == 'singLEFT' or gf and getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', -moveMult, time, ease)
end
if gf and getProperty('gf.animation.curAnim.name') == 'singRIGHT' or gf and getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', moveMult, time, ease)
end
if gf and getProperty('gf.animation.curAnim.name') == 'singUP' or gf and getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', -moveMult, time, ease)
end
if gf and getProperty('gf.animation.curAnim.name') == 'singDOWN' or gf and getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', moveMult, time, ease)
end
if gf and getProperty('gf.animation.curAnim.name') == 'idle' or gf and getProperty('gf.animation.curAnim.name') == 'idle-alt' then
 doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
if gf and getProperty('gf.animation.curAnim.name') == 'danceLeft' or gf and getProperty('gf.animation.curAnim.name') == 'danceRight' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
gf2=false
else
gf=false
if bf and getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or bf and getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', -moveMult, time, ease)
end
if bf and getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or bf and getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', moveMult, time, ease)
end
if bf and getProperty('boyfriend.animation.curAnim.name') == 'singUP' or bf and getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', -moveMult, time, ease)
end
if bf and getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or bf and getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', moveMult, time, ease)
end
if bf and getProperty('boyfriend.animation.curAnim.name') == 'idle' or bf and getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
 doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
if bf and getProperty('boyfriend.animation.curAnim.name') == 'danceLeft' or bf and getProperty('boyfriend.animation.curAnim.name') == 'danceRight' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
if gf2 and getProperty('gf.animation.curAnim.name') == 'singLEFT' or gf2 and getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', -moveMult, time, ease)
end
if gf2 and getProperty('gf.animation.curAnim.name') == 'singRIGHT' or gf2 and getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
doTweenX('camGameTarX', 'camGame.targetOffset', moveMult, time, ease)
end
if gf2 and getProperty('gf.animation.curAnim.name') == 'singUP' or gf2 and getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', -moveMult, time, ease)
end
if gf2 and getProperty('gf.animation.curAnim.name') == 'singDOWN' or gf2 and getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', moveMult, time, ease)
end
if gf2 and getProperty('gf.animation.curAnim.name') == 'idle' or gf2 and getProperty('gf.animation.curAnim.name') == 'idle-alt' then
 doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
if gf2 and getProperty('gf.animation.curAnim.name') == 'danceLeft' or gf2 and getProperty('gf.animation.curAnim.name') == 'danceRight' then
doTweenX('camGameTarX', 'camGame.targetOffset', 0, time, ease)
doTweenY('camGameTarY', 'camGame.targetOffset', 0, time, ease)
end
end
end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if gfSection or noteType == 'GF Sing' then
gf2=true bf=false else gf2=false bf=true end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
if gfSection or noteType == 'GF Sing' then
gf=true dad=false else gf=false dad=true end
end