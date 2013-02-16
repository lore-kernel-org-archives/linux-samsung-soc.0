From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 00/12] ARM: samsung-time: Prepare for multiplatform support
Date: Sat, 16 Feb 2013 17:43:52 +0100
Message-ID: <1361033044-27629-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f169.google.com ([209.85.215.169]:47592 "EHLO
	mail-ea0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753626Ab3BPQor (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Feb 2013 11:44:47 -0500
Received: by mail-ea0-f169.google.com with SMTP id d13so1882879eaa.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 16 Feb 2013 08:44:46 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, kyungmin.park@samsung.com, linux@simtec.co.uk, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, buserror@gmail.com, christer@weinigel.se, jekhor@gmail.com, ghcstop@gmail.com, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>

This series is an attempt to make the samsung-time clocksource driver ready
for multiplatform kernels. It moves the driver to drivers/clocksource, cleans
it up from uses of static platform-specific definitions, simplifies timer
interrupt handling and adds Device Tree support.

Tested on a Tiny6410 board (Mini6410-compatible) both with and without Devicee
Tree (with my DT patches for S3C64xx). Compile tested for other related SoCs.

Changes since v1:
(http://thread.gmane.org/gmane.linux.kernel.samsung-soc/16005)
 - Addressed comments from Mark Rutland
 - Documented struct samsung_timer_variant
 - Dropped inactive mail addresses from CC

Tomasz Figa (12):
  ARM: SAMSUNG: Move samsung-time to drivers/clocksource
  clocksource: samsung-time: Set platform-specific parameters at runtime
  clocksource: samsung-time: Drop useless defines from public header
  ARM: SAMSUNG: Move samsung-time.h header to inlude/clocksource
  clocksource: samsung-time: Use local register definitions
  clocksource: samsung-time: Remove use of static register mapping
  clocksource: samsung-time: Use clk_get_sys for getting clocks
  ARM: SAMSUNG: devs: Drop unnecessary IRQ resources of timer devices
  clocksource: samsung-time: Do not use static IRQ definition
  clocksource: samsung-time: Move IRQ mask/ack handling to the driver
  ARM: SAMSUNG: Remove unused PWM timer IRQ chip code
  clocksource: samsung-time: Add Device Tree support

 .../devicetree/bindings/arm/samsung-timer.txt      |  33 ++
 arch/arm/Kconfig                                   |   1 -
 arch/arm/mach-exynos/include/mach/irqs.h           |   3 +-
 arch/arm/mach-exynos/mach-universal_c210.c         |  15 +-
 arch/arm/mach-s3c24xx/common.c                     |  14 +
 arch/arm/mach-s3c24xx/mach-amlm5900.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c                |   2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c             |   2 +-
 arch/arm/mach-s3c24xx/mach-bast.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c                 |   2 +-
 arch/arm/mach-s3c24xx/mach-h1940.c                 |   2 +-
 arch/arm/mach-s3c24xx/mach-jive.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-n30.c                   |   2 +-
 arch/arm/mach-s3c24xx/mach-nexcoder.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c                |   2 +-
 arch/arm/mach-s3c24xx/mach-otom.c                  |   2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c                |   2 +-
 arch/arm/mach-s3c24xx/mach-rx1950.c                |   2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c                |   2 +-
 arch/arm/mach-s3c24xx/mach-smdk2410.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-smdk2413.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-smdk2416.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-smdk2440.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-smdk2443.c              |   2 +-
 arch/arm/mach-s3c24xx/mach-tct_hammer.c            |   2 +-
 arch/arm/mach-s3c24xx/mach-vr1000.c                |   2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c                 |   2 +-
 arch/arm/mach-s3c64xx/common.c                     |  19 +-
 arch/arm/mach-s3c64xx/include/mach/irqs.h          |   8 -
 arch/arm/mach-s3c64xx/mach-anw6410.c               |   2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c              |   2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c                   |   2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c              |   2 +-
 arch/arm/mach-s3c64xx/mach-ncp.c                   |   2 +-
 arch/arm/mach-s3c64xx/mach-real6410.c              |   2 +-
 arch/arm/mach-s3c64xx/mach-smartq.c                |   2 +-
 arch/arm/mach-s3c64xx/mach-smartq5.c               |   2 +-
 arch/arm/mach-s3c64xx/mach-smartq7.c               |   2 +-
 arch/arm/mach-s3c64xx/mach-smdk6400.c              |   2 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |   2 +-
 arch/arm/mach-s5p64x0/common.c                     |  15 +
 arch/arm/mach-s5p64x0/include/mach/irqs.h          |   2 -
 arch/arm/mach-s5p64x0/mach-smdk6440.c              |   2 +-
 arch/arm/mach-s5p64x0/mach-smdk6450.c              |   2 +-
 arch/arm/mach-s5pc100/common.c                     |  15 +
 arch/arm/mach-s5pc100/include/mach/irqs.h          |   2 -
 arch/arm/mach-s5pc100/mach-smdkc100.c              |   2 +-
 arch/arm/mach-s5pv210/common.c                     |  15 +
 arch/arm/mach-s5pv210/include/mach/irqs.h          |   2 -
 arch/arm/mach-s5pv210/mach-aquila.c                |   2 +-
 arch/arm/mach-s5pv210/mach-goni.c                  |   2 +-
 arch/arm/mach-s5pv210/mach-smdkc110.c              |   2 +-
 arch/arm/mach-s5pv210/mach-smdkv210.c              |   2 +-
 arch/arm/mach-s5pv210/mach-torbreck.c              |   2 +-
 arch/arm/plat-samsung/Kconfig                      |  14 -
 arch/arm/plat-samsung/Makefile                     |   2 -
 arch/arm/plat-samsung/devs.c                       |  28 +-
 arch/arm/plat-samsung/include/plat/irq-vic-timer.h |  13 -
 arch/arm/plat-samsung/include/plat/irqs.h          |   9 -
 arch/arm/plat-samsung/include/plat/samsung-time.h  |  51 --
 arch/arm/plat-samsung/irq-vic-timer.c              |  98 ----
 arch/arm/plat-samsung/s5p-irq.c                    |   3 -
 arch/arm/plat-samsung/samsung-time.c               | 394 -------------
 drivers/clocksource/Kconfig                        |   7 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/samsung-time.c                 | 636 +++++++++++++++++++++
 include/clocksource/samsung-time.h                 |  55 ++
 68 files changed, 871 insertions(+), 668 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung-timer.txt
 delete mode 100644 arch/arm/plat-samsung/include/plat/irq-vic-timer.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/samsung-time.h
 delete mode 100644 arch/arm/plat-samsung/irq-vic-timer.c
 delete mode 100644 arch/arm/plat-samsung/samsung-time.c
 create mode 100644 drivers/clocksource/samsung-time.c
 create mode 100644 include/clocksource/samsung-time.h

-- 
1.8.1.2
