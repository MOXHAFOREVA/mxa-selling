ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('mxa-selling:sell')
AddEventHandler('mxa-selling:sell', function (item, price)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
        if item ~= nil or price ~= nil then
            if type(item) == "table" then
                for _, items in pairs(item) do
                      local xItem = xPlayer.getInventoryItem(items)
                    if xItem.count >= 1 then
                        xPlayer.addMoney(price * xItem.count)
                        xPlayer.removeInventoryItem(item, xItem.count)
                        xPlayer.showNotification('Şu eşyayı '..item..' şukadara '..price*xItem.count..' sattın ')
                    else
                        xPlayer.showNotification('Üstünüzde şu eşyadan '..items..' yeterli sayıda yok')
                    end
                end
                
                else
                   local xItem = xPlayer.getInventoryItem(item)
                if xItem.count >= 1 then
                xPlayer.addMoney(price * xItem.count)
                xPlayer.removeInventoryItem(item, xItem.count)
                xPlayer.showNotification('Şu eşyayı '..item..' şukadara '..price*xItem.count..' sattın ')
            else
                xPlayer.showNotification('Üstünüzde şu eşyadan '..item..' yeterli sayıda yok')
            end
       end
    end
end)
