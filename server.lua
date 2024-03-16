ESX = exports['es_extended']:getSharedObject()


RegisterNetEvent('achatitem')
AddEventHandler('achatitem', function(v)

  local source = source
  local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.getMoney() >= v.prix then
    xPlayer.removeMoney(v.prix)
    xPlayer.addInventoryItem(v.futo, 1)
    TriggerClientEvent('esx:showNotification', source, ("Vous avez achetÃ© une ~b~%s~s~ pour ~g~%s$"):format(v.name, v.prix))
  else
    TriggerClientEvent('esx:showNotification', source, "~r~Vous n'avez pas assez d'argent")
  end
end)
