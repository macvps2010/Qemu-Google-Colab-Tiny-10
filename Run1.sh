sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
qemu-img create -f raw Ubuntu.img 64G
wget -O Ubuntu.iso 'https://releases.ubuntu.com/22.04/ubuntu-22.04-desktop-amd64.iso'

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 4G \
  -cpu EPYC \
  -boot order=d \
  -drive file=Ubuntu.iso,media=cdrom \
  -drive file=Ubuntu.img,format=raw \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu core2duo \
  -smp cores=4 \
  -device rtl8139,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \
  
