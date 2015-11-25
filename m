From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 00/10] ARM: s3c64xx multiplatform
Date: Wed, 25 Nov 2015 17:06:45 +0100
Message-ID: <1448467615-447097-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:62347 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198AbbKYQHm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Nov 2015 11:07:42 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Tomasz Figa <tfiga@chromium.org>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

I've posted the series before and we got a few people to test it
the last time, though I think the touchscreen portion is still
untested.

I'd really like to get this merged for 4.5 and would put it into
a next/multiplatform branch unless there are any objections
or concerns.

Arnd Bergmann (10):
  Input: s3c2410_ts: fix S3C_ADC dependency
  ASoC: samsung/smartq: use dynamic registration
  gpio: samsung: move gpio-samsung driver back to platform code
  ARM: s3c64xx: prepare initcalls for multiplatform
  ARM: s3c64xx: enable sparse IRQ support
  iio: exynos-adc: add experimental touchscreen support
  ARM: s3c64xx: use new adc/touchscreen driver
  ARM: s3c64xx: use common debug-ll implementation
  ARM: s3c64xx: multiplatform support
  ARM: s3c64xx: allow building without board support

 .../devicetree/bindings/arm/samsung/exynos-adc.txt |   3 +
 arch/arm/Kconfig                                   |  26 ---
 arch/arm/Kconfig.debug                             |  19 +-
 arch/arm/configs/multi_v7_defconfig                |   3 +
 arch/arm/configs/s3c6400_defconfig                 |   2 +
 arch/arm/mach-s3c64xx/Kconfig                      |  31 ++-
 arch/arm/mach-s3c64xx/Makefile                     |  24 ++-
 arch/arm/mach-s3c64xx/common.c                     |   5 +-
 arch/arm/mach-s3c64xx/cpuidle.c                    |   5 +-
 arch/arm/mach-s3c64xx/dev-uart.c                   |   1 +
 arch/arm/mach-s3c64xx/include/mach/debug-macro.S   |  38 ----
 arch/arm/mach-s3c64xx/include/mach/gpio-samsung.h  |   3 +
 arch/arm/mach-s3c64xx/include/mach/irqs.h          |  20 +-
 arch/arm/mach-s3c64xx/include/mach/pm-core.h       |   1 +
 arch/arm/mach-s3c64xx/irq-pm.c                     |   2 +-
 arch/arm/mach-s3c64xx/mach-anw6410.c               |   3 +-
 arch/arm/mach-s3c64xx/mach-crag6410-module.c       |   6 +
 arch/arm/mach-s3c64xx/mach-crag6410.c              |   2 +
 arch/arm/mach-s3c64xx/mach-hmt.c                   |   2 +
 arch/arm/mach-s3c64xx/mach-mini6410.c              |   5 +-
 arch/arm/mach-s3c64xx/mach-ncp.c                   |   2 +
 arch/arm/mach-s3c64xx/mach-real6410.c              |   6 +-
 arch/arm/mach-s3c64xx/mach-smartq.c                |  16 +-
 arch/arm/mach-s3c64xx/mach-smartq5.c               |   2 +
 arch/arm/mach-s3c64xx/mach-smartq7.c               |   2 +
 arch/arm/mach-s3c64xx/mach-smdk6400.c              |   3 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c              |   6 +-
 arch/arm/mach-s3c64xx/pl080.c                      |   4 +
 arch/arm/mach-s3c64xx/pm.c                         |   4 +
 arch/arm/mach-s3c64xx/s3c6400.c                    |   2 +-
 arch/arm/mach-s3c64xx/s3c6410.c                    |   2 +-
 arch/arm/plat-samsung/Kconfig                      |   5 +-
 arch/arm/plat-samsung/Makefile                     |   5 +-
 arch/arm/plat-samsung/devs.c                       |  22 +-
 .../gpio => arch/arm/plat-samsung}/gpio-samsung.c  |  12 +-
 arch/arm/plat-samsung/init.c                       |   5 +
 arch/arm/plat-samsung/pm.c                         |   4 -
 drivers/gpio/Kconfig                               |   7 -
 drivers/gpio/Makefile                              |   1 -
 drivers/iio/adc/exynos_adc.c                       | 224 ++++++++++++++++++++-
 drivers/input/touchscreen/Kconfig                  |   2 +-
 include/linux/platform_data/touchscreen-s3c2410.h  |   1 +
 sound/soc/samsung/smartq_wm8987.c                  |  77 +++----
 43 files changed, 410 insertions(+), 205 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/include/mach/debug-macro.S
 rename {drivers/gpio => arch/arm/plat-samsung}/gpio-samsung.c (99%)

-- 
2.1.0.rc2
