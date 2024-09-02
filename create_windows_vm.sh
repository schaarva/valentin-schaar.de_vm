VBoxManage createvm --name "Windows10" --ostype Windows10_64 --register
VBoxManage modifyvm "Windows10" --memory 16384 --cpus 4


# Disks

VBoxManage storagectl "Windows10" --name "SATA Controller" --add sata --controller IntelAHCI

VBoxManage createhd --filename "./Windows10.vdi" --size 256000
VBoxManage storageattach "Windows10" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "./Windows10.vdi"

VBoxManage storageattach "Windows10" --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium "./Windows10.iso"


# RDP

VBoxManage modifyvm "Windows10" --vrde on
