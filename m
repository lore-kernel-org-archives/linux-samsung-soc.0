From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-mmc-spi for v3.3
Date: Tue, 27 Dec 2011 18:42:14 +0900
Message-ID: <000801ccc47b$d474fd00$7d5ef700$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:28864 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455Ab1L0JmY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Dec 2011 04:42:24 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWU0032SWAMZ4I0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 18:42:23 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWU00ERHWAKZV10@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 18:42:22 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi Arnd and Olof,

Please pull the Samsung-devel-mmc-spi for v3.3.
It depends on Samsung-cleanup-spi4 branch as well.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 7d38af51d587ad953eef786a6922bcd1482cae5c:

  ARM: S3C64XX: Modified according to SPI consolidation work (2011-12-23
10:50:03 +0900)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-devel-mmc-spi5

Padmavathi Venna (1):
      ARM: EXYNOS: Modified files for SPI consolidation work

Rajeshwari Shinde (3):
      ARM: S5P64X0: Add HSMMC setup for host Controller
      ARM: S5P64X0: Add lookup of sdhci-s3c clocks using generic names
      ARM: S5P64X0: Enable SDHCI support

 arch/arm/mach-exynos/Kconfig                   |    5 +
 arch/arm/mach-exynos/Makefile                  |    1 +
 arch/arm/mach-exynos/clock.c                   |   73 ++++++++++-------
 arch/arm/mach-exynos/include/mach/irqs.h       |    3 +
 arch/arm/mach-exynos/include/mach/map.h        |    7 ++
 arch/arm/mach-exynos/include/mach/spi-clocks.h |   16 ++++
 arch/arm/mach-exynos/setup-spi.c               |   72 ++++++++++++++++
 arch/arm/mach-s5p64x0/Kconfig                  |   24 ++++++
 arch/arm/mach-s5p64x0/Makefile                 |    1 +
 arch/arm/mach-s5p64x0/clock-s5p6440.c          |   72 ++++++++++-------
 arch/arm/mach-s5p64x0/clock-s5p6450.c          |   72 ++++++++++-------
 arch/arm/mach-s5p64x0/cpu.c                    |    9 ++
 arch/arm/mach-s5p64x0/mach-smdk6440.c          |   25 ++++++
 arch/arm/mach-s5p64x0/mach-smdk6450.c          |   26 ++++++-
 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c       |  104
++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/sdhci.h     |   44 ++++++++++
 16 files changed, 463 insertions(+), 91 deletions(-)
 create mode 100644 arch/arm/mach-exynos/include/mach/spi-clocks.h
 create mode 100644 arch/arm/mach-exynos/setup-spi.c
 create mode 100644 arch/arm/mach-s5p64x0/setup-sdhci-gpio.c
