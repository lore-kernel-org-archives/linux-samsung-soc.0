From: Mateusz Krawczuk <m.krawczuk-GrGkmOP51GdLN7c7dRTbYkEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 0/3] Samsung: DT: Add Device tree for S5PC110/S5PV210 Boards
Date: Sat, 28 Sep 2013 18:25:27 +0200
Message-ID: <1380385530-28522-1-git-send-email-m.krawczuk@partner.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Mateusz Krawczuk <m.krawczuk-GrGkmOP51GdLN7c7dRTbYkEOCMrvLtNR@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This patch series add initial device tree support for mach s5pv210. It provides 
dts for all old board files and add support for new board: 
Tiny210 from FriendlyARM
This patch series was tested on goni, aquila and tiny210.

Missing features:
 - i2s
 - audio
 - cpufreq
 - camera noon010pc30
 - lcd support(still waiting for Common Display Framework) 
 - touchscreen atmel_mxt_ts
Need to be tested:
 - i2c require touchscreen
 - fimd require lcd
 - fimc require camera
 - mfc require CMA
 - spi 

Mateusz Krawczuk (3):
  ARM: s5pv210: Add board file for boot using Device Tree
  ARM: Samsung: DT: Add Device tree for s5pv210
  ARM: Samsung: DT: Add Device tree for S5PC110/S5PV210 Boards

 arch/arm/boot/dts/Makefile              |   6 +
 arch/arm/boot/dts/s5pv210-aquila.dts    | 407 ++++++++++++++++
 arch/arm/boot/dts/s5pv210-goni.dts      | 486 +++++++++++++++++++
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi  | 820 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/s5pv210-smdkc110.dts  | 165 +++++++
 arch/arm/boot/dts/s5pv210-smdkv210.dts  | 273 +++++++++++
 arch/arm/boot/dts/s5pv210-tiny210.dts   | 262 ++++++++++
 arch/arm/boot/dts/s5pv210-torbreck.dts  | 157 ++++++
 arch/arm/boot/dts/s5pv210.dtsi          | 498 +++++++++++++++++++
 arch/arm/mach-s5pv210/Kconfig           |  14 +
 arch/arm/mach-s5pv210/Makefile          |   2 +-
 arch/arm/mach-s5pv210/mach-s5pv210-dt.c |  92 ++++
 12 files changed, 3181 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/s5pv210-aquila.dts
 create mode 100644 arch/arm/boot/dts/s5pv210-goni.dts
 create mode 100644 arch/arm/boot/dts/s5pv210-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/s5pv210-smdkc110.dts
 create mode 100644 arch/arm/boot/dts/s5pv210-smdkv210.dts
 create mode 100644 arch/arm/boot/dts/s5pv210-tiny210.dts
 create mode 100644 arch/arm/boot/dts/s5pv210-torbreck.dts
 create mode 100644 arch/arm/boot/dts/s5pv210.dtsi
 create mode 100644 arch/arm/mach-s5pv210/mach-s5pv210-dt.c

-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
