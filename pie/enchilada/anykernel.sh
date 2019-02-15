# Telegram:https://t.me/nethunter666
#github https://github.com/johanlike/Oneplus6-or-6T-Nethunter-Kernel
#kali linux QQ群：891225998
## AnyKernel setup
# begin properties
properties() { '
kernel.string=###DJY Nethunter Kernel for OnePlus 6/6T ###
do.devicecheck=1
do.modules=0
do.cleanup=1
do.cleanuponabort=0
device.name1=OnePlus6
device.name2=enchilada
device.name3=OnePlus6T
device.name4=fajita
supported.versions=7.0 - 9.6.6
'; } # end properties

# shell variables
block=auto;
is_slot_device=auto;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## Trim partitions
fstrim -v /cache;
fstrim -v /data;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;
# begin ramdisk changes
if [ -d $ramdisk/.backup ]; then
  patch_cmdline "skip_override" "skip_override";
else
  patch_cmdline "skip_override" "";
fi;
# end ramdisk changes
write_boot;

## end install
