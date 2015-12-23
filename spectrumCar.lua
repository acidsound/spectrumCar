--GPIO Define
function initGPIO()
--1,2EN   D1 GPIO5
--3,4EN   D2 GPIO4
--1A  ~2A   D3 GPIO0
--3A  ~4A   D4 GPIO2

  gpio.mode(0,gpio.OUTPUT);--LED Light on
  gpio.write(0,gpio.LOW);
  
  gpio.mode(1,gpio.OUTPUT);gpio.write(1,gpio.LOW);
  gpio.mode(2,gpio.OUTPUT);gpio.write(2,gpio.LOW);
  
  gpio.mode(3,gpio.OUTPUT);gpio.write(3,gpio.HIGH);
  gpio.mode(4,gpio.OUTPUT);gpio.write(4,gpio.HIGH);
  
  pwm.setup(1,1000,1023);--PWM 1KHz, Duty 1023
  pwm.start(1);pwm.setduty(1,0);
  pwm.setup(2,1000,1023);
  pwm.start(2);pwm.setduty(2,0);
end

function setupAPMode()
  print("Ready to start soft ap")
  
  cfg={}
  cfg.ssid="spectrum"..node.chipid();
  cfg.pwd="12345678"
  wifi.ap.config(cfg)

  cfg={}
  cfg.ip="192.168.1.1";
  cfg.netmask="255.255.255.0";
  cfg.gateway="192.168.1.1";
  wifi.ap.setip(cfg);
  wifi.setmode(wifi.SOFTAP)

  str=nil;
  ssidTemp=nil;
  collectgarbage();

  print("Soft AP started")
end

setupAPMode();
print("Start Spectrum Controller");
initGPIO();

-- Build and return a table of the http request data
function parseHTTPReq (req)
  return string.match(req, "([A-Z]*) \/([^? ]*)")
end

function _(x) for v in pairs(x) do print(v) end end

dofile("server.lc")
