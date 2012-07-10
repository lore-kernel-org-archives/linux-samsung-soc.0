From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung cleanup-1 for v3.6
Date: Tue, 10 Jul 2012 10:52:30 +0900
Message-ID: <0c4901cd5e3e$aa970660$ffc51320$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61879 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751952Ab2GJBwc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jul 2012 21:52:32 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M6X0014I97GMFH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 10:52:30 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M6X00CA397ITC80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 10 Jul 2012 10:52:30 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof

Please pull samsung cleanup patches for v3.6 and most of them are removing
useless codes.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 485802a6c524e62b5924849dd727ddbb1497cc71:

  Linux 3.5-rc3 (2012-06-16 17:25:17 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/cleanup-samsung

Bartlomiej Zolnierkiewicz (1):
      ARM: EXYNOS: Remove leftovers of the Samsung specific power domain
control

Boojin Kim (1):
      ARM: EXYNOS: Remove the L2 cache latency setting for EXYNOS5

Jonghwan Choi (1):
      ARM: SAMSUNG: Remove unused variable 'running' on PWM

Paul Bolle (2):
      ARM: S3C24XX: remove unused header <mach/bast-pmu.h>
      ARM: SAMSUNG: remove unused SPI clock headers

Sachin Kamat (4):
      ARM: S5P64X0: Remove unused variable in dma.c file
      ARM: S5PC100: Remove unused variable in dma.c file
      ARM: SAMSUNG: Remove description corresponding to a deleted element
      ARM: S3C24XX: Remove duplicate header file inclusion

 arch/arm/mach-exynos/common.c                   |   25 ------
 arch/arm/mach-exynos/include/mach/spi-clocks.h  |   16 ----
 arch/arm/mach-exynos/mach-nuri.c                |    1 -
 arch/arm/mach-exynos/mach-origen.c              |    1 -
 arch/arm/mach-exynos/mach-smdkv310.c            |    1 -
 arch/arm/mach-exynos/mach-universal_c210.c      |    1 -
 arch/arm/mach-s3c24xx/common.c                  |    1 -
 arch/arm/mach-s3c24xx/include/mach/bast-pmu.h   |   40 ----------
 arch/arm/mach-s3c64xx/include/mach/spi-clocks.h |   18 ----
 arch/arm/mach-s5p64x0/dma.c                     |    2 -
 arch/arm/mach-s5p64x0/include/mach/spi-clocks.h |   20 -----
 arch/arm/mach-s5pc100/dma.c                     |    2 -
 arch/arm/mach-s5pc100/include/mach/spi-clocks.h |   18 ----
 arch/arm/mach-s5pv210/include/mach/spi-clocks.h |   17 ----
 arch/arm/plat-samsung/Kconfig                   |    8 --
 arch/arm/plat-samsung/Makefile                  |    4 -
 arch/arm/plat-samsung/include/plat/devs.h       |    1 -
 arch/arm/plat-samsung/include/plat/fb.h         |    1 -
 arch/arm/plat-samsung/include/plat/pd.h         |   30 -------
 arch/arm/plat-samsung/pd.c                      |   95
-----------------------
 arch/arm/plat-samsung/pwm.c                     |    4 -
 21 files changed, 0 insertions(+), 306 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/include/mach/spi-clocks.h
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/bast-pmu.h
 delete mode 100644 arch/arm/mach-s3c64xx/include/mach/spi-clocks.h
 delete mode 100644 arch/arm/mach-s5p64x0/include/mach/spi-clocks.h
 delete mode 100644 arch/arm/mach-s5pc100/include/mach/spi-clocks.h
 delete mode 100644 arch/arm/mach-s5pv210/include/mach/spi-clocks.h
 delete mode 100644 arch/arm/plat-samsung/include/plat/pd.h
 delete mode 100644 arch/arm/plat-samsung/pd.c
