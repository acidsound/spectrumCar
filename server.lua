function startServer()
  srv=net.createServer(net.TCP) 
  srv:listen(80,function(conn) 
      conn:on("receive",function(conn,request) 
        local buf = ""
        print(request)
        method, path = parseHTTPReq(request)
        print("[", method, ",", path, "]")
        if (path == nil) then
          path = "index.html"
        end
        if (file.open(path, "r")) then
          conn:send(file.read())
          file.close()
        else
          conn:send("404")
        end
        conn:close()
        collectgarbage()
      end) 
  end)
end

startServer()
