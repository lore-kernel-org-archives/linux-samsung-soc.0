From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 00/10] spi: s3c64xx: add support for device tree
Date: Wed, 09 May 2012 03:34:44 +0530
Message-ID: <1336514694-22393-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63245 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756740Ab2EHVwk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 May 2012 17:52:40 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3Q00KN14RQ0C00@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 06:52:38 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M3Q009L04RKMU40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 May 2012 06:52:38 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org

This patch series adds device tree based discovery support for Samsung's
s3c64xx compatible spi controller. This is mainly tested for Exynos4210
and Exynos5250 with onboard spi nor flash device.

This patch series is based on Linux 3.4-rc5 with the following two
patch series applied.

[1] http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg10494.html
    [PATCH 00/20] ARM: Samsung: Add support for Exynos5250 Rev1.0

[2] http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg09640.html
    [PATCH 0/6] S3C24XX: Add support for HSSPI on S3C2416/S3C2443

Thomas Abraham (10):
  spi: s3c64xx: remove unused S3C64XX_SPI_ST_TRLCNTZ macro
  spi: s3c64xx: move controller information into driver data
  ARM: Samsung: Remove spi hardware controller information from platform data
  ARM: Samsung: Remove pdev pointer paremeter from spi gpio setup functions
  ARM: Samsung: Update the device names for spi clock lookup
  ARM: Samsung: Modify s3c64xx_spi{0|1|2}_set_platdata function
  spi: s3c64xx: Remove the 'set_level' callback from controller data
  ARM: Exynos4: Fix the incorrect hierarchy of spi controller bus clock
  ARM: Exynos5: Add spi clock support
  spi: s3c64xx: add device tree support

.../devicetree/bindings/spi/spi-samsung.txt        |  113 +++++
 arch/arm/mach-exynos/clock-exynos4.c               |   66 ++-
 arch/arm/mach-exynos/clock-exynos5.c               |   98 ++++
 arch/arm/mach-exynos/include/mach/regs-clock.h     |    4 +
 arch/arm/mach-exynos/setup-spi.c                   |   33 +--
 arch/arm/mach-s3c24xx/clock-s3c2416.c              |    2 +-
 arch/arm/mach-s3c24xx/clock-s3c2443.c              |    2 +-
 arch/arm/mach-s3c24xx/common-s3c2443.c             |    4 +-
 arch/arm/mach-s3c24xx/setup-spi.c                  |   10 +-
 arch/arm/mach-s3c64xx/clock.c                      |   20 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c              |    2 +-
 arch/arm/mach-s3c64xx/setup-spi.c                  |   19 +-
 arch/arm/mach-s5p64x0/clock-s5p6440.c              |   12 +-
 arch/arm/mach-s5p64x0/clock-s5p6450.c              |   12 +-
 arch/arm/mach-s5p64x0/setup-spi.c                  |   21 +-
 arch/arm/mach-s5pc100/clock.c                      |   30 +-
 arch/arm/mach-s5pc100/setup-spi.c                  |   30 +--
 arch/arm/mach-s5pv210/clock.c                      |   14 +-
 arch/arm/mach-s5pv210/setup-spi.c                  |   21 +-
 arch/arm/plat-samsung/devs.c                       |   50 +--
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h   |   31 +-
 drivers/spi/spi-s3c64xx.c                          |  467 +++++++++++++++++---
 22 files changed, 753 insertions(+), 308 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt
