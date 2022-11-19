local siguienteTiempo = 120 -- ESTO ES EL TIEMPO QUE DURARA EL STORAGE (5 dias = 120 horas)
local storage = 845620  --- este numero significa la identificacion que tendra el jugador por cierta cantidad de tiempo definida arriba

function onUse(player, item, fromPos, target, toPos, isHotkey)  --- funciona USAR(hacerclick)
    local accesoMissFortune = player:getStorageValue(storage) <= os.time() and true or false
    if accesoMissFortune then
       player:setStorageValue(storage, os.time() + (60 * 60 * siguienteTiempo))  ---- setiar el tiempo al jugador
       player:sendTextMessage(MESSAGE_INFO_DESCR, 'Has conseguido acceso a Miss Fortune Zone Tienes 5 Dias Para Farmear la Skin') --- mensaje al jugador
       player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW) --- efecto sobre el jugador
       item:remove(1)
    else
       player:sendTextMessage(MESSAGE_INFO_DESCR, 'Espera ' .. siguienteTiempo .. ' Horas/Dias para Poder Usar otra vez el Objeto Sagrado') --- segundo mensaje al jugador
    end
    return true
    end