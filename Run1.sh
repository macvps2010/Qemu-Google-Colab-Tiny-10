wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip &>/dev/null &
unzip ngrok-stable-linux-amd64.zip1 &>/dev/null &
read -p "Ctrl + V Authtoken: " CRP 
./ngrok authtoken $CRP 
nohup ./ngrok tcp 3388 &>/dev/null &
./ngrok tcp 3388 &>/dev/null &
sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
qemu-img create -f raw Ubuntu.img 64G
qemu-img create -f raw ABC.img 64G
wget -O Ubuntu.iso 'https://download.freenas.org/13.0/STABLE/U1/x64/TrueNAS-13.0-U1.iso?__hstc=123088916.011830429e655a22bb9234e7c51f9caa.1657960476728.1657960476728.1658027976331.2&__hssc=123088916.3.1658027976331&__hsfp=4248025642'
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 16G \
  -cpu EPYC \
  -boot order=d \
  -drive file=Ubuntu.iso,media=cdrom \
  -drive file=Ubuntu.img,format=raw \
  -drive file=ABC.img,format=raw \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu core2duo \
  -smp cores=6 \
  -device rtl8139,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \
  sleep 43200
  
