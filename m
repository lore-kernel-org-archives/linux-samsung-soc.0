From: Ben Dooks <ben-linux@fluff.org>
Subject: Current next-samsung
Date: Fri, 07 May 2010 08:06:05 +0900
Message-ID: <E1OAA8r-0001gK-HL@ben-laptop>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:51561 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1755491Ab0EGJgG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 May 2010 05:36:06 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The following changes since commit 7ebd467551ed6ae200d7835a84bbda0dcadaa511:
  Linus Torvalds (1):
        Merge branch 'drm-linus' of git://git.kernel.org/.../airlied/drm-2.6

are available in the git repository at:

  git://git.fluff.org/bjdooks/linux.git next-samsung

Arnaud Patard (3):
      ARM: h1940: fix touchscreen support
      ARM: S3C24XX: fix s3c2410fb platdata passing
      ARM: S3C24XX: s3c24xx_mci_set_platdata should be marked __init

Ben Dooks (26):
      ARM: S3C24XX: Add initial s3c_gpio configuration code
      ARM: S3C24XX: Add the gpio pull configuration for pull-up
      ARM: S3C24XX: Add extended GPIO used on S3C2443 and beyond
      ARM: H1940: Change h1940-bluetooth to use gpiolib API
      ARM: JIVE: Update mach-jive to use gpiolib API
      ARM: H1940: Change mach-h1940 to use gpiolib API
      ARM: QT2410: Update mach-qt2410 to use gpiolib API
      ARM: n30: Update mach-n30 to use gpiolib API
      ARM: BAST: Update mach-bast to use gpiolib API
      ARM: VR1000: Update mach-vr1000.c to use gpiolib API
      ARM: S3C2410: Change s3c2410_gpio_pullupl(x, 1) to use s3c_gpio_cfgpull()
      ARM: S3C24XX: Change s3c2410_gpio_pullupl(x, 1) to use s3c_gpio_cfgpull()
      ARM: S3C24XX: Drop s3c2410 specific s3c2410_gpio_cfgpin()
      ARM: S3C24XX: Remove s3c2410_gpio_setcfg()
      ARM: S3C24XX: Remove s3c2410_gpio_getpull()
      ARM: S3C24XX: Remove s3c2410_gpio_getirq()
      ARM: SAMSUNG: Add GPIO configuration read calls
      ARM: S3C24XX: Remove s3c2410_gpio_getcfg(), implement s3c_gpio_getcfg()
      ARM: mini2440: Move to using gpiolib API and s3c_gpio functions
      ARM: S3C2410: Remove the users of s3c2410_gpio_pullup()
      ARM: S3C24XX: Wrapper s3c2410_gpio_setpin and s3c2410_gpio_pullup()
      ARM: S3C24XX: Remove S3C2410_GPJ numbering
      ARM: S3C24XX: Remove _INP macros in <mach/regs-gpioj.h>
      ARM: Merge for-2635/s3c24xx-gpio
      ARM: Merge for-2635/s3c64xx-general
      ARM: Merge for-2635/s3c64xx-ts

Mark Brown (1):
      ARM: SMDK6410: Register AC97 controller

Maurus Cuelenaere (2):
      ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
      ARM: S3C64XX: Add touchscreen platform device definition

 arch/arm/mach-s3c2410/Kconfig                      |    1 +
 arch/arm/mach-s3c2410/h1940-bluetooth.c            |   32 +++--
 arch/arm/mach-s3c2410/include/mach/gpio-fns.h      |   47 ++++---
 arch/arm/mach-s3c2410/include/mach/gpio-nrs.h      |   12 ++
 arch/arm/mach-s3c2410/include/mach/regs-gpio.h     |   17 +++
 arch/arm/mach-s3c2410/include/mach/regs-gpioj.h    |   36 -----
 arch/arm/mach-s3c2410/mach-amlm5900.c              |    5 +-
 arch/arm/mach-s3c2410/mach-bast.c                  |    9 +-
 arch/arm/mach-s3c2410/mach-h1940.c                 |   25 ++--
 arch/arm/mach-s3c2410/mach-n30.c                   |    7 +-
 arch/arm/mach-s3c2410/mach-qt2410.c                |   10 +-
 arch/arm/mach-s3c2410/mach-vr1000.c                |    5 +-
 arch/arm/mach-s3c2410/s3c2410.c                    |    8 +
 arch/arm/mach-s3c2412/mach-jive.c                  |   26 ++--
 arch/arm/mach-s3c2412/mach-smdk2413.c              |    8 +-
 arch/arm/mach-s3c2440/Kconfig                      |    1 +
 arch/arm/mach-s3c2440/mach-mini2440.c              |   23 ++--
 arch/arm/mach-s3c2440/mach-nexcoder.c              |    9 +-
 arch/arm/mach-s3c2440/mach-osiris.c                |    5 +-
 arch/arm/mach-s3c2440/s3c2440.c                    |    8 +
 arch/arm/mach-s3c64xx/Makefile                     |    1 +
 arch/arm/mach-s3c64xx/dev-ts.c                     |   61 ++++++++
 arch/arm/mach-s3c64xx/gpiolib.c                    |    6 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |    5 +
 arch/arm/mach-s5p6440/gpio.c                       |    5 +
 arch/arm/plat-s3c24xx/Kconfig                      |    1 +
 arch/arm/plat-s3c24xx/common-smdk.c                |    9 +-
 arch/arm/plat-s3c24xx/devs.c                       |   14 ++-
 arch/arm/plat-s3c24xx/gpio.c                       |  144 +++-----------------
 arch/arm/plat-s3c24xx/gpiolib.c                    |   60 ++++++++-
 arch/arm/plat-s3c24xx/pm.c                         |    9 +-
 arch/arm/plat-s3c24xx/setup-i2c.c                  |    5 +-
 arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c       |   16 +-
 arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c         |   16 +-
 arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c          |   16 +-
 arch/arm/plat-samsung/Kconfig                      |    6 +
 arch/arm/plat-samsung/gpio-config.c                |  103 ++++++++++++++-
 .../plat-samsung/include/plat/gpio-cfg-helpers.h   |   58 ++++++++
 arch/arm/plat-samsung/include/plat/gpio-cfg.h      |   11 ++
 arch/arm/plat-samsung/include/plat/gpio-core.h     |    3 +
 .../mach => plat-samsung/include/plat}/ts.h        |    2 +-
 drivers/input/touchscreen/s3c2410_ts.c             |    2 +-
 42 files changed, 545 insertions(+), 302 deletions(-)
 create mode 100644 arch/arm/mach-s3c64xx/dev-ts.c
 rename arch/arm/{mach-s3c2410/include/mach => plat-samsung/include/plat}/ts.h (92%)
