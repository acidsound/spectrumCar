function startServer()
  srv=net.createServer(net.TCP) 
  print("http server started")
  srv:listen(80,function(conn) 
      conn:on("receive",function(conn,request) 
        local buf = ""
        method, path = parseHTTPReq(request)
        if (path == nil or path=="/" or path=="") then
          path = "index.html"
        end
        print("] "..path)
        if (string.len(path)==2) then
          local l=string.sub(path,1,1)+0
          local r=string.sub(path,2,2)+0
          pwm.setduty(1, l==5 and 0 or 1023)
          pwm.setduty(2, r==5 and 0 or 1023)
          gpio.write(3, l>5 and gpio.HIGH or gpio.LOW)
          gpio.write(4, r>5 and gpio.HIGH or gpio.LOW)
          conn:send('{"r":"ok"}')
          print(path.." direction")
        else
          print("[", method, ",", path, "]")
          if (file.open(path, "r")) then
            local q=file.read()
            local x=""
            while q do
              x=x..(q and q or "")
              q=file.read()
            end
            conn:send(x)
          else
            conn:send("404")
          end
          file.close()
        end
        conn:close()
        collectgarbage()
      end) 
  end)
end

startServer()
