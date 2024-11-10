local json = require "json"
local socket = require "socket"
local http = require "socket.http"

function serveConfig()
  local config = dofile("config.lua")
  local configJson = json.encode(config)
  return configJson
end

-- Create a web server to serve the config
CreateThread(function()
  local server = assert(socket.bind("0.0.0.0", 8080))
  local ip, port = server:getsockname()
  print("Web server running on http://" .. ip .. ":" .. port .. "/config")

  while true do
    local client = server:accept()
    client:settimeout(10)
    local request, err = client:receive()
    if not err then
      local response = serveConfig()
      client:send("HTTP/1.1 200 OK\r\nContent-Type: application/json\r\n\r\n" .. response)
    end
    client:close()
  end
end)
