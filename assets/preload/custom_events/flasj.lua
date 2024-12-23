function onEvent(name, value1, value2)
if name == 'flasj' and value1 == 'boom' then
makeLuaSprite('flash', '', 0, 0);
makeGraphic('flash',1280,720,'ffffff')
addLuaSprite('flash', true);
setProperty('flash.scale.x',2)
setProperty('flash.scale.y',2)
setProperty('flash.alpha',0)
setProperty('flash.alpha',0.85)
doTweenAlpha('flTw','flash',0,0.50,'linear')
end
end