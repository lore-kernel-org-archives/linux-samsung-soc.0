From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 0/6] SPI platform device consolidation
Date: Fri, 18 Nov 2011 09:35:44 -0500
Message-ID: <1321626950-19859-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17273 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756383Ab1KREkG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Nov 2011 23:40:06 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUU00I26AA8AGF0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2011 13:40:05 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUU00M8HAAKM1G0@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 18 Nov 2011 13:40:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.kvr@gmail.com, padma.v@samsung.com
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com

SPI platform devices are defined in respective machine folder of
Samsung S3C64XX and S5P series SoCs.This patchset moves S3C64XX
and S5P series of SPI platform devices to a common place plat-samsung.
This patchset also creates SPI setup files for GPIO configurations and
platform data initialization.

V2 Changes:
Platform data initialized in a centralized setup file as suggested-by
Mark Brown
SPI Controller number is added in SPI controller defining structure.

Padmavathi Venna (6):
  ARM: SAMSUNG: Consolidation of SPI platform devices to plat-samsung
  ARM: S3C64XX: Modified files for SPI consolidation work
  ARM: S5PC100: Modified files for SPI consolidation work.
  ARM: S5P64X0: Modified files for SPI consolidation work
  ARM: S5PV210: Modified files for SPI consolidation work

The following patch make the corresponding SPI changes required for
Wolfson Cragganmore S3C6410 variant. This patch is only build tested.

  ARM: S3C64XX: Modified according to SPI consolidation work.

 arch/arm/mach-s3c64xx/Kconfig                    |    8 +-
 arch/arm/mach-s3c64xx/Makefile                   |    2 +-
 arch/arm/mach-s3c64xx/dev-spi.c                  |  172 -----------------
 arch/arm/mach-s3c64xx/include/mach/map.h         |    2 +
 arch/arm/mach-s3c64xx/setup-spi.c                |   47 +++++
 arch/arm/mach-s5p64x0/Kconfig                    |    7 +-
 arch/arm/mach-s5p64x0/Makefile                   |    2 +-
 arch/arm/mach-s5p64x0/dev-spi.c                  |  218 ---------------------
 arch/arm/mach-s5p64x0/include/mach/map.h         |    3 +
 arch/arm/mach-s5p64x0/setup-spi.c                |   57 ++++++
 arch/arm/mach-s5pc100/Kconfig                    |    5 +
 arch/arm/mach-s5pc100/Makefile                   |    2 +-
 arch/arm/mach-s5pc100/dev-spi.c                  |  220 ----------------------
 arch/arm/mach-s5pc100/include/mach/map.h         |    3 +
 arch/arm/mach-s5pc100/setup-spi.c                |   68 +++++++
 arch/arm/mach-s5pv210/Kconfig                    |    5 +
 arch/arm/mach-s5pv210/Makefile                   |    2 +-
 arch/arm/mach-s5pv210/dev-spi.c                  |  169 -----------------
 arch/arm/mach-s5pv210/include/mach/map.h         |    2 +
 arch/arm/mach-s5pv210/setup-spi.c                |   53 +++++
 arch/arm/plat-samsung/Kconfig                    |   14 ++-
 arch/arm/plat-samsung/devs.c                     |  106 +++++++++++
 arch/arm/plat-samsung/include/plat/devs.h        |    8 +-
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |   20 ++-
 24 files changed, 395 insertions(+), 800 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/dev-spi.c
 create mode 100644 arch/arm/mach-s3c64xx/setup-spi.c
 delete mode 100644 arch/arm/mach-s5p64x0/dev-spi.c
 create mode 100644 arch/arm/mach-s5p64x0/setup-spi.c
 delete mode 100644 arch/arm/mach-s5pc100/dev-spi.c
 create mode 100644 arch/arm/mach-s5pc100/setup-spi.c
 delete mode 100644 arch/arm/mach-s5pv210/dev-spi.c
 create mode 100644 arch/arm/mach-s5pv210/setup-spi.c
