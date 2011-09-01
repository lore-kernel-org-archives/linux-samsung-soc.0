From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/6] Add device tree support for PL330 dma controller driver
Date: Thu, 01 Sep 2011 14:34:36 +0530
Message-ID: <1314867882-11755-1-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35425 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756233Ab1IAJEz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Sep 2011 05:04:55 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQU005XW6JBUO50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Sep 2011 18:04:53 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQU001MY6JYD0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Sep 2011 18:04:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, vinod.koul@intel.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

This patchset adds device tree support for PL330 driver and uses it
to add device tree support for Samsung platforms, specifically Exynos4.

First patch moves the pl330_filter function from Samsung specific wrappers
to pl330 dma driver and also adds a check to ensure that the filter function
proceeds only if it the dma channel being investigated belongs to pl330
dma controller instance.

Second patch adds support to infer the direction of the dma transfer
using the direction specified with the transfer request instead of
including this information in the platform data. This simlifies the
addition of device tree support. Third patch simplifies the platform
data for Exynos4 pl330 dma controllers. Similar patches simplifying
the platform data for other Samsung platforms is under development.

Fourth patch adds device tree support for pl330 dma controller driver.
A dma channel is represented using a phandle of the dma controller
node and the channel id within that controller. Client driver request
a dma channel using the phandle and channel id pair. Correspondingly,
the pl330 filter function has been modified to lookup a channel based
on this value.

Fifth patch adds device tree support for Samsung's DMA engine wrappers.
Client drivers retrive the channel property from their device node and
pass it to the wrappers. The wrapper functions use the property value
as the filter function parameter. Sixth patch restricts the usage of
pl330 device and platform data instances to non-dt platforms.

This patchset is based on Linux 3.1-rc3 with the following patch sets.

* To use DMA generic APIs for Samsung DMA - v7 - (15 patches)
* ARM: Samsung: use dma-pl330 device name for clock (3 patches)
* ARM: S5P64X0: Add the devname for DMA clock.
* ARM: SAMSUNG: register the second instance of PL330 DMAC (3 patches)

Changes since v1:
- Removed "arm,pl330-pdma" and "arm,pl330-mdma" compatible values.
- Removed "arm,primecell-periphid" and "arm,pl330-peri-reqs"
  property requirements.

Thomas Abraham (6):
  DMA: PL330: move filter function into driver
  DMA: PL330: Infer transfer direction from transfer request instead of platform data
  ARM: EXYNOS4: Modify platform data for pl330 driver
  DMA: PL330: Add device tree support
  ARM: SAMSUNG: Add device tree support for pl330 dma engine wrappers
  ARM: EXYNOS4: Limit usage of pl330 device instance to non-dt build

 .../devicetree/bindings/dma/arm-pl330.txt          |   29 +++
 arch/arm/mach-exynos4/Kconfig                      |    7 +
 arch/arm/mach-exynos4/Makefile                     |    3 +-
 arch/arm/mach-exynos4/dma.c                        |  223 ++++++--------------
 arch/arm/plat-samsung/dma-ops.c                    |   15 +-
 arch/arm/plat-samsung/include/plat/dma-ops.h       |    1 +
 arch/arm/plat-samsung/include/plat/dma-pl330.h     |    3 +-
 drivers/dma/pl330.c                                |  101 +++++----
 include/linux/amba/pl330.h                         |   15 +-
 9 files changed, 170 insertions(+), 227 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/arm-pl330.txt
