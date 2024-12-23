function onCreate() --Thx Dgl, se não fosse por você, estaria perdido
makeLuaSprite('bg', 'weekbob/stageback', -500, -300);
setScrollFactor('bg', 0.9, 0.9);
scaleObject('bg', 1, 1);
addLuaSprite('bg', false);

makeLuaSprite('front', 'weekbob/stagefront', -500, 600);
setScrollFactor('front', 0.9, 0.9);
scaleObject('front', 1, 1);
addLuaSprite('front', false);

makeLuaSprite('curty', 'weekbob/stagecurtains', -500, -245);
setScrollFactor('curty', 1.15, 0.9);
scaleObject('curty', 1, 1);
addLuaSprite('curty', true);
end