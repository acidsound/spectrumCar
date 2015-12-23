#echo $1
export PP=`pwd`
pushd
cd ~/Documents/Arduino/esp8266/luatool/luatool
echo `pwd`
echo "--src $PP/init.lua"
python luatool.py -b 9600 --port /dev/tty.wchusbserial1420 --src $PP/$1 --dest $1 --verbose
#python luatool.py -b 9600 --port /dev/tty.wchusbserial1420 --src $PP/spectrumCar.lua --dest spectrumCar.lua --verbose
ls
popd
