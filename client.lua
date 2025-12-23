local vehicleModels = {
    "ambulance", "firetruk", "police", "police2", "police3", "police4",
    "fbi", "fbi2", "policet", "policeb", "riot", "barracks", "barracks2",
    "barracks3", "rhino", "lazer", "valkyrie2", "savage", "chernobog",
    "khanjali", "menacer", "scarab", "scarab2", "scarab3", "armytanker",
    "avenger2", "tula", "bombushka", "volatol", "starling", "nokota",
    "strikeforce", "rogue", "cargoplane", "jet", "buzzard", "titan",
    "cargobob", "cargobob2", "cargobob3", "cargobob4", "akula", "hunt"
}

local pedModels = {
    "s_m_m_paramedic_01", "s_m_m_paramedic_02", "s_m_y_fireman_01",
    "s_m_y_pilot_01", "s_m_y_cop_01", "s_m_y_cop_02", "s_m_y_swat_01",
    "s_m_y_hwaycop_01", "s_m_y_marine_01", "s_m_y_marine_02",
    "s_m_y_marine_03", "s_m_m_marine_01", "s_m_m_marine_02"
}

for i, v in ipairs(vehicleModels) do
    vehicleModels[i] = GetHashKey(v)
end

for i, v in ipairs(pedModels) do
    pedModels[i] = GetHashKey(v)
end

local function isInTable(value, tbl)
    for _, v in ipairs(tbl) do
        if value == v then return true end
    end
    return false
end

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5000)
        if Config and Config.policeNPCs then
            for _, ped in ipairs(GetGamePool('CPed')) do
                if DoesEntityExist(ped) then
                    local model = GetEntityModel(ped)
                    if isInTable(model, pedModels) then
                        DeleteEntity(ped)
                    end
                end
            end

            for _, vehicle in ipairs(GetGamePool('CVehicle')) do
                if DoesEntityExist(vehicle) then
                    local model = GetEntityModel(vehicle)
                    if isInTable(model, vehicleModels) then
                        DeleteEntity(vehicle)
                    end
                end
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        local d = Config.npcDensity or 1.0
        
        SetPedDensityMultiplierThisFrame(d)
        SetScenarioPedDensityMultiplierThisFrame(d, d)
        SetVehicleDensityMultiplierThisFrame(d)
        SetRandomVehicleDensityMultiplierThisFrame(d)
        SetParkedVehicleDensityMultiplierThisFrame(d)
        Wait(0)
    end
end)