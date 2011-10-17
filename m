From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung cleanup-3 for v3.2
Date: Mon, 17 Oct 2011 13:42:24 +0900
Message-ID: <000401cc8c87$2ab684e0$80238ea0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48148 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721Ab1JQEm1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Oct 2011 00:42:27 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT700CMQ10REMM0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Oct 2011 13:42:25 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT7009L512O9T10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 17 Oct 2011 13:42:24 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

Hi Arnd,

This is a 3rd cleanup request for v3.2 Samsung stuff which includes cleanup
resources and platform devices into one plat-samsung directory. As I said
during review in mailing list, this is needed to reduce plat- directories
and help to keep easily platform devices.

Please pull from:
 git://github.com/kgene/linux-samsung.git next-samsung-cleanup-3

Since this moves a lot of files, I think you can pull this into your
next/cleanup2 which will be merged late during upcoming merge window.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 6b6844dd54e4196dd9818bc63b319f93c37a08be:

  ARM: S5P64X0: Add Power Management support (2011-10-04 20:31:24 +0900)

are available in the git repository at:
 git://github.com/kgene/linux-samsung.git next-samsung-cleanup-3

Kukjin Kim (5):
      ARM: S3C24XX: To merge s3c24xx devs.c files to one devs.c
      ARM: S3C64XX: To merge devs.c files to one devs.c
      ARM: S5P: To merge devs.c files to one devs.c
      ARM: SAMSUNG: Cleanup plat-samsung/devs.c and devs.h
      ARM: SAMSUNG: Cleanup resources by using macro

Sylwester Nawrocki (1):
      ARM: SAMSUNG: Move fimc plat. device from board files to plat-samsung

 arch/arm/mach-exynos4/include/mach/i2c-hdmiphy.h |   16 -
 arch/arm/mach-exynos4/mach-universal_c210.c      |    5 -
 arch/arm/mach-s3c2410/include/mach/fb.h          |   75 +--
 arch/arm/mach-s3c2410/include/mach/irqs.h        |    4 +-
 arch/arm/mach-s3c2410/include/mach/map.h         |    1 +
 arch/arm/mach-s3c2410/mach-qt2410.c              |    1 +
 arch/arm/mach-s3c2440/mach-rx1950.c              |    1 +
 arch/arm/mach-s3c64xx/Makefile                   |    2 -
 arch/arm/mach-s3c64xx/dev-onenand1.c             |   53 -
 arch/arm/mach-s5pv210/include/mach/i2c-hdmiphy.h |   16 -
 arch/arm/mach-s5pv210/mach-goni.c                |    5 -
 arch/arm/plat-s3c24xx/Makefile                   |    2 +-
 arch/arm/plat-s3c24xx/dev-uart.c                 |  100 ++
 arch/arm/plat-s3c24xx/devs.c                     |  528 --------
 arch/arm/plat-s5p/Makefile                       |   12 -
 arch/arm/plat-s5p/dev-csis0.c                    |   34 -
 arch/arm/plat-s5p/dev-csis1.c                    |   34 -
 arch/arm/plat-s5p/dev-ehci.c                     |   57 -
 arch/arm/plat-s5p/dev-fimc0.c                    |   43 -
 arch/arm/plat-s5p/dev-fimc1.c                    |   43 -
 arch/arm/plat-s5p/dev-fimc2.c                    |   43 -
 arch/arm/plat-s5p/dev-fimc3.c                    |   43 -
 arch/arm/plat-s5p/dev-fimd0.c                    |   67 -
 arch/arm/plat-s5p/dev-i2c-hdmiphy.c              |   59 -
 arch/arm/plat-s5p/dev-mfc.c                      |   50 -
 arch/arm/plat-s5p/dev-onenand.c                  |   45 -
 arch/arm/plat-s5p/dev-pmu.c                      |   36 -
 arch/arm/plat-s5p/dev-tv.c                       |   98 --
 arch/arm/plat-samsung/Makefile                   |   31 +-
 arch/arm/plat-samsung/dev-adc.c                  |   46 -
 arch/arm/plat-samsung/dev-asocdma.c              |   35 -
 arch/arm/plat-samsung/dev-fb.c                   |   63 -
 arch/arm/plat-samsung/dev-hsmmc.c                |   62 -
 arch/arm/plat-samsung/dev-hsmmc1.c               |   62 -
 arch/arm/plat-samsung/dev-hsmmc2.c               |   63 -
 arch/arm/plat-samsung/dev-hsmmc3.c               |   66 -
 arch/arm/plat-samsung/dev-hwmon.c                |   32 -
 arch/arm/plat-samsung/dev-i2c0.c                 |   70 -
 arch/arm/plat-samsung/dev-i2c1.c                 |   61 -
 arch/arm/plat-samsung/dev-i2c2.c                 |   62 -
 arch/arm/plat-samsung/dev-i2c3.c                 |   60 -
 arch/arm/plat-samsung/dev-i2c4.c                 |   60 -
 arch/arm/plat-samsung/dev-i2c5.c                 |   60 -
 arch/arm/plat-samsung/dev-i2c6.c                 |   60 -
 arch/arm/plat-samsung/dev-i2c7.c                 |   60 -
 arch/arm/plat-samsung/dev-ide.c                  |   44 -
 arch/arm/plat-samsung/dev-keypad.c               |   50 -
 arch/arm/plat-samsung/dev-nand.c                 |  125 --
 arch/arm/plat-samsung/dev-onenand.c              |   43 -
 arch/arm/plat-samsung/dev-pwm.c                  |   53 -
 arch/arm/plat-samsung/dev-rtc.c                  |   43 -
 arch/arm/plat-samsung/dev-ts.c                   |   59 -
 arch/arm/plat-samsung/dev-usb-hsotg.c            |   48 -
 arch/arm/plat-samsung/dev-usb.c                  |   65 -
 arch/arm/plat-samsung/dev-wdt.c                  |   40 -
 arch/arm/plat-samsung/devs.c                     | 1463
