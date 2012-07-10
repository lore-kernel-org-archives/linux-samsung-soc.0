From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 0/6] spi: s3c64xx: add support for device tree
Date: Tue, 10 Jul 2012 19:57:33 +0530
Message-ID: <1341930459-25223-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13520 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752243Ab2GJOQ3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jul 2012 10:16:29 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6Y00E497NACTV0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 23:16:27 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6Y003JQ7JFBF00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 23:16:27 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: broonie@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, jaswinder.singh@linaro.org

Changes since v3:
- Fixed the build breakage after applying 3rd patch in this series (which
  had dependency on the 6th patch). This was reported by Doug Anderson.

Changes since v2:
- Removed renaming of platform device name at runtime
- Includes other minor fixes suggested by Olof, Grant, Kukjin and Abhilash.
- Rebased to Linux 3.5-rc1

Changes since v1:
- Incorporated changes suggested by Mark Brown
 - Merged 2nd, 3rd and 5th patch into one single patch.
 - Listed the order of gpios in the device tree support documentation.
 - Switched to generic property names for chip select gpio line and
   number of slave select lines.
- Moved the platform enablement patches for Exynos4 and Exynos5 into a
 different patch series.
- Included Ack from Jaswinder Singh <jaswinder.singh@linaro.org>.

This patch series adds device tree based discovery support for Samsung's
s3c64xx compatible spi controller. This is mainly tested for Exynos4210
and Exynos5250 with onboard spi nor flash device.

The patch series (6 patches) that add board/platform specific support has
no changes since the v2 version. This series is available at:
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-May/100812.html

Thomas Abraham (6):
  spi: s3c64xx: remove unused S3C64XX_SPI_ST_TRLCNTZ macro
  spi: s3c64xx: move controller information into driver data
  ARM: Samsung: Remove pdev pointer parameter from spi gpio setup functions
  ARM: Samsung: Modify s3c64xx_spi{0|1|2}_set_platdata function
  spi: s3c64xx: Remove the 'set_level' callback from controller data
  spi: s3c64xx: add device tree support

 .../devicetree/bindings/spi/spi-samsung.txt        |  113 +++++
 arch/arm/mach-exynos/clock-exynos4.c               |   18 +-
 arch/arm/mach-exynos/setup-spi.c                   |   33 +--
 arch/arm/mach-s3c24xx/clock-s3c2416.c              |    3 +-
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
 arch/arm/plat-samsung/devs.c                       |   60 +--
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h   |   39 +--
 drivers/spi/spi-s3c64xx.c                          |  439 +++++++++++++++++---
 20 files changed, 591 insertions(+), 311 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt
