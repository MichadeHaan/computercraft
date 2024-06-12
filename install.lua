local function download(url, filenam)
    local response = http.get(url)
    if response then
        local content = response.readAll()
        response.close()
        
        local file = fs.open(filename, "w")
        file.write(content)
        file.close()
    else
        error("Failed to download file from " .. url)
    end
end

local chestMonitorUrl = "https://raw.githubusercontent.com/MichadeHaan/computercraft/main/chest_monitor.lua"
local chestMonitorFile = "chest_monitor.lua"
local startupFile = "startup.lua"

print("Downloading chest_monitor.lua...")
download(chestMonitorUrl, chestMonitorFile)

print("Creating startup.lua...")
local startupContent = [[
shell.run("chest_monitor.lua")
]]

local file = fs.open(startupFile, "w")
file.write(startupContent)
file.close()

print("Installation complete! Restarting computer...")
os.sleep(2)
os.reboot()
