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
wget -O Ubuntu.iso 'https://doc-0g-c4-docs.googleusercontent.com/docs/securesc/vr1v0ldjjhfelg39ba1fjfopvdifkfac/9d9ovo68edj4jf9k0k13euekh9kum073/1682753475000/09155415212261886625/04051407595031969789/1k51c-q7qEQ_XmxLt8vx7DLtoKucsA566?e=download&ax=ALy03A6M-jf3QEw9Rl99KI1iNc0g1YtaWwsEFlQaJrin_YZAkiYCuA-Iu-PivmVLkpeKbCC6gULufA14UEpvlH2wG2aLyzdk7rIw7RiIZXi1xTQso91EhuaUigVgbzHHZYrgVmQWufQOvPPMGs_Sz50SlF0QZRx1JENqhwC1dTuM4jbl8plZIIyz0PRYlTI8pud4ZPR_V-UQhVJnkBGpeSq9i3es131J7loutBu5hpNjOBsBnxQzWvcYNw5AqjELfQZN0Xbt9LHScXXLP7faxfEYHvXvyFoEv6yRSUhr0VEcTyqfybkQkRe8UY2D-Xs68_OCvTNVnAeGVjRdYkybStB8MFxiB10bkTvWxbRivMjo3fc9HKVdC2QyzcW-9S8ENEewSxiTeUzc1Ntz5F6Q3qXV_mSl6b3VA5GS9CQ1Y9LCWMjnFcSLarKAVO2UXK0EGWB-e4Vv5bdvnyPr22afq2VDBNnGoJ0DFWtoarW9SmJuosEdGHEynfcgejmDu6F8YdqTwO8Ymt9C-yy5T800pJuJc0sjyJlAxbIJ0YEPjUSMCp3061EollKL3fSZvphpmEbdbYKCzSHBa4bZJrtG1-CqFIs-rybx4b-llt7oYhi-OBI_sSZ4h2DM0hrJLl9H40FFk6ZreR_o0KDBCdcPulxeawybmDw8bWcA-3iOL4Lbt_gOGkqMkts4VDYxBRnoCNILD7z9Hsnx_1H9OCrcmYQvwOEz7qOXsW8OZKXvfQbjPQtHis6QdqSSsMlvvvQtitmwS_Wjsz97GwYcPgrPHmKW1wLrRgCUp-_NWZkHGEfiEWYJd9W4aT33XWucSVchD2NTZazVu_RlJPL1UbxlmRc8j7JoVe-7kLNIfE_1I7tANAHTJMx41bM0txhRLmp9NBOEySRS4rNOWUxDbIgjQeWfik7CZ3qpS9sIOxamUarMCNvIJYBdggwv1aJUNnK0bCx3x8nTn0g&uuid=65525567-490b-463c-b17f-a0e5c94b8105&authuser=0&nonce=f3a6akorjs0gk&user=04051407595031969789&hash=pg23hdurk8kmivs9qsos9egm06dljk6q'

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
  

