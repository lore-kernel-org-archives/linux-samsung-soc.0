From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-dma for v3.3
Date: Mon, 02 Jan 2012 09:45:59 +0900
Message-ID: <037401ccc8e7$e5671380$b0353a80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:11731 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328Ab2ABAqE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Jan 2012 19:46:04 -0500
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LX5001T7BGEZM50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Jan 2012 09:46:01 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LX500GVQBGN2R70@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 02 Jan 2012 09:46:01 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, "'Koul, Vinod'" <vinod.koul@intel.com>, boojin.kim@samsung.com

Hi Arnd and Olof,

Please pull Samsung devel-dma for v3.3 from following:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-devel-dma

Its major feature is including merge of pl330 driver into drivers/dma/ and
got the ack from Vinod Koul and Linus Walleij and some dma development for
Samsung stuff.

As a note, since having dependency with Vinod's slave-dma/next (dma tree)
and next-samsung-dt1 branch which has been sent to you for arm-soc/next/dt,
that has been provided based on slave-dma/next tree and next-samsung-dt1.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 6ff1a8bd0b37cf0f44a13d37b1f754abec84e61c:

  Merge branch 'next-samsung-devel-dt1' into for-vkoul-samsung-dma
(2011-12-26 18:49:31 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next-samsung-devel-dma

Boojin Kim (5):
      DMA: PL330: Merge PL330 driver into drivers/dma/
      DMA: PL330: Removes useless function
      DMA: PL330: Support MEMTOMEM transmit w/o RMB, WMB
      ARM: EXYNOS: Enable MDMA driver
      ARM: EXYNOS: Support DMA for EXYNOS4X12 SoCs

Tushar Behera (1):
      ARM: EXYNOS: Add apb_pclk clkdev entry for mdma1

 arch/arm/common/Kconfig                        |    3 -
 arch/arm/common/Makefile                       |    1 -
 arch/arm/common/pl330.c                        | 1971
------------------------
 arch/arm/include/asm/hardware/pl330.h          |  338 +++--
 arch/arm/mach-exynos/clock.c                   |    9 +
 arch/arm/mach-exynos/dma.c                     |  130 ++-
 arch/arm/mach-exynos/include/mach/irqs.h       |    2 +
 arch/arm/mach-exynos/include/mach/map.h        |    3 +-
 arch/arm/plat-samsung/include/plat/dma-pl330.h |   16 +
 drivers/dma/Kconfig                            |    1 -
 drivers/dma/pl330.c                            | 1861
++++++++++++++++++++++
 11 files changed, 2199 insertions(+), 2136 deletions(-)
 delete mode 100644 arch/arm/common/pl330.c
