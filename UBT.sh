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
wget -O Ubuntu.iso 'https://doc-0g-9o-docs.googleusercontent.com/docs/securesc/vr1v0ldjjhfelg39ba1fjfopvdifkfac/gs67qtgra0p77hi0vcc173su0q426cjr/1688361825000/04051407595031969789/04051407595031969789/1lqvzhIN0Sc36LYeD1uGQ8on8RDuk9tYv?e=download&ax=AGtFMPUh0RI7W47iimWQPPvUD5HZh98agyd5ENhZ8kK5mMPRwKXb7tqBdGuTJ0RfiHqpIpXjtPVgbPn0F_Te9B_PNYMH1mskbS2ooGgLXrbMKbfRQWRqDswjRV--kBH2V8B3SQ-HzDPy7HffwU1rTDr1LMll6yw1EKlSXID_66c-f2I3LdPryW9WYADkt44BSC_kdVCuUif4YvixUUosJXUR1Refpx5fTDPTPrbgA80yf0YuJTQ53ZBVfMnTVzX85BqRjFcs5uqtIBUQyBSUmhJfX9k7s-GXLfIc9_egab_b9UOW9YbDlw_KuT7YBZ5QXGdRSK77owORg3kK82fE5skpl6ya8H4dCSbJDCu0oNQGESE7iOEdQYFbL1_SQ-q0RqaZPJf1BoUymMxgcFdTjMgpRuYGSJbwzB9IhbHUSjqcBuG_Uy0f2BPcsiuJWFvGqkd_6R85InrPneoDYP_OjGl0R3k7NQXSmsH98VM3pEDUZiBX_bYPqVkDaDjm2x2vJG257cRdLMrbx5Tsuv52AxfoV7RoWPE0b8uSYk76bwbGRUH7JPNZ2pzYXFaqAYW4QY19tImdRMzmCgm_RAkv_1p9_VDJLPWEf6eWcGhFC86_pAYKvTNbIhLAyCKEVHp82Q3CY8ORrVI5rVUSgfvCBpi8a4UmxM52t-KvKCaewgDGNz8eamjHfc9YJaq3TNILx7zb-oELEdKfiRNsVY0gEshQhVHggIyTrYo8MgSSCKFOCG_vApIpzGEW2izYBuhi2H8NdjWyTjkBVG5Z2u7seWjZmtaj5FZLFuRl7fmGp1Hv4dgMXgFTY9IuOMdkpqRKzCt4k5GTAZrxGQGxR-Y09TurW6OIUD1rhMXWB9gEIi7H3ss5KFlcK7s5B_WB1Oxs_HrT5Mqgr5HtrV3PUcIpmQjp49oCDSeSPzU8F2asJDMLu8usiI1OqYAqOlBZxq2xTe47lHYwVGyGMayKi0LOt8Wl8NU5EBTsWsnJhc_laTrbcCE&uuid=92378fef-942a-4769-9e82-b1f8d67ab468&authuser=0&nonce=qin5cj61n9qiu&user=04051407595031969789&hash=fu7uu8qdhchshl5eag486v7ud7maasqp'

curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 8G \
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
  

