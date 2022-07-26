sudo apt-get update -y
sudo apt-get install -y qemu-system-x86-64
wget -O RTL8139F.iso 'https://drive.google.com/uc?export=download&id=1wDL8vo9mmYKw1HKXZzaYHoKmzSt_wXai'
wget -O Nico.iso 'https://github.com/pearOS-archlinux/iso/releases/download/v22.06-release-candidate/pearOS-NiceC0re-2022.07-x86_64.iso'

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
  -cpu EPYC \
  -boot order=d \
  -drive file=Tiny10.qcow2 \
  -drive file=RTL8139F.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu n270 \
  -smp sockets=1,cores=4,threads=2 \
  -vga std \
  -device e1000,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \
      
      
      
      
      
qemu-system-x86_64 -m 1200M -hda a.qcow2 -vga std -cpu core2duo -smp sockets=1,cores=8,threads=1 -device e1000,netdev=n0 -netdev user,id=n0 -soundhw hda -vnc 127.0.0.1:23
