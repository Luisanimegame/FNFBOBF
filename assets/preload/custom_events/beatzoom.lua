local Luke = ''

function onEvent(name, v1) -- By Luke(Gabo)
if name == 'beatzoom' then
Luke = v1
end
end

function onBeatHit()
if curBeat % Luke == 0 then
triggerEvent("Add Camera Zoom")
end
end