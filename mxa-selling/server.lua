ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('mxa-selling:sell')
AddEventHandler('mxa-selling:sell', function (item, price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xItem = xPlayer.getInventoryItem(item)
        if item ~= nil or price ~= nil then
        if xItem.count >= 1 then
            xPlayer.addMoney(price * xItem.count)
            xPlayer.removeInventoryItem(item, xItem.count)
            xPlayer.showNotification('Şu eşyayı '..item..' şukadara '..price*xItem.count..' sattın ')
        else
            xPlayer.showNotification('Üstünüzde şu eşyadan '..item..' yeterli sayıda yok')
        end
    end
end)