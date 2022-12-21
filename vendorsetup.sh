#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#
#       This software is released under GPL version 3 or any later version.
#       See <http://www.gnu.org/licenses/>.
#
#       Please maintain this if you use this script or any part of it
#
FDEVICE="m12"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
        export DEVICE_PATH=device/samsung/m12
        export LC_ALL="C.UTF-8"
        export ALLOW_MISSING_DEPENDENCIES=true

        #OFR build settings & info
        export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
        export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
        export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/recovery"
        export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
        export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
        export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
        export FOX_USE_LZMA_COMPRESSION=1
        export FOX_DELETE_INITD_ADDON=1
        export FOX_VERSION=12.1
        export OF_MAINTAINER=Redznn        
	export FOX_REMOVE_AAPT=1
        export FOX_DELETE_INITD_ADDON=1
        export FOX_DELETE_MAGISK_ADDON=1
        export OF_STATUS_H=130
        export OF_SCREEN_H=2400
	export OF_FBE_METADATA_MOUNT_IGNORE=1
	export OF_PATCH_AVB20=1
        export OF_HIDE_NOTCH=1
	export FOX_USE_XZ_UTILS=1

        lunch twrp_$FDEVICE-eng
        # let's see what are our build VARs
        if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
           export | grep "FOX" >> $FOX_BUILD_LOG_FILE
           export | grep "OF_" >> $FOX_BUILD_LOG_FILE
           export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
           export | grep "TW_" >> $FOX_BUILD_LOG_FILE
        fi
fi
