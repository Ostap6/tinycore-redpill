#!/bin/bash

function knownfixes() {

     PLATFORM="$1"
     VERSION="$2"

     case $PLATFORM in

     ds3615xs)

          case $VERSION in

          \
               7.1.0-42621)
               echo sed -i 's/^acpi-cpufreq/# acpi-cpufreq/g' /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf && cat /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf
               ;;

          *)
               echo "$VERSION is not a known VERSION, or no fixes are available"
               ;;

          esac
          ;;

     dva3221)

          case $VERSION in

          \
               7.1.0-42621)
               echo sed -i 's/^acpi-cpufreq/# acpi-cpufreq/g' /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf && cat /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf

               [ $(lspci -nn | grep -i nvidia | grep 300 | wc -l) -le 0 ] && echo sed -i 's/^/#/g' /mnt/dsmroot/usr/lib/modules-load.d/70-syno-nvidia-gpu.conf && cat /mnt/dsmroot/usr/lib/modules-load.d/70-syno-nvidia-gpu.conf
               ;;

          \
               *)
               echo "$VERSION is not a known VERSION, or no fixes are available"
               ;;

          esac
          ;;
     ds3622xsp)
          case $VERSION in

          \
               7.1.0-42621)
               echo sed -i 's/^acpi-cpufreq/# acpi-cpufreq/g' /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf && cat /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf
               ;;

          *)
               echo "$VERSION is not a known VERSION, or no fixes are available"
               ;;

          esac
          ;;
     *)
          echo "$PLATFORM is not a known PLATFORM, or no fixes are available"
          ;;

     ds3617xs)
          case $VERSION in

          \
               7.1.0-42621)
               echo sed -i 's/^acpi-cpufreq/# acpi-cpufreq/g' /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf && cat /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf
               ;;

          *)
               echo "$VERSION is not a known VERSION, or no fixes are available"
               ;;

          esac
          ;;
		  
	 ds920p)
          case $VERSION in

          \
               7.1.0-42621)
			   cd /home/tc/redpill-load ; ./ext-manager.sh add https://github.com/jumkey/redpill-load/raw/develop/redpill-dtb/rpext-index.json
			   cd /home/tc/redpill-load ; ./ext-manager.sh _update_platform_exts ds920p_42218
                  cp /home/tc/ds920p.dtb /home/tc/redpill-load/custom/extensions/jumkey.dtb/ds920p_42218/model_ds920p.dtb

               echo sed -i 's/^acpi-cpufreq/# acpi-cpufreq/g' /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf && cat /mnt/dsmroot/usr/lib/modules-load.d/70-cpufreq-kernel.conf
               ;;

          *)
               echo "$VERSION is not a known VERSION, or no fixes are available"
               ;;

          esac
          ;;

     *)
          echo "$PLATFORM is not a known PLATFORM, or no fixes are available"
          ;;

     esac

}

knownfixes $1 $2
