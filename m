From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 0/6] SPI platform device consolidation
Date: Wed, 14 Dec 2011 10:15:57 -0500
Message-ID: <1323875763-21197-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39739 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970Ab1LNFSa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Dec 2011 00:18:30 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LW600K4BHDWKTG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Dec 2011 14:18:29 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LW600ED3HELIV80@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 14 Dec 2011 14:18:28 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.kvr@gmail.com, padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
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

V3 Changes:
Reverted the SPI Controller number addition because device tree doesn't support
enumeration using device instance number.

Padmavathi Venna (6):
  ARM: SAMSUNG: Consolidation of SPI platform devices to plat-samsung
  ARM: S3C64XX: Modified files for SPI consolidation work
  ARM: S5PC100: Modified files for SPI consolidation work
  ARM: S5P64X0: Modified files for SPI consolidation work
  ARM: S5PV210: Modified files for SPI consolidation work
  ARM: S3C64XX: Modified according to SPI consolidation work.

 arch/arm/mach-s3c64xx/Kconfig                    |    8 +-
 arch/arm/mach-s3c64xx/Makefile                   |    2 +-
 arch/arm/mach-s3c64xx/dev-spi.c                  |  173 -----------------
 arch/arm/mach-s3c64xx/include/mach/map.h         |    2 +
 arch/arm/mach-s3c64xx/setup-spi.c                |   45 +++++
 arch/arm/mach-s5p64x0/Kconfig                    |    7 +-
 arch/arm/mach-s5p64x0/Makefile                   |    2 +-
 arch/arm/mach-s5p64x0/dev-spi.c                  |  218 ---------------------
 arch/arm/mach-s5p64x0/include/mach/map.h         |    3 +
 arch/arm/mach-s5p64x0/setup-spi.c                |   55 ++++++
 arch/arm/mach-s5pc100/Kconfig                    |    5 +
 arch/arm/mach-s5pc100/Makefile                   |    2 +-
 arch/arm/mach-s5pc100/dev-spi.c                  |  220 ----------------------
 arch/arm/mach-s5pc100/include/mach/map.h         |    3 +
 arch/arm/mach-s5pc100/setup-spi.c                |   65 +++++++
 arch/arm/mach-s5pv210/Kconfig                    |    5 +
 arch/arm/mach-s5pv210/Makefile                   |    2 +-
 arch/arm/mach-s5pv210/dev-spi.c                  |  169 -----------------
 arch/arm/mach-s5pv210/include/mach/map.h         |    2 +
 arch/arm/mach-s5pv210/setup-spi.c                |   51 +++++
 arch/arm/plat-samsung/Kconfig                    |   14 ++-
 arch/arm/plat-samsung/devs.c                     |  127 +++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h        |    8 +-
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |   22 ++-
 24 files changed, 409 insertions(+), 801 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/dev-spi.c
 create mode 100644 arch/arm/mach-s3c64xx/setup-spi.c
 delete mode 100644 arch/arm/mach-s5p64x0/dev-spi.c
 create mode 100644 arch/arm/mach-s5p64x0/setup-spi.c
 delete mode 100644 arch/arm/mach-s5pc100/dev-spi.c
 create mode 100644 arch/arm/mach-s5pc100/setup-spi.c
 delete mode 100644 arch/arm/mach-s5pv210/dev-spi.c
 create mode 100644 arch/arm/mach-s5pv210/setup-spi.c
