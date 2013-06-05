From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/7] Common Clock Framework support for Samsung S3C64xx
Date: Thu,  6 Jun 2013 01:57:24 +0200
Message-ID: <1370476651-6743-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

This series is an attempt to move clock support on Samsung S3C64xx SoCs
to Common Clock Framework.

First, support for PLL types present on S3C64xx SoCs is added to Samsung
Common Clock Framework driver. Then the main clock driver for mentioned
SoCs is introduced. Further patches contain fixes for drivers to make them
compliant with CCF semantics, migration of platform code to use the new
clock driver and removal of old clock management code.

Depends on:
 - [PATCH 0/6] Samsung watchdog support clean-up
   http://thread.gmane.org/gmane.linux.kernel.samsung-soc/18736/focus=18989
 - [PATCH 00/15] Final Samsung PWM support cleanup
   http://www.spinics.net/lists/arm-kernel/msg248725.html

On S3C6410-based Tiny6410 board (Mini6410-compatible):

Tested-by: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Tomasz Figa (7):
  clk: samsung: pll: Add support for PLL6552 and PLL6553
  clk: samsung: Add clock driver for S3C64xx SoCs
  ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
  ARM: s3c64xx: dma: Use clk_prepare_enable/clk_disable_unprepare
  usb: host: ohci-s3c2410 Use clk_prepare_enable/clk_disable_unprepare
  ARM: s3c64xx: Migrate clock handling to Common Clock Framework
  ARM: s3c64xx: Remove old clock management code

 .../bindings/clock/samsung,s3c64xx-clock.txt       |   48 +
 arch/arm/Kconfig                                   |    2 +-
 arch/arm/mach-s3c64xx/Makefile                     |    2 +-
 arch/arm/mach-s3c64xx/clock.c                      | 1007 --------------------
 arch/arm/mach-s3c64xx/common.c                     |   21 +-
 arch/arm/mach-s3c64xx/common.h                     |   12 +-
 arch/arm/mach-s3c64xx/dma.c                        |    4 +-
 arch/arm/mach-s3c64xx/include/mach/regs-clock.h    |  132 +--
 arch/arm/mach-s3c64xx/mach-anw6410.c               |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c              |    2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c                   |    2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c              |    2 +-
 arch/arm/mach-s3c64xx/mach-ncp.c                   |    2 +-
 arch/arm/mach-s3c64xx/mach-smartq.c                |   11 +-
 arch/arm/mach-s3c64xx/mach-smdk6400.c              |    2 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |    2 +-
 arch/arm/mach-s3c64xx/pm.c                         |   21 -
 arch/arm/mach-s3c64xx/s3c6400.c                    |    6 -
 arch/arm/mach-s3c64xx/s3c6410.c                    |    7 -
 arch/arm/plat-samsung/include/plat/cpu.h           |    4 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-pll.c                      |  160 ++++
 drivers/clk/samsung/clk-pll.h                      |    4 +
 drivers/clk/samsung/clk-s3c64xx.c                  |  503 ++++++++++
 drivers/usb/host/ohci-s3c2410.c                    |    8 +-
 include/dt-bindings/clock/samsung,s3c64xx-clock.h  |  144 +++
 26 files changed, 907 insertions(+), 1204 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s3c64xx-clock.txt
 delete mode 100644 arch/arm/mach-s3c64xx/clock.c
 create mode 100644 drivers/clk/samsung/clk-s3c64xx.c
 create mode 100644 include/dt-bindings/clock/samsung,s3c64xx-clock.h

-- 
1.8.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
