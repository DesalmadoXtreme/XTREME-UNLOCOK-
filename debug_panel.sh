 ┌──────────────────────────────────────────────────────────┐
 │      DEBUG PANEL: ARM ARCHITECTURE QUALCOMM XTREME UNLOCOK     │
 └──────────────────────────────────────────────────────────┘
  

 1. SYSTEM PROPERTIES (GETPROP)
 ────────────────────────────────────────────────────────────
  » ro.usb.typec.dp_support       : [ $(getprop ro.usb.typec.dp_support) ]
  » persist.vendor.usb.dp_altmode : [ $(getprop persist.vendor.usb.dp_altmode) ]
  » persist.sys.desk-mode.enable  : [ $(getprop persist.sys.desk-mode.enable) ]
  » debug.sf.latch_unsignaled     : [ $(getprop debug.sf.latch_unsignaled) ]
  » debug.sf.enable_hwc_vds       : [ $(getprop debug.sf.enable_hwc_vds) ]

 2. PARTITION STATUS (BLOCK-LEVEL)
 ────────────────────────────────────────────────────────────
  » DTBO_A PARTITION              : [ $([[ -b /dev/block/by-name/dtbo_a ]] && echo "OK" || echo "ERROR") ]
  » DTBO_B PARTITION              : [ $([[ -b /dev/block/by-name/dtbo_b ]] && echo "OK" || echo "ERROR") ]
  » SHA256SUM /dev/block/dtbo_a   : $(sha256sum /dev/block/by-name/dtbo_a | awk '{print $1}')
  » STATUS DA INJEÇÃO             : [ $([[ "$HASH_PATCH" == "$HASH_ACTIVE" ]] && echo "PATCHED" || echo "REVERTED") ]

 3. KERNEL SYSFS DATA (HARDWARE)
 ────────────────────────────────────────────────────────────
  » /sys/class/typec/port0/data_role  : [ $(cat /sys/class/typec/port0/data_role) ]
  » /sys/class/typec/port0/power_role : [ $(cat /sys/class/typec/port0/power_role) ]
  » /sys/class/udc/*/current_speed    : [ $(cat /sys/class/udc/*/current_speed) ]
  » /sys/class/power_supply/usb/voltage_now : [ $(cat /sys/class/power_supply/usb/voltage_now) ]

 4. VIDEO OUTPUT (DRM/MUX)
 ────────────────────────────────────────────────────────────
  » /sys/class/typec/port0-partner/mode : [ $(cat /sys/class/typec/port0-partner/mode 2>/dev/null) ]
  » /sys/class/drm/card0-DP-1/status    : [ $(cat /sys/class/drm/card0-DP-1/status) ]
  » DMESG FORCE_PROBE                   : [ $(dmesg | grep -i "force_probe" | tail -1) ]

 5. WATCHDOG LOG (BACKGROUND)
 ────────────────────────────────────────────────────────────
  » LAST SYNC (SECONDS AGO)       : [ $(($(date +%s) - LAST_SYNC))s ]
  » CURRENT_ROLE FORCED           : [ $([[ "$FORCED" == "1" ]] && echo "YES" || echo "NO") ]

 ────────────────────────────────────────────────────────────
  STATUS FINAL: 
  $( [[ "$HASH_PATCH" == "$HASH_ACTIVE" ]] && echo "🏁 MAMA FABRICANTE! O HARDWARE É MEU. ✅" || echo "❌ A FABRICANTE VENCEU... AGUARDEM. ⚠️" )
 ────────────────────────────────────────────────────────────
 