++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h        |  157 ++--
 arch/arm/plat-samsung/include/plat/fb-s3c2410.h  |   72 ++
 58 files changed, 1716 insertions(+), 2972 deletions(-)
 delete mode 100644 arch/arm/mach-exynos4/include/mach/i2c-hdmiphy.h
 delete mode 100644 arch/arm/mach-s3c64xx/dev-onenand1.c
 delete mode 100644 arch/arm/mach-s5pv210/include/mach/i2c-hdmiphy.h
 create mode 100644 arch/arm/plat-s3c24xx/dev-uart.c
 delete mode 100644 arch/arm/plat-s3c24xx/devs.c
 delete mode 100644 arch/arm/plat-s5p/dev-csis0.c
 delete mode 100644 arch/arm/plat-s5p/dev-csis1.c
 delete mode 100644 arch/arm/plat-s5p/dev-ehci.c
 delete mode 100644 arch/arm/plat-s5p/dev-fimc0.c
 delete mode 100644 arch/arm/plat-s5p/dev-fimc1.c
 delete mode 100644 arch/arm/plat-s5p/dev-fimc2.c
 delete mode 100644 arch/arm/plat-s5p/dev-fimc3.c
 delete mode 100644 arch/arm/plat-s5p/dev-fimd0.c
 delete mode 100644 arch/arm/plat-s5p/dev-i2c-hdmiphy.c
 delete mode 100644 arch/arm/plat-s5p/dev-onenand.c
 delete mode 100644 arch/arm/plat-s5p/dev-pmu.c
 delete mode 100644 arch/arm/plat-s5p/dev-tv.c
 delete mode 100644 arch/arm/plat-samsung/dev-adc.c
 delete mode 100644 arch/arm/plat-samsung/dev-asocdma.c
 delete mode 100644 arch/arm/plat-samsung/dev-fb.c
 delete mode 100644 arch/arm/plat-samsung/dev-hsmmc.c
 delete mode 100644 arch/arm/plat-samsung/dev-hsmmc1.c
 delete mode 100644 arch/arm/plat-samsung/dev-hsmmc2.c
 delete mode 100644 arch/arm/plat-samsung/dev-hsmmc3.c
 delete mode 100644 arch/arm/plat-samsung/dev-hwmon.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c0.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c1.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c2.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c3.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c4.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c5.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c6.c
 delete mode 100644 arch/arm/plat-samsung/dev-i2c7.c
 delete mode 100644 arch/arm/plat-samsung/dev-ide.c
 delete mode 100644 arch/arm/plat-samsung/dev-keypad.c
 delete mode 100644 arch/arm/plat-samsung/dev-nand.c
 delete mode 100644 arch/arm/plat-samsung/dev-onenand.c
 delete mode 100644 arch/arm/plat-samsung/dev-pwm.c
 delete mode 100644 arch/arm/plat-samsung/dev-rtc.c
 delete mode 100644 arch/arm/plat-samsung/dev-ts.c
 delete mode 100644 arch/arm/plat-samsung/dev-usb-hsotg.c
 delete mode 100644 arch/arm/plat-samsung/dev-usb.c
 delete mode 100644 arch/arm/plat-samsung/dev-wdt.c
 create mode 100644 arch/arm/plat-samsung/devs.c
 create mode 100644 arch/arm/plat-samsung/include/plat/fb-s3c2410.h
