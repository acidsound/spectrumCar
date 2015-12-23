print("\n")
print("ESP8266 Started")

local exefile="spectrumCar"
local luaFile = {"spectrumCar.lua", "server.lua"}
for i, f in ipairs(luaFile) do
  if file.open(f) then
      file.close()
      print("Compile File:"..f)
      node.compile(f)
    print("Remove File:"..f)
      file.remove(f)
  end
 end

if file.open(exefile..".lc") then
  dofile(exefile..".lc")
else
  print(exefile..".lc not exist")
end
exefile=nil;luaFile = nil
