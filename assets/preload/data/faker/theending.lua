TheEnding = false
therealend = false
skipend = false

function onCreatePost()
makeAnimatedLuaSprite('fab', 'cred/Fab')
addAnimationByPrefix('fab','credboom','idle0',12,true)
setObjectCamera('fab', 'hud')
addLuaSprite('fab', true)

makeAnimatedLuaSprite('bob', 'cred/bob')
addAnimationByPrefix('bob','credboom','idle0',12,true)
setObjectCamera('bob', 'hud')
addLuaSprite('bob', true)

makeAnimatedLuaSprite('dgl', 'cred/Dgl')
addAnimationByPrefix('dgl','credboom','idle0',12,true)
setObjectCamera('dgl', 'hud')
addLuaSprite('dgl', true)

makeAnimatedLuaSprite('vsilvando', 'cred/Vsilva')
addAnimationByPrefix('vsilvando','credboom','idle0',12,true)
setObjectCamera('vsilvando', 'hud')
addLuaSprite('vsilvando', true)

makeAnimatedLuaSprite('gaby', 'cred/Gabo') -- olha eu pai!!!
addAnimationByPrefix('gaby','credboom','idle0',12,true)
setObjectCamera('gaby', 'hud')
addLuaSprite('gaby', true)

makeLuaSprite('preto', 'black') -- ele fez tudo, confia
setObjectCamera('preto', 'hud')
addLuaSprite('preto', true)

makeLuaText('mensagem', 'Press Space or click on this message.', 2900, -340, 700);  
setObjectCamera('mensagem', 'other');
setTextBorder('mensagem', 2, '0000FF') 
setTextSize('mensagem', 15);
setTextFont('mensagem', 'vcr.ttf')
addLuaText('mensagem');

setProperty('fab.alpha', 0);
setProperty('bob.alpha', 0);
setProperty('dgl.alpha', 0);
setProperty('vsilvando.alpha', 0);
setProperty('gaby.alpha', 0);
setProperty('preto.alpha', 0);
setProperty('mensagem.alpha', 0);
end

function onEndSong()
if not TheEnding then
playMusic('final_song', 1, false)
runTimer('fab', 6.90)
doTweenAlpha('14', 'mensagem', 1, 2.5, 'linear')
skipend = true

return Function_Stop;
end
return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'fab' then
doTweenAlpha('1', 'fab', 1, 1.25, 'linear');
runTimer('bob', 3.40)
skipend = true
end
if tag == 'bob' then
setProperty('fab.alpha', 0);
setProperty('bob.alpha', 1);
runTimer('dgl', 3.40)
end
if tag == 'dgl' then
setProperty('bob.alpha', 0);
setProperty('dgl.alpha', 1);
runTimer('vsilvando', 3.40)
end
if tag == 'vsilvando' then
setProperty('dgl.alpha', 0);
setProperty('vsilvando.alpha', 1);
runTimer('gabo', 3.40)
end
if tag == 'gabo' then
setProperty('vsilvando.alpha', 0);
setProperty('gaby.alpha', 1);
runTimer('black', 3.40)
end
if tag == 'black' then
setProperty('gaby.alpha', 0);
setProperty('preto.alpha', 1);
runTimer('bobagain', 1.70)
end
if tag == 'bobagain' then
setProperty('preto.alpha', 0);
triggerEvent("Play Animation", "cut", "DAD")
runTimer('pretoagain', 1.70)
end
if tag == 'pretoagain' then
setProperty('preto.alpha', 1);
runTimer('ending', 1.95)
end
if tag == 'ending' then
therealend = true
end
end

function onUpdate(elapsed)
if skipend == true then
if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('enter') or keyPressed('space') then 
endSong() 
therealend = true
skipend = false
end
end
if therealend == true then
endSong() 
TheEnding = true
end
end