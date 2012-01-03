From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel for v3.3
Date: Wed, 04 Jan 2012 08:33:50 +0900
Message-ID: <018801ccca70$25f01260$71d03720$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16852 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754403Ab2ACXdw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 18:33:52 -0500
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LX800B02XFYHA30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 04 Jan 2012 08:33:51 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LX800CC6XGEH3A0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 04 Jan 2012 08:33:50 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Arnd,

Please pull Samsung devel for v3.3 from:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-devel-samsung

It is including s3c64xx cpuidle and development for Cragganmore, ORIGEN and
some boards.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 5f0a6e2d503896062f641639dacfe5055c2f593b:

  Linux 3.2-rc7 (2011-12-23 21:51:06 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-devel-samsung

Denis Kuzmenko (1):
      ARM: S3C2440: Add new LCD (W35i) support for Mini2440 board

Jingoo Han (1):
      ARM: SAMSUNG: Add a callback 'notify_after' for PWM backlight control

Kamil Debski (3):
      ARM: SAMSUNG: add G2D to plat-s5p and mach-exynos
      ARM: EXYNOS: add G2D to mach-nuri
      ARM: EXYNOS: add G2D to mach-universal

Mark Brown (26):
      ARM: S3C64XX: Update for conversion to SAMSUNG_GPIO_EXTRA
      ARM: SAMSUNG: Fix GPIO space reservation for S3C64xx platforms
      ARM: S3C64XX: Correct reservation of GPIOs for CPU module on
Cragganmore
      ARM: S3C64XX: Raise the frequency of the second I2C bus on Cragganmore
      ARM: S3C64XX: Use software initiated powerdown for Cragganmore
      ARM: S3C64XX: Configure WM1250 EV1 GPIOs on Cragganmore
      ARM: S3C64XX: Improve logging of unknown Cragganmore module types
      ARM: S3C64XX: Run Tobermory interrupts in the default mode
      ARM: S3C64XX: Hook up platform data for Kilchomin module on
Cragganmore
      ARM: S3C64XX: Hook up Littlemill audio card on Cragganmore
      ARM: S3C64XX: Power gate unused domains
      ARM: S3C64XX: Hook up VDDINT on Cragganmore
      ARM: S3C64XX: Add basic cpuidle driver
      ARM: S3C64XX: Gate some more clocks by default
      ARM: SAMSUNG: Guard against multiple inclusion of plat/dma.h
      ARM: SAMSUNG: dma-ops.h needs mach/dma.h
      ARM: S3C64XX: Remove unconditional power domain disables
      ARM: S3C64XX: Remove hsmmc1 from Cragganmore
      ARM: SAMSUNG: Declare struct platform_device in plat/s3c64xx-spi.h
      ARM: S3C64XX: Fix the memory mapped GPIOs on Cragganmore
      ARM: S3C64XX: Support GPIO LEDs on Cragganmore
      ARM: S3C64XX: Reduce residency requirement for cpuidle WFI mode
      ARM: S3C64XX: Fix interrupt configuration for PCA935x on Cragganmore
      ARM: S3C64XX: Fix build of Cragganmore after SPI changes
      ARM: S3C64XX: Enable power management for disk on Cragganmore
      ARM: S3C64XX: Enable power management for WiFi on Cragganmore

MyungJoo Ham (3):
      ARM: EXYNOS: Add DMC1 and allow PPMU access for DMC
      ARM: EXYNOS: Add clock register addresses for EXYNOS4X12 bus devfreq
driver
      ARM: EXYNOS: Add support EXYNOS4210-bus Devfreq driver on Nuri board

Sachin Kamat (1):
      ARM: EXYNOS: Enable G2D on ORIGEN

Sangwook Lee (1):
      ARM: EXYNOS: Enable Bluetooth on ORIGEN

Tushar Behera (1):
      ARM: EXYNOS: Invert VCLK polarity for framebuffer on ORIGEN

 arch/arm/mach-exynos/Kconfig                     |    3 +
 arch/arm/mach-exynos/cpu.c                       |    7 +-
 arch/arm/mach-exynos/include/mach/map.h          |    4 +
 arch/arm/mach-exynos/include/mach/regs-clock.h   |   42 +++++++++
 arch/arm/mach-exynos/mach-nuri.c                 |   12 ++-
 arch/arm/mach-exynos/mach-origen.c               |   38 ++++++++-
 arch/arm/mach-exynos/mach-universal_c210.c       |    1 +
 arch/arm/mach-s3c2440/mach-mini2440.c            |   18 ++++
 arch/arm/mach-s3c64xx/Kconfig                    |    7 +-
 arch/arm/mach-s3c64xx/Makefile                   |    1 +
 arch/arm/mach-s3c64xx/clock.c                    |   21 ++--
 arch/arm/mach-s3c64xx/cpuidle.c                  |   91 ++++++++++++++++++
 arch/arm/mach-s3c64xx/include/mach/crag6410.h    |    7 +-
 arch/arm/mach-s3c64xx/include/mach/gpio.h        |    2 +-
 arch/arm/mach-s3c64xx/include/mach/irqs.h        |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410-module.c     |   56 +++++++++++-
 arch/arm/mach-s3c64xx/mach-crag6410.c            |  107
+++++++++++++++++++---
 arch/arm/mach-s3c64xx/pm.c                       |    2 +
 arch/arm/plat-s5p/Kconfig                        |    5 +
 arch/arm/plat-samsung/Kconfig                    |    8 ++
 arch/arm/plat-samsung/dev-backlight.c            |    2 +
 arch/arm/plat-samsung/devs.c                     |   28 ++++++
 arch/arm/plat-samsung/include/plat/devs.h        |    1 +
 arch/arm/plat-samsung/include/plat/dma-ops.h     |    1 +
 arch/arm/plat-samsung/include/plat/dma.h         |    6 +-
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 +
 26 files changed, 434 insertions(+), 40 deletions(-)
 create mode 100644 arch/arm/mach-s3c64xx/cpuidle.c
