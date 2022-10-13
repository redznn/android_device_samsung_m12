# TWRP Device configuration for Samsung Galaxy M12

# Device specification

Basic   | Spec Sheet
-------:|:------------------------
CPU     | Octa-core (4x2.0 GHz Cortex-A55 & 4x2.0 GHz Cortex-A55)
CHIPSET | Exynos 850
GPU     | Mali-G52
Memory  | 4GB
Shipped Android Version | 11.0
Storage | 64GB
Battery | 5000 mAh
Display | PLS LCD, 90Hz, 720x1600 px 20:9 ratio
Rear Camera  | 48 MP, f/2.0, (wide), 1/2.0", 0.8µm, PDAF 5 MP, f/2.2, 123˚ (ultrawide) 2 MP, f/2.4, (macro) 2 MP, f/2.4, (depth)
Front Camera | 8 MP, f/2.2, (wide)

![Device Picture](https://fdn2.gsmarena.com/vv/bigpic/samsung-galaxy-m12.jpg)

### How to compile

. build/envsetup.sh
export CCACHE_EXEC="$(which ccache)"
export CCACHE="${CCACHE_EXEC}"
export CCACHE_COMPRESS="1"
export USE_CCACHE="1"
$CCACHE -M 50G
lunch twrp_m12-eng
mka -j8 recoveryimage
```
Note: 'X' in `mka -jX recoveryimage` is the number of cores your processor has.
For example, a quad-core processor would have `mka -j4 recoveryimage` as the command.

### Copyright
 ```
  /*
  *  Copyright (C) 2013-21 The OmniROM Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
