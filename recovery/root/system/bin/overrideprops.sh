#!/system/bin/sh

# 日付偽装（そのまま）
setprop ro.build.date.utc 0000000000
setprop ro.system.build.date.utc 0000000000
setprop ro.system_ext.build.date.utc 0000000000
setprop ro.vendor.build.date.utc 0000000000
setprop ro.odm.build.date.utc 0000000000
setprop ro.product.build.date.utc 0000000000

# decrypt関連のprop誘導（fstab選択用）
setprop ro.hardware mt6897
setprop ro.boot.hardware mt6897
setprop ro.product.device TB373FU
setprop ro.vendor.mediatek.platform MT6897

exit 0
