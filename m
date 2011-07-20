From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V4 00/13] To use DMA generic APIs for Samsung DMA
Date: Thu, 21 Jul 2011 01:04:01 +0900
Message-ID: <06c201cc46f6$a887e840$f997b8c0$%kim@samsung.com>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56869 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252Ab1GTQEK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 12:04:10 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LON00ME53AWNRB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 01:04:09 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LON00E3O3AW3J@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 01:04:09 +0900 (KST)
In-reply-to: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Boojin Kim' <boojin.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>

Boojin Kim wrote:
> 
> This patchset adds support DMA generic APIs for Samsung DMA.
> V4 doesn't has whole patch series and only has the patches differed from
V3.
> 
> Changes from V3:
> - Divided 03-patch into two patchs.
> 	- First is 03-1-patch for DMA_SLAVE_CONFIG command.
> 	- Another is 03-2-patch for DMA_CYCLIC capability.
> - Code clean-up
> 	- Remove unnecessary variable referance.
> 	- Remove redunancy code
> 
> [PATCH V4 01/13] DMA: PL330: Add support runtime PM for PL330 DMAC
> [PATCH V4 03-1/13] DMA: PL330: Support DMA_SLAVE_CONFIG command
> [PATCH V4 03-2/13] DMA: PL330: Add DMA_CYCLIC capability
> [PATCH V4 05/13] ARM: SAMSUNG: Add common DMA operations

Dear all,

Is there any comments on this?


As a note, this whole series are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-dma

Boojin Kim (14):
      DMA: PL330: Add support runtime PM for PL330 DMAC
      DMA: PL330: Update PL330 DMA API driver
      DMA: PL330: Support DMA_SLAVE_CONFIG command
      DMA: PL330: Add DMA_CYCLIC capability
      ARM: SAMSUNG: Update to use PL330-DMA driver
      ARM: SAMSUNG: Add common DMA operations
      ARM: EXYNOS4: Use generic DMA PL330 driver
      ARM: S5PV210: Use generic DMA PL330 driver
      ARM: S5PC100: Use generic DMA PL330 driver
      ARM: S5P64X0: Use generic DMA PL330 driver
      ARM: SAMSUNG: Remove S3C-PL330-DMA driver
      spi/s3c64xx: Add support DMA engine API
      ASoC: Samsung: Update DMA interface
      ARM: SAMSUNG: Remove Samsung specific enum type for dma direction

 arch/arm/mach-exynos4/Kconfig                      |    2 +-
 arch/arm/mach-exynos4/clock.c                      |   16 +-
 arch/arm/mach-exynos4/dma.c                        |  323 ++++--
 arch/arm/mach-exynos4/include/mach/dma.h           |    4 +-
 arch/arm/mach-s3c2410/include/mach/dma.h           |   20 +-
 arch/arm/mach-s3c2412/dma.c                        |    4 +-
 arch/arm/mach-s3c64xx/dma.c                        |   10 +-
 arch/arm/mach-s3c64xx/include/mach/dma.h           |    8 +-
 arch/arm/mach-s5p64x0/Kconfig                      |    4 +-
 arch/arm/mach-s5p64x0/clock-s5p6440.c              |    9 +-
 arch/arm/mach-s5p64x0/clock-s5p6450.c              |    9 +-
 arch/arm/mach-s5p64x0/dma.c                        |  317 ++++--
 arch/arm/mach-s5p64x0/include/mach/dma.h           |    2 +-
 arch/arm/mach-s5pc100/Kconfig                      |    2 +-
 arch/arm/mach-s5pc100/clock.c                      |   23 +-
 arch/arm/mach-s5pc100/dma.c                        |  357 ++++--
 arch/arm/mach-s5pc100/include/mach/dma.h           |    2 +-
 arch/arm/mach-s5pv210/Kconfig                      |    2 +-
 arch/arm/mach-s5pv210/clock.c                      |   16 +-
 arch/arm/mach-s5pv210/dma.c                        |  346 ++++--
 arch/arm/mach-s5pv210/include/mach/dma.h           |    2 +-
 arch/arm/plat-s3c24xx/dma.c                        |   10 +-
 arch/arm/plat-samsung/Kconfig                      |    8 +-
 arch/arm/plat-samsung/Makefile                     |    4 +-
 arch/arm/plat-samsung/dma-ops.c                    |  133 +++
 arch/arm/plat-samsung/include/plat/dma-ops.h       |   64 +
 .../include/plat/{s3c-dma-pl330.h => dma-pl330.h}  |   32 +-
 arch/arm/plat-samsung/include/plat/dma-s3c24xx.h   |    2 +-
 arch/arm/plat-samsung/include/plat/dma.h           |   10 +-
 .../plat-samsung/include/plat/s3c-pl330-pdata.h    |   32 -
 arch/arm/plat-samsung/s3c-dma-ops.c                |  130 ++
 arch/arm/plat-samsung/s3c-pl330.c                  | 1244
--------------------
 drivers/dma/Kconfig                                |    3 +-
 drivers/dma/pl330.c                                |  270 ++++-
 drivers/mmc/host/s3cmci.c                          |    6 +-
 drivers/spi/spi_s3c64xx.c                          |  141 ++--
 include/linux/amba/pl330.h                         |    2 +-
 sound/soc/samsung/ac97.c                           |   10 +-
 sound/soc/samsung/dma.c                            |  144 +--
 sound/soc/samsung/dma.h                            |    4 +-
 40 files changed, 1740 insertions(+), 1987 deletions(-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
