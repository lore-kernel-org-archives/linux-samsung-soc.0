From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/6]  SPI platform device consolidation
Date: Fri, 04 Nov 2011 08:43:48 -0400
Message-ID: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:36201 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754572Ab1KDCtI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Nov 2011 22:49:08 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU400HJO7TH67G0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2011 11:49:07 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU400KKS7TNFZ50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 04 Nov 2011 11:49:07 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, broonie@opensource.wolfsonmicro.com, ian@opensource.wolfsonmicro.com, dp@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

SPI platform devices are defined in respective machine folder of
Samsung S3C64XX and S5P series SoCs.This patchset moves S3C64XX
and S5P series of SPI platform devices to a common place plat-samsung.
This patchset also creates SPI setup files for GPIO configurations and
initializes the platform specific data in the corresponding machine file.

Padmavathi Venna (6):
  ARM: SAMSUNG: Consolidation of SPI platform devices to    
    plat-samsung
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
 arch/arm/mach-s3c64xx/mach-crag6410.c            |    9 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c            |   19 ++
 arch/arm/mach-s3c64xx/setup-spi.c                |   32 +++
 arch/arm/mach-s5p64x0/Kconfig                    |    7 +-
 arch/arm/mach-s5p64x0/Makefile                   |    2 +-
 arch/arm/mach-s5p64x0/dev-spi.c                  |  218 ---------------------
 arch/arm/mach-s5p64x0/include/mach/map.h         |    3 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c            |   19 ++
 arch/arm/mach-s5p64x0/mach-smdk6450.c            |   19 ++
 arch/arm/mach-s5p64x0/setup-spi.c                |   42 ++++
 arch/arm/mach-s5pc100/Kconfig                    |    5 +
 arch/arm/mach-s5pc100/Makefile                   |    2 +-
 arch/arm/mach-s5pc100/dev-spi.c                  |  220 ----------------------
 arch/arm/mach-s5pc100/include/mach/map.h         |    3 +
 arch/arm/mach-s5pc100/mach-smdkc100.c            |   31 +++
 arch/arm/mach-s5pc100/setup-spi.c                |   43 +++++
 arch/arm/mach-s5pv210/Kconfig                    |    5 +
 arch/arm/mach-s5pv210/Makefile                   |    2 +-
 arch/arm/mach-s5pv210/dev-spi.c                  |  169 -----------------
 arch/arm/mach-s5pv210/include/mach/map.h         |    2 +
 arch/arm/mach-s5pv210/mach-smdkv210.c            |   21 ++
 arch/arm/mach-s5pv210/setup-spi.c                |   36 ++++
 arch/arm/plat-samsung/Kconfig                    |   14 ++-
 arch/arm/plat-samsung/devs.c                     |  112 +++++++++++
 arch/arm/plat-samsung/include/plat/devs.h        |    8 +-
 arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |   16 +-
 30 files changed, 444 insertions(+), 799 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/dev-spi.c
 create mode 100644 arch/arm/mach-s3c64xx/setup-spi.c
 delete mode 100644 arch/arm/mach-s5p64x0/dev-spi.c
 create mode 100644 arch/arm/mach-s5p64x0/setup-spi.c
 delete mode 100644 arch/arm/mach-s5pc100/dev-spi.c
 create mode 100644 arch/arm/mach-s5pc100/setup-spi.c
 delete mode 100644 arch/arm/mach-s5pv210/dev-spi.c
 create mode 100644 arch/arm/mach-s5pv210/setup-spi.c
