From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/3] Samsung devel-2 for v3.8
Date: Fri, 23 Nov 2012 10:37:30 +0900
Message-ID: <10d601cdc91b$1a5e73b0$4f1b5b10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46347 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756648Ab2KWBhb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Nov 2012 20:37:31 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDX00AMQ368YT90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 10:37:30 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDX00ASE36INA90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 23 Nov 2012 10:37:30 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof

Here is second Samsung development patches for v3.8.

This includes properly enabling PM support and UART3 DEBUG_LL for exynos5
and CAMIF for s3c24xx/s3c64xx.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/devel-samsung-2

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit f4a75d2eb7b1e2206094b901be09adb31ba63681:

  Linux 3.7-rc6 (2012-11-16 17:42:40 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/devel-samsung-2

Abhilash Kesavan (3):
      ARM: EXYNOS: fix the hotplug for Cortex-A15
      ARM: EXYNOS: Remove scu_enable from cpuidle
      ARM: EXYNOS: Add flush_cache_all in suspend finisher

Inderpal Singh (2):
      ARM: EXYNOS: Add support for rtc wakeup
      ARM: EXYNOS: Fix soft reboot hang after suspend/resume

Olof Johansson (1):
      ARM: EXYNOS: add UART3 to DEBUG_LL ports

Sachin Kamat (1):
      ARM: S3C24XX: Fix potential NULL pointer dereference error

Sylwester Nawrocki (2):
      ARM: SAMSUNG: Add s3c24xx/s3c64xx CAMIF GPIO setup helpers
      ARM: S3C24XX: Add clkdev entry for camif-upll clock

 arch/arm/Kconfig.debug                  |   11 +++++
 arch/arm/mach-exynos/common.c           |    2 +
 arch/arm/mach-exynos/cpuidle.c          |    3 +-
 arch/arm/mach-exynos/hotplug.c          |   45 ++++++++++++++++++-
 arch/arm/mach-exynos/pm.c               |    7 +++
 arch/arm/mach-s3c24xx/Kconfig           |    1 +
 arch/arm/mach-s3c24xx/clock-s3c2440.c   |    1 +
 arch/arm/plat-s3c24xx/dma.c             |    9 ++--
 arch/arm/plat-samsung/Kconfig           |    6 +++
 arch/arm/plat-samsung/Makefile          |    1 +
 arch/arm/plat-samsung/include/plat/pm.h |    2 +
 arch/arm/plat-samsung/setup-camif.c     |   70
+++++++++++++++++++++++++++++++
 12 files changed, 150 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm/plat-samsung/setup-camif.c
